Extract by location
===================

Description
-----------

<put algortithm description here>

Parameters
----------

``Layer to select from`` [vector: any]
  <put parameter description here>

``Additional layer (intersection layer)`` [vector: any]
  <put parameter description here>

``Include input features that touch the selection features`` [boolean]
  <put parameter description here>

  Default: *False*

``Include input features that overlap/cross the selection features`` [boolean]
  <put parameter description here>

  Default: *False*

``Include input features completely within the selection features`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

``Selection`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:extractbylocation', input, intersect, touches, overlaps, within, output)

See also
--------

