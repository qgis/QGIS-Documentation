Information
===========

Description
-----------

Creates an information file that lists information about an OGR-supported
data source. The output will be shown in a 'Result' window and can be written
into a HTML-file.
The information includes the geometry type, feature count, the spatial extent,
the projection information and many more.

Parameters
----------

``Input layer`` [vector: any]
  Input vector layer.

Outputs
-------

``Layer information`` [html]
  Name of the output HTML-file that includes the file information.
  If no HTML-file is defined the output will be written into a temporary file.

Console usage
-------------

::

  processing.runalg('gdalogr:information', input, output)

See also
--------

