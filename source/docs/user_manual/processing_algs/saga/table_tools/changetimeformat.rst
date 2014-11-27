Change time format
==================

Description
-----------

Converts the time format of the input layer.

Parameters
----------

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
-------

``Output`` [table]
  The resulting table.

Console usage
-------------

::

  processing.runalg('saga:changetimeformat', table, field, fmt_in, fmt_out, output)

See also
--------

