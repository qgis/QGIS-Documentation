|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _dxf2shape:

Dxf2Shp Converter Plugin
========================

The dxf2shape converter plugin can be used to convert vector data from DXF to
shapefile format. It requires the following parameters to be specified before
running:

.. _figure_dxf2shape_1:

.. only:: html

   **Figure Dxf2Shape 1:**

.. figure:: /static/user_manual/plugins/dxf2shape_dialog.png
   :align: center

   Dxf2Shape Converter Plugin

* **Input DXF file**: Enter the path to the DXF file to be converted.
* **Output Shp file**: Enter desired name of the shapefile to be created.
* **Output file type**: Specify the geometry type of the output shapefile.
  Currently supported types are polyline, polygon, and point.
* **Export text labels**: When this checkbox is enabled, an additional
  shapefile point layer will be created, and the associated DBF table will
  contain information about the "TEXT" fields found in the DXF file, and the text
  strings themselves.

Using the Plugin
----------------

#. Start |qg|, load the Dxf2Shape plugin in the Plugin Manager (see
   :ref:`managing_plugins`) and click on the |dxf2shp_converter| :sup:`Dxf2Shape
   Converter` icon, which appears in the |qg| toolbar menu. The Dxf2Shape plugin
   dialog appears, as shown in Figure_dxf2shape_1_.
#. Enter the input DXF file, a name for the output shapefile and the shapefile type.
#. Enable the |checkbox| :guilabel:`Export text labels` checkbox if you want
   to create an extra point layer with labels.
#. Click **[OK]**.
