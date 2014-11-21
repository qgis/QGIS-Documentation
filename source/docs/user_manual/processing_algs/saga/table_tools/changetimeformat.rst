Change time format
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Table`` [table]
  <put parameter description here>

``Time Field`` [tablefield: any]
  <put parameter description here>

``Input Format`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] hh.mm.ss
  * 1 --- [1] hh:mm:ss
  * 2 --- [2] hhmmss, fix size
  * 3 --- [3] hours
  * 4 --- [4] minutes
  * 5 --- [5] seconds

  Default: *0*

``Output Format`` [selection]
  <put parameter description here>

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
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:changetimeformat', table, field, fmt_in, fmt_out, output)

See also
--------

