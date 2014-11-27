Shapes buffer
=============

Description
-----------

Creates buffer around features based on fixed distance or distance field.

Parameters
----------

``Shapes`` [vector: any]
  Input layer.

``Buffer Distance`` [selection]
  Buffering method.

  Options:

  * 0 --- [0] fixed value
  * 1 --- [1] attribute field

  Default: *0*

``Buffer Distance (Fixed)`` [number]
  Buffer distance for "fixed value" method.

  Default: *100.0*

``Buffer Distance (Attribute)`` [tablefield: any]
  Name of the distance field for "attribute field" method.

``Scaling Factor for Attribute Value`` [number]
  <put parameter description here>

  Default: *1.0*

``Number of Buffer Zones`` [number]
  Number of buffer(s) to generate.

  Default: *1.0*

``Circle Point Distance [Degree]`` [number]
  Smoothness of the buffer borders: great numbers means rough borders.

  Default: *5.0*

``Dissolve Buffers`` [boolean]
  Determines whether to dissolve results or not.

  Default: *True*

Outputs
-------

``Buffer`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:shapesbuffer', shapes, buf_type, buf_dist, buf_field, buf_scale, buf_zones, dcircle, dissolve, buffer)

See also
--------

