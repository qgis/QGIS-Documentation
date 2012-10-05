"""
/***************************************************************************
figures_in_rst.py
A script to move figures that are used in rst file to another folder
----------------------------------------------
begin                : 2012-10-05
written by           : Diethard Jansen, Raymond Nijssen
copyright            : (C) 2012 Quantum GIS Project
email                : diethard.jansen at gmail.com 
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 3 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""
import sys

def help():
    print 'figures_in_rst.py input.rst [path to move to]'

def find_figures(in_rst_file):
    figure_tag = '.. figure::'
    figures =[]
    for i_line in in_rst_file:
        if figure_tag in i_line:
            index_name_figure = i_line.strip().rindex(" ")
            figures.append(i_line[index_name_figure:].strip())
    result(figures)

def result(figures):
    if len(figures) != 0:
        print "Figures found:"
        for i_figure in figures:
            print i_figure
    else:
        print "No figures found!"


def main(in_rst_filename):
    '''does the processing'''
    print in_rst_filename
    in_rst_file = None
    try:
        in_rst_file = open(in_rst_filename)
    except IOError:
        print 'Error: rst file does not exist'

    find_figures(in_rst_file)

if __name__ == "__main__":
    
    # print sys.argv
    if len(sys.argv) > 1:
        filename = sys.argv[1]
        if filename == '--help' or filename == '-h':
            help()
        else:
            #print filename
            if (filename[-4:]).lower() == '.rst':
                if len(sys.argv) == 2:
                    main(filename)
            else:
                print sys.argv[0] + ' error: input filename is not correct. (must end with ".rst")'
    else:
        print sys.argv[0] + ' error: ' + 'No rst filename provided'
