Join attributes by location
===========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Target vector layer`` [vector: any]
  <put parameter description here>

``Join vector layer`` [vector: any]
  <put parameter description here>

``Attribute summary`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Take attributes of the first located feature
  * 1 --- Take summary of intersecting features

  Default: *0*

``Statistics for summary (comma separated)`` [string]
  <put parameter description here>

  Default: *sum,mean,min,max,median*

``Output table`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Only keep matching records
  * 1 --- Keep all records (including non-matching target records)

  Default: *0*

Outputs
-------

``Output layer`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:joinatributesbylocation', target, join, summary, stats, keep, output)

See also
--------

