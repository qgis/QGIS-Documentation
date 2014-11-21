Random selection within subsets
===============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: any]
  <put parameter description here>

``ID Field`` [tablefield: any]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Number of selected features
  * 1 --- Percentage of selected features

  Default: *0*

``Number/percentage of selected features`` [number]
  <put parameter description here>

  Default: *10*

Outputs
-------

``Selection`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:randomselectionwithinsubsets', input, field, method, number)

See also
--------

