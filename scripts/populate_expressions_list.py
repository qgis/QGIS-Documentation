from os import path, walk
import json

# Determine the folder where the json files are
qgis_repo_path = path.abspath('/home/aneto/qgis/repos/QGIS')
help_folder = path.join(qgis_repo_path,'resources/function_help/json')
# expression help folder
output_folder = path.abspath('./docs/user_manual/working_with_vector/expression_help')

def format_function(group, function_dict):
    f_name = function_dict['name']
    f_description = function_dict['description']
    
    # Organize arguments
    arg_syntax_list = []
    arg_description_list = []
    variable_args = ''
    if 'arguments' in function_dict:
        for arg in function_dict['arguments']:
            if 'syntaxOnly' in arg:
                arg_syntax_list.append(arg['arg'])
                variable_args = ', ...'
            elif 'descOnly' in arg:
                arg_description_list.append(f"**{arg['arg']}** - {arg['description']}")
            else:
                arg_syntax_list.append(arg['arg'])
                arg_description_list.append(f"**{arg['arg']}** - {arg['description']}")
    
    # Prepare syntax and arguments strings
    if len(arg_syntax_list) > 0:
        syntax = f'{f_name}({", ".join(arg_syntax_list)}{variable_args})'
        descriptions = '\n\n       * '.join(arg_description_list)
        arguments = (f"   * - Arguments\n"
                     f"     - * {descriptions}\n"
                     f"\n")
    elif f_name.startswith("$"):
        syntax = f_name
        arguments = ''
    else:
        syntax = f"{f_name}()" 
        arguments = ''
    
    # Prepare examples
    if 'examples' in function_dict:
        ex_list = [f"{ex['expression']} → {ex['returns']}" for ex in function_dict['examples']]
        examples = "   * - Examples\n     - * "+ "\n\n       * ".join(ex_list)
    else:
        examples = ''
      
    text = (f".. _expression_function_{group.replace(' ','_')}_{f_name}:\n\n"
            f"{f_name}\n"
            f"{'.'* len(f_name)}\n"
            f"\n"
            f"{f_description}\n"
            f"\n"
            f".. list-table::\n"
            f"   :widths: 15 85\n"
            f"   :stub-columns: 1\n"
            f"\n"
            f"   * - Syntax\n"
            f"     - {syntax}\n"
            f"\n"
            f"{arguments}"
            f"{examples}"
            f"\n\n\n")
    return text
        
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
    if data['type'] == 'group':
        groups[data['name']] = {'description': data['description'], 'func_list': []}
    elif data['type'] == 'function':
        functions[data['name']] = data
    else:
        print(f'{data["name"]} is not a group or a function. It is a {data["type"]}')

# Distribute functions by the groups
for f_name in functions.keys():
    function = functions[f_name]
    if 'groups' in function:
        for g_name in function['groups']:
            if g_name not in ('deprecated'):
                groups[g_name]['func_list'].append(function['name'])
            else:
                print(f'Warning: Function {function["name"]} is deprecated!')
    else:
        print(f'Warning: Function {function["name"]} has no group!')
    #    print(group)

for g_name in groups:
    func_list = groups[g_name]['func_list']
    if len(func_list) < 1:
        continue
    func_list.sort()
    output_group_file = path.join(output_folder, g_name.replace(' ','_') + '.rst')
    with open(output_group_file, 'w') as f:
        f.write(':orphan:\n\n')
        for f_name in func_list:
            f.write(f'.. {f_name}_section\n\n')
            text = format_function(g_name, functions[f_name])
            f.write(text)
            f.write(f'.. end_{f_name}_section\n\n')