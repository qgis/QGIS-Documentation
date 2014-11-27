Line properties
===============

Description
-----------

Calculates some information on each line of the layer.

Parameters
----------

``Lines`` [vector: line]
  Layer to analyze.

``Number of Parts`` [boolean]
  Determites whether to calculate number of segments in line.

  Default: *True*

``Number of Vertices`` [boolean]
  Determites whether to calculate number of vertices in line.

  Default: *True*

``Length`` [boolean]
  Determites whether to calculate total line lenght.

  Default: *True*

Outputs
-------

``Lines with Property Attributes`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:lineproperties', lines, bparts, bpoints, blength, output)

See also
--------

