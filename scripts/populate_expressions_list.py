from os import path, walk
import glob
from sys import argv
import json
import re
import html

# To use this script clone the QGIS/QGIS repository, and checkout the release
# and run:
#
# python3 populate_expression.py [path/to/qgis/repository]
#
# If no argument is given, the script assumes that the QGIS repository is in the
# same folder as the QGIS-Documentation repository

# Determine the folder where the json files are
if len(argv) > 1:
    qgis_repo_path = argv[1]
else:
    qgis_repo_path = path.join(path.dirname(__file__), '..', '..', 'QGIS')
help_folder = path.join(qgis_repo_path, 'resources/function_help/json')
# expression help folder
output_folder = path.join(path.dirname(__file__), '..', 'docs/user_manual/expressions/expression_help')
# images file location
img_list_file = path.join(path.dirname(__file__), '..', 'docs/user_manual/expressions/expression_help/img/images_list.json')
algorithm_folder = path.join(path.dirname(__file__), '..', 'docs/user_manual/processing_algs')

def sphynxify_html(text, base_indent=0):
    filler = base_indent * ' '

    # Format paragraphs and breaks
    text = text.replace('<p>', '\n\n'+ filler)
    text = text.replace('</p>', '\n')
    text = re.sub(r"<br\s?\/?>", '\n\n'+ filler, text)

    # Format unsorted lists
    text = text.replace('<ul>', '\n\n')
    text = text.replace('</ul>', '\n')
    text = text.replace('<li>', filler + '* ')
    text = text.replace('</li>', '\n')

    # Format bold and italic
    text = re.sub(r"<\/?b>", '**', text)
    text = re.sub(r"<\/?i>", '*', text)

    # Format inline code
    text = re.sub(r"<\/?code>", '``', text)

    # Ignore code block
    text = text.replace('<pre>', '\n\n'+ filler)
    text = text.replace('</pre>', '\n\n')

    # Format tables
    text = text.replace('<table>', '\n\n'+ filler + '.. csv-table::\n')
    text = text.replace('<thead>', filler + '   :header-rows: 1\n' + filler + \
                                   '   :widths: 20, 80\n\n')
    text = re.sub(r'<tr[^>]*>', filler + '   ', text)
    text = re.sub(r'</t[hd]><t[hd]>', '", "', text)
    text = text.replace('</tr>', '\n')
    text = re.sub(r"<\/?t[hd]>", '"', text)
    text = re.sub(r"<\/(thead|table)>", '', text)

    # Format <a> links
    text = re.sub(r"<a href='(.*?)'>(.*?)</a>", r"`\2 <\1>`_", text)

    # Format html special characters (e.g. &lt;)
    text = html.unescape(text)

    return text

def escape_colliding_functions(f_name):
    # Escape operators which are rst special characters

    return ''.join(['\\', f_name]) if f_name in ['*', '-', '+', '||'] else f_name

def format_function(function_dict):
    f_name = function_dict['name']
    if not 'variants' in function_dict:
        # No variants make a list with a single function call
        variants = [function_dict]
    else:
        # Multiple function calls
        variants = function_dict['variants']

    text = ''
    for variant in variants:
        # Format each function variant and add it to the function text
        text += format_variant(variant, f_name)
    return text

def format_variant(function_dict, f_name):

    # Organize arguments
    arg_syntax_list = []
    arg_description_list = []
    optional_args = False
    variable_args = ''
    if 'arguments' in function_dict:
        for arg in function_dict['arguments']:
            if "optional" in arg and arg["optional"]:
                if "default" in arg:
                    default = f'={arg["default"]}'
                else:
                    default = ''
                arg_text = f'[{arg["arg"]}{default}]'
                optional_args = True
            else:
                arg_text = arg['arg']
            if 'syntaxOnly' in arg:
                arg_syntax_list.append(arg_text)
                variable_args = ', ...'
            elif 'descOnly' in arg:
                arg_description_list.append(f"**{arg['arg']}** - {sphynxify_html(arg['description'],9)}")
            else:
                arg_syntax_list.append(arg_text)
                arg_description_list.append(f"**{arg['arg']}** - {sphynxify_html(arg['description'],9)}")

    # Prepare syntax and arguments strings
    syntax = f'   * - Syntax\n     - '
    if len(arg_syntax_list) > 0:
        if 'type' in function_dict and function_dict['type'] == 'operator':
            if f_name =='[]':
                syntax += f'[{arg_syntax_list[0]}]\n'
            elif len(arg_syntax_list) == 1:
                syntax += f'{f_name} {arg_syntax_list[0]}\n'
            elif len(arg_syntax_list) == 2:
                syntax += f'{arg_syntax_list[0]} {f_name} {arg_syntax_list[1]}\n'
        else:
            syntax += f'{f_name}({", ".join(arg_syntax_list)}{variable_args})\n'

        descriptions = '\n       * '.join(arg_description_list)
        arguments = (f"   * - Arguments\n"
                     f"     - * {descriptions}\n")
    elif f_name.startswith("$") or ('type' in function_dict and function_dict['type'] == 'value'):
        syntax += f"{f_name}\n"
        arguments = ''
    else:
        syntax += f"{f_name}()\n"
        arguments = ''

    if optional_args:
        syntax += '\n       [] marks optional arguments\n'

    if 'type' in function_dict and function_dict['type'] == 'expression':
        syntax = ''

    # Prepare examples
    if 'examples' in function_dict:
        ex_list = []
        for ex in function_dict['examples']:

            # backticks do not escape backslash so let's do it before pulling example text
            example_backslashed = ex['expression'].replace('\\\\', '\\')
            example = f"``{sphynxify_html(example_backslashed)}`` → {ex['returns']}"

            if 'note' in ex:
                example += f"\n\n         {sphynxify_html(ex['note'])}"

            ex_list.append(example)

        examples = "   * - Examples\n     - * " + "\n       * ".join(ex_list)
    else:
        examples = ''

    if 'variant' in function_dict:
        v_description = (f"**{function_dict['variant']}**\n\n"
                         f"{function_dict['variant_description']}\n\n")
    else:
        v_description = ''

    if 'notes' in function_dict:
        notes = f"\n\n.. note:: {sphynxify_html(function_dict['notes'])}"
    else:
        notes = ''

    text = (f"{v_description}"
            f".. list-table::\n"
            f"   :widths: 15 85\n"
            f"\n"
            f"{syntax}"
            f"{arguments}"
            f"{examples}"
            f"{notes}"
            f"\n\n\n")
    return text

def create_function_anchor(func, group):
    """
    Returns function unique identifier
    :param func: The function in use
    :param group: The group it belongs to
    :return: unique identifier of the function based on its name and group
    """
    return "expression_function_{}_{}".format(group, functions[func]['filename']).replace(' ','_')

def find_img_path(anchor):
    """
    Locate the corresponding image file for the expression function
    and format the text to include in the help file
    :param anchor: The identifier of the expression function
    :return: 'absolute' path to the file within the repo
    """

    img_path=''
    # For image files in the expression help img folder
    if anchor['img']:
        temp_path = path.join(output_folder, 'img', anchor['img']+'.*')
        if glob.glob(temp_path):
            img_path = temp_path.split('..')[-1]
    # For image files from the algorithm folder
    elif anchor['alg_img']:
        temp_path = path.join(algorithm_folder, '**', anchor['alg_img']+'.*')
        if glob.glob(temp_path, recursive=True):
            img_path = glob.glob(temp_path, recursive=True)[0].split('..')[-1]

    return img_path

# Load list of referenced expression and images
with open(img_list_file) as f:
    img_data = json.load(f)

# Get a list of all files on that folder

(_, _, filenames) = next(walk(help_folder))

# Store groups and functions in memory
groups = {}
functions = {}
for file in filenames:
    filepath = path.join(help_folder, file)
    with open(filepath) as f:
        data = json.load(f)
    #print(data)
    data['filename'] = file.replace('op_', '')
    if data['type'] == 'group':
        groups[data['name']] = {'description': data['description'], 'func_list': {}}
    elif data['type'] in ['function', 'expression', 'operator', 'value']:
        functions[data['name']] = data
    else:
        print(f'{data["name"]} is not a group, a function, a value or an operator. It is a {data["type"]}.')

# Distribute functions by the groups
for f_name in functions.keys():
    function = functions[f_name]
    if 'groups' in function:
        for g_name in function['groups']:
            if g_name not in ('deprecated'):
                # Assign anchor value to function key
                groups[g_name]['func_list'][function['name']] = create_function_anchor(f_name, g_name)
            else:
                print(f'Warning: Function {function["name"]} is deprecated!')
    else:
        print(f'Warning: Function {function["name"]} has no group!')
    #    print(group)

for g_name in groups:
    func_list = groups[g_name]['func_list']
    if len(func_list) < 1:
        continue
    # Sort list of functions, maintaining e.g. $geometry and geometry functions closer
    func_list = {key: val for key, val in sorted(func_list.items(), key = lambda ele: ele[0].strip('$'))}
    output_group_file = path.join(output_folder, g_name.replace(' ','_') + '.rst')
    with open(output_group_file, 'w') as f:
        f.write(f":orphan:\n\n"
                f".. DO NOT EDIT THIS FILE DIRECTLY. It is generated automatically by\n"
                f"   populate_expressions_list.py in the scripts folder.\n"
                f"   Changes should be made in the function help files\n"
                f"   in the resources/function_help/json/ folder in the\n"
                f"   qgis/QGIS repository.\n\n")
        for f_name in func_list:
            f_description = sphynxify_html(functions[f_name]['description'])
            f.write(f".. _{func_list[f_name]}:\n\n"
                    f"{escape_colliding_functions(f_name)}\n"
                    f"{'.'* (len(escape_colliding_functions(f_name)))}\n\n"
                    f"{f_description}\n"
                    f"\n")
            text = format_function(functions[f_name])
            f.write(text)
            # Insert reference to image if any correct one filled
            if func_list[f_name] in img_data.keys():
                if find_img_path(img_data[func_list[f_name]]):
                    f.write(f".. figure:: {find_img_path(img_data[func_list[f_name]])}\n"
                            f"   :align: center\n\n"
                            f"   {img_data[func_list[f_name]]['caption']}\n\n")

            f.write(f".. end_{f_name.replace(' ', '_')}_section\n\n")
