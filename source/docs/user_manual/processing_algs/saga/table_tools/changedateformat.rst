Change date format
==================

Description
-----------

Converts the date format of the input layer.

Parameters
----------

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
-------

``Output`` [table]
  The resulting table.

Console usage
-------------

::

  processing.runalg('saga:changedateformat', table, field, fmt_in, fmt_out, output)

See also
--------

