Basic statistics for numeric fields
===================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input vector layer`` [vector: any]
  <put parameter description here>

``Field to calculate statistics on`` [tablefield: numeric]
  <put parameter description here>

Outputs
-------

``Statistics for numeric field`` [html]
  <put output description here>

``Coefficient of Variation`` [number]
  <put output description here>

``Minimum value`` [number]
  <put output description here>

``Maximum value`` [number]
  <put output description here>

``Sum`` [number]
  <put output description here>

``Mean value`` [number]
  <put output description here>

``Count`` [number]
  <put output description here>

``Range`` [number]
  <put output description here>

``Median`` [number]
  <put output description here>

``Number of unique values`` [number]
  <put output description here>

``Standard deviation`` [number]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:basicstatisticsfornumericfields', input_layer, field_name, output_html_file)

See also
--------

