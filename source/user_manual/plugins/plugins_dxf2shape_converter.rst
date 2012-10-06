
.. _`dxf2shape`:

Dxf2Shp Converter Plugin
========================


The dxf2shape converter plugin can be used to convert vector data from DXF to Shapefile 
format. It requires the following parameters to be specified before running:

*  **Input DXF file**: Enter path to the DXF file to be converted
*  **Output Shp file**: Enter desired name of the Shapefile to be created
*  **Output file type**: Specify the geometry type of the output Shapefile. 
   Currently supported types are polyline, polygon, and point.
*  **Export text labels**: When this checkbox is enabled, an additional 
   Shapefile point layer will be created, and the associated dbf table will 
   contain information about the "TEXT" fields found in the dxf file, and the text 
   strings themselves.

.. _figure_dxf2shape_1:
.. figure:: ../../../static/user_manual/plugins/dxf2shape_dialog.png
   :align: center
   :width: 30em

   Figure 1: Dxf2Shape Converter Plugin


**Using the Plugin**


  #.  Start QGIS, load the Dxf2Shape plugin in the Plugin Manager (see Section 
      :ref:`load_core_plugin`) and click on the |dxf2shp_converter| :sup:`Dxf2Shape 
      Converter` icon which appears in the QGIS toolbar menu. The Dxf2Shape plugin 
      dialog appears as shown in Figure_dxf2shape_1_.
  #.  Enter input DXF file, a name for the output Shapefile and the Shapefile type.
  #.  Enable the |checkbox| :guilabel:`Export text labels` checkbox if you want 
      to create an extra point layer with labels.
  #.  Click **[OK]**. 




