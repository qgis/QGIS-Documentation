#!/usr/bin/env python3

from sys import argv
from os import path
from datetime import date

import requests
# import yaml

# This script downloads the statistics of localization of the project
# from Transifex.
# To be able to use it, you need to provide your user account token
# and run `python3 scripts/load_tx_stats.py <TX_TOKEN>` from the repo
# main folder. See https://transifex.github.io/openapi/index.html

# Catch the Transifex api token value
# (passed as argument to the python command)
if len(argv) > 1:
    TX_TOKEN = argv[1]

headers = {'Authorization': 'Bearer ' + TX_TOKEN}
project_id = "o:qgis:p:qgis-documentation"

def build_languages_list():
    """
    Fetch languages available in Transifex
    :return: A dict with languages code and name
    """

    # Load target languages of the QGIS Documentation project from Transifex
    target_languages = requests.get(
        f"https://rest.api.transifex.com/projects/{project_id}/languages",
        headers=headers
        )
    target_languages = target_languages.json()

    # Fetch list of languages
    languages_list = {}
    for lang in target_languages['data']:
        code = lang['attributes']['code']
        languages_list[code] = {'name': lang['attributes']['name']}

    # Add English to the list
    languages_list['en'] = {'name': 'English'}
    # Sort by language name for a better display in docs
    languages_list = {k: v for k, v in sorted(
        languages_list.items(),
        key=lambda item: item[1]['name'])
    }
    return languages_list


def extract_language_stats(lang):
    """
    Extracts statistics for available language,
    namely the number of translated strings and calculates percentage
    :param lang: the language code
    :return: dict elements with number of translated strings and the corresponding ratio
    """

    resource_language_stats = requests.get(
        f"https://rest.api.transifex.com/resource_language_stats?"
        f"filter[project]={project_id}&filter[language]=l:{lang}",
        headers=headers)
    all_resources = walk_pagination(resource_language_stats)
    # print('all resources ', len(all_resources))

    translated_strings = 0
    total_strings = 0
    for resource in all_resources:
        translated_strings += resource['attributes']['translated_strings']
        total_strings += resource['attributes']['total_strings']

    # For actual translated strings we need to ignore the notranslate ones
    # which are actually counted as translated after there is one really translated string
    if translated_strings:
        translated_strings -= total_notranslate
    percentage = round(
        translated_strings * 100 / (total_strings - total_notranslate),
        2)

    return {'translated_strings': translated_strings,
            'percentage': percentage,
           }


def count_untranslatable_resources():
    """
    Returns count of strings tagged as notranslate
    """

    # Load target languages of the QGIS Documentation project from Transifex
    project_resources = requests.get(
        f"https://rest.api.transifex.com/resources?filter[project]={project_id}",
        headers=headers
        )
    all_project_resources = walk_pagination(project_resources)
    # print('all_project_resources ', all_project_resources)

    total_notranslate = 0
    for resource in all_project_resources:
        resource_slug = resource['attributes']['slug']
        notranslate_strings = requests.get(
            f"https://rest.api.transifex.com/resource_strings?"
            f"filter[resource]={project_id}:r:{resource_slug}&filter[tags][all]=notranslate",
            headers=headers
            )
        all_notranslate_strings = walk_pagination(notranslate_strings)
        total_notranslate += len(all_notranslate_strings)

    print('notranslate    ', total_notranslate)
    return total_notranslate


def walk_pagination(results):
    """
    Fetch data from Transifex API across the pages
    :param results: the request response
    :return: complete and formatted response
    """

    results = results.json()
    results_data = results['data']
    # Walk through pagination
    while 'next' in results['links'].keys():
        if results['links']['next'] == None:
            break
        results = requests.get(
            results['links']['next'],
            headers=headers
            ).json()
        results_data.extend(results['data'])

    # print('end of while ', len(results_data))
    return results_data


def project_stats(languages):
    """
    Calculates stats at the project level
    """

    # Number of target translation languages declared in Transifex for the project
    nb_languages = len(languages) - 1
    # Total number of strings in English to actually translate
    total_strings = languages['en']['translated_strings']
    # translation percentage of the whole project, let's not count 'en'
    total_translated_strings = sum(
        languages[lang]['translated_strings']
        for lang in languages if lang != 'en')
    global_percentage = round(
        total_translated_strings*100/(total_strings * nb_languages), 2)

    # print('all ', language_rate)
    return {'nb_languages': nb_languages,
            'total_strings': total_strings,
            'translated_strings': total_translated_strings,
            'percentage': global_percentage,
           }


def load_lang_stats(target_langs, nb_columns=1):
    """
    Formats statistics of translated languages into a multi-column table
    :param target_langs: list of languages available in the project
    :param nb_columns: number of columns in the table
    :return: a formatted table with full text language and percentage of translation
    """

    text = (".. list-table::\n"
            "   :widths: auto\n"
            "\n"
            "   * - Language\n     - Translation ratio (%)\n"
            )
    # Add more columns
    text += (
        "     - Language\n     - Translation ratio (%)\n" * (nb_columns - 1)
        )

    i = 1
    for lang in target_langs:
        if lang != 'en':
            if i % nb_columns == 1 or nb_columns == 1:
                text += (f"   * - {target_langs[lang]['name']}\n")
            else:
                text += (f"     - {target_langs[lang]['name']}\n")

            text += (f"     - |stats_{lang}|\n")
            i += 1

    # Add empty cells to keep a well formatted rst table
    # when the number of target languages is not a multiple
    # of the number of columns
    nb_languages = target_langs['en']['nb_languages']
    if nb_languages % nb_columns:
        remaining_cells = nb_columns - (nb_languages % nb_columns)
        text += ("     -\n     -\n" * remaining_cells)

    return text


def load_lang_substitutions(target_langs):
    """
    Create list of substitutions for the statistics
    :param target_langs: the list of available languages
    :return: formated list of text substitutions
    """

    text = (f".. list of substitutions for the statistics:\n\n"
            f".. |today| replace:: *{date.today()}*\n"
            f".. |total_strings| replace:: **{target_langs['en']['total_strings']}**\n"
            f".. |nb_languages| replace:: **{target_langs['en']['nb_languages']}**\n"
            f".. |global_percentage| replace:: **{target_langs['en']['percentage']}%**\n\n"
            )

    for lang in sorted(target_langs):
        if lang != 'en':
            text += (f".. |stats_{lang}| replace:: {target_langs[lang]['percentage']}\n")

    return text


#Fetch count of the notranslate strings
total_notranslate = count_untranslatable_resources()
# Let's pull the stats for each language now
language_rate = build_languages_list()
for lang in language_rate:
    language_rate[lang].update(
        extract_language_stats(lang),
        )
#Add global stats to English language
language_rate['en'].update(project_stats(language_rate))

print('language_rate', language_rate)

# Store the stats as a table in a rst file
statsfile = path.join(path.dirname(__file__),
                      '..',
                      'docs/about/translation_stats.rst'
                      )
with open(statsfile, 'w') as f:
    f.write(f":orphan:\n\n"
            f".. DO NOT EDIT THIS FILE DIRECTLY."
            f" It is generated automatically by\n"
            f"   load_tx_stats.py in the scripts folder.\n\n"
            f"Statistics of translation\n"
            f"===========================\n\n"

            f"*Last update:* |today|"
            f"\n\n"
            f".. list-table::\n"
            f"   :widths: auto\n\n"
            f"   * - Number of strings\n"
            f"     - Number of target languages\n"
            f"     - Overall Translation ratio\n"
            f"   * - |total_strings|\n"
            f"     - |nb_languages|\n"
            f"     - |global_percentage|\n\n"
            f"\n\n"
            f"{load_lang_stats(language_rate, nb_columns=3)}"
            f"\n\n"
            f"{load_lang_substitutions(language_rate)}"
            f"\n"
            )
