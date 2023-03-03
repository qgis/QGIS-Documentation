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

# Load target languages of the QGIS Documentation project from transifex
target_languages = requests.get(
    f"https://rest.api.transifex.com/projects/{project_id}/languages",
    headers=headers
    )
target_languages = target_languages.json()
# Where we store statistics of each language
language_rate = {}

# Fetch list of languages
for lang in target_languages['data']:
    code = lang['attributes']['code']
    language_rate[code] = {'name': lang['attributes']['name']}

# Add English to the list
language_rate['en'] = {'name': 'English'}
# Sort by language name for a better display in docs
language_rate = {k: v for k, v in sorted(
    language_rate.items(),
    key=lambda item: item[1]['name'])
}
# print(language_rate, ' counts ', len(language_rate))

# Extract statistics for every single available languages,
# namely their number of translated strings
for lang in language_rate:
    # print('LANG  ', language_rate[lang]['name'])
    translated_strings = 0
    total_strings = 0

    resource_language_stats = requests.get(
        f"https://rest.api.transifex.com/resource_language_stats?"
        f"filter[project]={project_id}&filter[language]=l:{lang}",
        headers=headers)
    resource_language_stats = resource_language_stats.json()

    all_resources = resource_language_stats['data']

    # Walk through pagination
    while 'next' in resource_language_stats['links'].keys():
        resource_language_stats = requests.get(
            resource_language_stats['links']['next'],
            headers=headers
            ).json()
        all_resources.extend(resource_language_stats['data'])

    for resource in all_resources:
        translated_strings += resource['attributes']['translated_strings']
        total_strings += resource['attributes']['total_strings']

    language_rate[lang]['translated_strings'] = translated_strings
    language_rate[lang]['percentage'] = round(
        translated_strings * 100 / total_strings, 2)
    # Keep total count of available strings in 'en' only,
    # no need to store multiple times
    if lang == 'en':
        language_rate[lang]['total_strings'] = total_strings

# print(language_rate)

# Stats for the whole project (== English source language)
# Number of target translation languages declared in Transifex for the project
nb_languages = len(language_rate) - 1
# Total number of strings in English to translate
total_strings = language_rate['en']['total_strings']
# translation percentage of the whole project, let's not count 'en'
total_translated_strings = sum(
    language_rate[lang]['translated_strings']
    for lang in language_rate if lang != 'en')
global_percentage = round(
    total_translated_strings*100/(total_strings * nb_languages), 2)

language_rate['en'].update(
    {'nb_languages': nb_languages,
     'translated_strings': total_translated_strings,
     'percentage': global_percentage
     }
    )

# print('all ', language_rate)


def load_overall_stats():
    """Format statistics of translation in the project"""

    text = (f".. list-table::\n"
            f"   :widths: auto\n"
            f"\n"
            f"   * - Number of strings\n"
            f"     - Number of target languages\n"
            f"     - Overall Translation ratio\n"
            f"   * - |total_strings|\n"
            f"     - |nb_languages|\n"
            f"     - |global_percentage|\n"
            "\n")

    return text


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
            "   * - Language\n"
            "     - Translation ratio (%)\n")
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
            f".. |total_strings| replace:: **{total_strings}**\n"
            f".. |nb_languages| replace:: **{nb_languages}**\n"
            f".. |global_percentage| replace:: **{global_percentage}%**\n\n"
            )

    for lang in target_langs:
        if lang != 'en':
            text += (f".. |stats_{lang}| replace:: {target_langs[lang]['percentage']}\n")

    return text

# Store the stats as a table in a rst file
statsfile = path.join(path.dirname(__file__),
                      '..',
                      'docs/user_manual/preamble/translation_stats.rst'
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
            f"{load_overall_stats()}"
            f"\n\n"
            f"{load_lang_stats(language_rate, nb_columns=3)}"
            f"\n\n"
            f"{load_lang_substitutions(language_rate)}"
            f"\n"
            )
