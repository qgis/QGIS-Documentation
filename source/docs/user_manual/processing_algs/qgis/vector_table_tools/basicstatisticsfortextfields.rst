Basic statistics for text fields
================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input vector layer`` [vector: any]
  <put parameter description here>

``Field to calculate statistics on`` [tablefield: string]
  <put parameter description here>

Outputs
-------

``Statistics for text field`` [html]
  <put output description here>

``Minimum length`` [number]
  <put output description here>

``Maximum length`` [number]
  <put output description here>

``Mean length`` [number]
  <put output description here>

``Count`` [number]
  <put output description here>

``Number of empty values`` [number]
  <put output description here>

``Number of non-empty values`` [number]
  <put output description here>

``Number of unique values`` [number]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:basicstatisticsfortextfields', input_layer, field_name, output_html_file)

See also
--------

