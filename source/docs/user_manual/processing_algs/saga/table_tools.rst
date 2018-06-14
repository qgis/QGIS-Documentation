.. only:: html

   |updatedisclaimer|

Table tools
===========

.. only:: html

   .. contents::
      :local:
      :depth: 1

Change date format
------------------

Description
...........

Converts the date format of the input layer.

Parameters
..........

``Table`` [table]
  Input table.

``Date Field`` [tablefield: any]
  Attribute the date.

``Input Format`` [selection]
  Input date format.

  Options:

  * 0 --- [0] dd.mm.yy
  * 1 --- [1] yy.mm.dd
  * 2 --- [2] dd:mm:yy
  * 3 --- [3] yy:mm:dd
  * 4 --- [4] ddmmyyyy, fix size
  * 5 --- [5] yyyymmdd, fix size
  * 6 --- [6] ddmmyy, fix size
  * 7 --- [7] yymmdd, fix size
  * 8 --- [8] Julian Day

  Default: *0*

``Output Format`` [selection]
  Output date format.

  Options:

  * 0 --- [0] dd.mm.yy
  * 1 --- [1] yy.mm.dd
  * 2 --- [2] dd:mm:yy
  * 3 --- [3] yy:mm:dd
  * 4 --- [4] ddmmyyyy, fix size
  * 5 --- [5] yyyymmdd, fix size
  * 6 --- [6] ddmmyy, fix size
  * 7 --- [7] yymmdd, fix size
  * 8 --- [8] Julian Day

  Default: *0*

Outputs
.......

``Output`` [table]
  The resulting table.

Console usage
.............

::

  processing.runalg('saga:changedateformat', table, field, fmt_in, fmt_out, output)

See also
........

Change time format
------------------

Description
...........

Converts the time format of the input layer.

Parameters
..........

``Table`` [table]
  Input table.

``Time Field`` [tablefield: any]
  Attribute with time.

``Input Format`` [selection]
  Input time format.

  Options:

  * 0 --- [0] hh.mm.ss
  * 1 --- [1] hh:mm:ss
  * 2 --- [2] hhmmss, fix size
  * 3 --- [3] hours
  * 4 --- [4] minutes
  * 5 --- [5] seconds

  Default: *0*

``Output Format`` [selection]
  Output time format.

  Options:

  * 0 --- [0] hh.mm.ss
  * 1 --- [1] hh:mm:ss
  * 2 --- [2] hhmmss, fix size
  * 3 --- [3] hours
  * 4 --- [4] minutes
  * 5 --- [5] seconds

  Default: *0*

Outputs
.......

``Output`` [table]
  The resulting table.

Console usage
.............

::

  processing.runalg('saga:changetimeformat', table, field, fmt_in, fmt_out, output)

See also
........


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
