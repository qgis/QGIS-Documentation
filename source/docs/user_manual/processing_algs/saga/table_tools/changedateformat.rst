Change date format
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Table`` [table]
  <put parameter description here>

``Date Field`` [tablefield: any]
  <put parameter description here>

``Input Format`` [selection]
  <put parameter description here>

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
  <put parameter description here>

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
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:changedateformat', table, field, fmt_in, fmt_out, output)

See also
--------

