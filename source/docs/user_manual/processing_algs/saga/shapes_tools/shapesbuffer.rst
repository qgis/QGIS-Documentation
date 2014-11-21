Shapes buffer
=============

Description
-----------

<put algortithm description here>

Parameters
----------

``Shapes`` [vector: any]
  <put parameter description here>

``Buffer Distance`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] fixed value
  * 1 --- [1] attribute field

  Default: *0*

``Buffer Distance (Fixed)`` [number]
  <put parameter description here>

  Default: *100.0*

``Buffer Distance (Attribute)`` [tablefield: any]
  <put parameter description here>

``Scaling Factor for Attribute Value`` [number]
  <put parameter description here>

  Default: *1.0*

``Number of Buffer Zones`` [number]
  <put parameter description here>

  Default: *1.0*

``Circle Point Distance [Degree]`` [number]
  <put parameter description here>

  Default: *5.0*

``Dissolve Buffers`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Buffer`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:shapesbuffer', shapes, buf_type, buf_dist, buf_field, buf_scale, buf_zones, dcircle, dissolve, buffer)

See also
--------

