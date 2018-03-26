#!/usr/bin/env python3
from  os import path, walk
import re

def find_by_ext(folder, extension):
    """
    create list with absolute paths to all *.extension files inside
    folder and its sub-folders
    """
    found_files = [path.join(dirpath, f)
        for dirpath, dirnames, files in walk(folder)
        for f in files if f.endswith('.' + extension)]
    return found_files

def get_subst_from_file(file):
    """
    Returns sorted list of existing substitutions on a file
    :param file: string with path to file
    :return: list
    """

    # defines a pattern for a substitution
    # anything inside || except is preceded by ..
    s_pattern = re.compile(r"(?<!\.\. )\|([\w\d]+)\|")
    s_title = re.compile(r"\.\. Substitutions definitions - AVOID EDITING "
                         r"PAST THIS LINE\n")
    subs = []
    with open(file, 'r+') as f:
        pos = f.tell()
        line = f.readline()
        while line is not "":
            if s_title.match(line) is not None:
                f.seek(pos-2)
                f.truncate()
                break
            else:
                subs += s_pattern.findall(line)
                pos = f.tell()
                line = f.readline()
                # Making sure there is a newline at the end of the file
                if line == "" and len(subs)>0:
                    f.seek(pos-1)
                    if f.read() != "\n":
                        f.write("\n")
    list_subs = list(set(subs))
    list_subs.sort()
    return list_subs

def get_subst_definition(subst_list, s_dict):
    """
    returns substitution definition from list
    :param subst_list: list of necessary substitutions
    :param s_dict: dictionary with all substitutions
    :return: string with substitution definitions needed to add in rst file
    """
    global file

    s_def = "\n\n.. Substitutions definitions - AVOID EDITING PAST THIS " \
            "LINE\n" \
            "   This will be automatically updated by the find_set_subst.py " \
            "script.\n" \
            "   If you need to create a new substitution manually,\n" \
            "   please add it also to the substitutions.txt file in the\n" \
            "   source folder.\n\n"
    d = s_dict
    s_count = 0
    for subst in subst_list:
        if subst in d:
            s = d[subst]
            if 'image' in s:
                s_def += '.. |{}| image:: {}\n'.format(subst, s['image'])
                if 'width' in s:
                    s_def += '   :width: {}\n'.format(s['width'])
            elif 'replace' in s:
                s_def += '.. |{}| replace:: {}\n'.format(subst, s['replace'])
            elif 'unicode' in s:
                s_def += '.. |{}| unicode:: {}\n   :ltrim:\n'.format(subst,
                                                             s['unicode'])
            s_count += 1
        else:
            print("\033[91m\033[1m|{}|\033[0m is not available in "
                  "substitution.txt file, please add it before use it in "
                  "\033[93m\033[1m{}\033[0m".format(subst, path.relpath(file)))
    if s_count == 0:
    # No substitution found in dict
        s_def = None
    return s_def

def read_subst(file):
    """
    Returns dictionary with all available substitutions
    :param file: file with substitutions in sphinx format
    :return: dictionary with substitutions in more scriptable format
    """

    subs_dict = dict()

    # Create patterns for image, width and replace substitutions
    image_pattern = re.compile(r"\.\. \|([\w\d\s]+)\|\s+image::\s+([^\n]+)")
    width_pattern = re.compile(r"\s+:width:\s+([^\n]+)")
    replace_pattern = re.compile(r"\.\. \|([\w\d\s]+)\|\s+replace::\s+([^\n]+)")
    unicode_pattern = re.compile(r"\.\. \|([\w\d\s]+)\|\s+unicode::\s+([^\n]+)")

    # read substitutions file line by line searching for pattern matches
    with open (file, "r") as f:
        for line in f:
            if image_pattern.match(line) is not None:
                # Adds new image object to dictionary
                m = image_pattern.match(line)
                subs_name = m.group(1)
                subs_dict[subs_name] = dict()
                subs_dict[subs_name]['image'] = m.group(2)
            elif width_pattern.match(line) is not None:
                # complements last image object
                m = width_pattern.match(line)
                subs_dict[subs_name]['width'] = m.group(1)
            elif replace_pattern.match(line) is not None:
                # Adds new replace object to dictionary
                m = replace_pattern.match(line)
                subs_dict[m.group(1)] = dict()
                subs_dict[m.group(1)]['replace'] = m.group(2)
            elif unicode_pattern.match(line) is not None:
                # Adds new unicode replace object to dictionary
                m = unicode_pattern.match(line)
                subs_dict[m.group(1)] = dict()
                subs_dict[m.group(1)]['unicode'] = m.group(2)

    return subs_dict

def append_subst(file, subst_definition):
    """
    Adds substitution definition to the end of rst file
    :param file: path to rst file
    :param subst_definition: string with substitution definitions for file
    :return:
    """
    if subst_definition is not None:
        with open(file, 'a') as f:
            f.write(subst_definition)

if __name__ == '__main__':
    src_path =  path.abspath(path.join(__file__ ,"../../source"))
    subst_file_path = path.join(src_path,"substitutions.txt")
    s_dict = read_subst(subst_file_path)
    for file in find_by_ext(src_path, 'rst'):
        s_list = get_subst_from_file(file)
        if len(s_list) > 0:
            s_definition = get_subst_definition(s_list, s_dict)
            append_subst(file, s_definition)
