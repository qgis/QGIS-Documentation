.. comment out this disclaimer (by putting '.. ' in front of it) if file is uptodate with release

|updatedisclaimer|

.. _`label_plugingdaltools`:

GDAL Tools Plugin
=================


.. _`whatsgdal`:

What is GDALTools?
------------------


The GDAL Tools plugin offers a GUI to the collection of tools in the Geospatial 
Data Abstraction Library, http://gdal.osgeo.org . These are raster management 
tools to query, re-project, warp, merge a wide variety of raster formats. Also 
included are tools to create a contour (vector) layer, or a shaded relief from 
a raster DEM, and to make a vrt (Virtual Raster Tile in XML format) from a 
collection of one or more raster files. These tools are available when the 
plugin is installed and activated.

.. _`gdal_lib`:

The GDAL Library
----------------


The GDAL library consists of a set of command line programs, each with a large 
list of options. Users comfortable with running commands from a terminal may 
prefer the command line, with access to the full set of options. The GDALTools 
plugin offers an easy interface to the tools, exposing only the most popular 
options. 

**List of GDAL tools**

+----------------------+-------------------------------------------------------+
| Build Virtual Raster | This program builds a VRT (Virtual Dataset) that is a |
|                      | mosaic of the list of input gdal datasets.            |
+----------------------+-------------------------------------------------------+
| Contour              | This program generates a vector contour file from the |
|                      | input raster elevation model (DEM).                   | 
+----------------------+-------------------------------------------------------+
| Rasterize            | This program burns vector geometries (points, lines   |
|                      | and polygons) into the raster band(s) of a raster     |
|                      | image. Vectors are read from OGR supported vector     |
|                      | formats. Note that the vector data must in the same   |
|                      | coordinate system as the raster data; on the fly      |
|                      | reprojection is not provided.                         |
+----------------------+-------------------------------------------------------+
| Polygonize           | This utility creates vector polygons for all connected|
|                      | regions of pixels in the raster sharing a common pixel|
|                      | value. Each polygon is created with an attribute      |
|                      | indicating the pixel value of that polygon.  The      |
|                      | utility will create the output vector datasource if it|
|                      | does not already exist, defaulting to ESRI shapefile  |
|                      | format.                                               |
+----------------------+-------------------------------------------------------+
| Merge                | This utility will automatically mosaic a set of       |
|                      | images. All the images must be in the same coordinate |
|                      | system and have a matching number of bands, but they  |
|                      | may be overlapping, and at different resolutions. In  |
|                      | areas of overlap, the last image will be copied over  |
|                      | earlier ones.                                         |
+----------------------+-------------------------------------------------------+
| Sieve                | This utility removes raster polygons smaller than a   |
|                      | provided threshold size (in pixels) and replaces      |
|                      | them with the pixel value of the largest neighbor     |
|                      | polygon. The result can be written back to the        |
|                      | existing raster band, or copied into a new file.      |
+----------------------+-------------------------------------------------------+
| Proximity            | This utility generates a raster proximity map         |
|                      | indicating the distance from the center of each pixel |
|                      | to the center of the nearest pixel identified as a    |
|                      | target pixel. Target pixels are those in the source   |
|                      | raster for which the raster pixel value is in the set |
|                      | of target pixel values.                               |
+----------------------+-------------------------------------------------------+
| Near Black           | This utility will scan an image and try to set all    |
|                      | pixels that are nearly black (or nearly white) around |
|                      | the edge to exactly black (or white). This is often   |
|                      | used to "fix up" lossy compressed aerial photos so    |
|                      | that color pixels can be treated as transparent when  |
|                      | mosaicing.                                            |
+----------------------+-------------------------------------------------------+
| Fill nodata          | This utility fills selection raster regions (usually  |
|                      | nodata areas) by interpolation from valid pixels      |
|                      | around the edges of the area.                         |
+----------------------+-------------------------------------------------------+
| Warp                 | This utility is an image mosaicing,                   |
|                      | reprojection and warping utility. The program can     |
|                      | reproject to any supported projection, and can also   |
|                      | apply GCPs stored with the image if the image is "raw"|
|                      | with control information.                             |
+----------------------+-------------------------------------------------------+
| Grid                 | This utility creates regular grid (raster) from the   |
|                      | scattered data read from the OGR datasource. Input    |
|                      | data will be interpolated to fill grid nodes with     |
|                      | values, you can choose from various interpolation     |
|                      | methods.                                              |
+----------------------+-------------------------------------------------------+
| Translate            | This utility can be used to convert raster data       |
|                      | between different formats, potentially performing some|
|                      | operations like subsettings, resampling, and rescaling|
|                      | pixels in the process.                                |
+----------------------+-------------------------------------------------------+
| Information          | This utility lists various information about a        |
|                      | GDAL supported raster dataset.                        |
+----------------------+-------------------------------------------------------+
| Assign Projection    | This utility is an image mosaicing, reprojection and  |
|                      | warping utility. The program can reproject to any     |
|                      | supported projection, and can also apply GCPs stored  |
|                      | with the image if the image is "raw" with control     |
|                      | information.  ``-s_srs srs_def``: source spatial      |
|                      | reference set. The coordinate systems that can be     |
|                      | passed are anything supported by the                  |
|                      | OGRSpatialReference.SetFromUserInput() call, which    |
|                      | includes EPSG PCS and GCSes (ie. EPSG:4296), PROJ.4   |
|                      | declarations (as above), or the name of a .prf file   |
|                      | containing well known text.  ``-t_srs srs_def``:      |
|                      | target spatial reference set. The coordinate systems  |
|                      | that can be passed are anything supported by the      |
|                      | OGRSpatialReference.SetFromUserInput() call, which    |
|                      | includes EPSG PCS and GCSes (ie. EPSG:4296), PROJ.4   |
|                      | declarations (as above), or the name of a .prf file   |
|                      | containing well known text.                           |
+----------------------+-------------------------------------------------------+
| Extract projection   | This utility helps you to generate projection         |
|                      | information from an input file. If you want to        |
|                      | extract projection from a whole directory you can use |
|                      | the Batch mode. It's possible to create a *.prj file  |
|                      | from the input file.                                  |
+----------------------+-------------------------------------------------------+
| Build Overviews      | The gdaladdo utility can be used to build or rebuild  |
|                      | overview images for most supported file formats with  |
|                      | one of several downsampling algorithms.               |
+----------------------+-------------------------------------------------------+
| Clipper              | This utility will automatically mosaic a set of       |
|                      | images. All the images must be in the same coordinate |
|                      | system and have a matching number of bands, but they  |
|                      | may be overlapping, and at different resolutions. In  |
|                      | areas of overlap, the last image will be copied over  |
|                      | earlier ones.  ``-ul_lr ulx uly lrx lry``: The extents|
|                      | of the output file. If not specified the aggregate    |
|                      | extents of all input files will be used.              |
+----------------------+-------------------------------------------------------+
| RGB to PCT           | This utility will compute an optimal pseudo-color     |
|                      | table for a given RGB image using a median cut        |
|                      | algorithm on a downsampled RGB histogram. Then it     |
|                      | converts the image into a pseudo-colored image using  |
|                      | the color table. This conversion utilizes             |
|                      | Floyd-Steinberg dithering (error diffusion) to        |
|                      | maximize output image visual quality.                 |
+----------------------+-------------------------------------------------------+
| PCT to RGB           | This utility will convert a pseudocolor band on the   |
|                      | input file into an output RGB file of the desired     |
|                      | format.                                               |
+----------------------+-------------------------------------------------------+
| Tile Index           | This utility builds a shapefile with a record for     |
|                      | each input raster file, an attribute containing the   |
|                      | filename, and a polygon geometry outlining the raster.|
+----------------------+-------------------------------------------------------+
| DEM terrain models   | Tools to analyze and visualize DEMs. It can create a  |
|                      | shaded relief, a slope, an aspect, a color relief, a  |
|                      | Terrain Ruggedness Index, a Topographic Position Index|
|                      | and a roughness map from any GDAL-supported elevation |
|                      | raster.                                               |
+----------------------+-------------------------------------------------------+

.. maybe simpler rewording of the description is necessary

\ 

 \ 

.. _figure_GDAL_Tools_1:

.. only:: html

   **Figure GDAL Tools 1:**

.. figure:: /static/user_manual/plugins/raster_menu.png
   :align: center
   :width: 40em

   The *GDALTools* menu list

.. _`gdal_examples`:

Examples
--------

Below are some examples of use of the tools.

**Getting information about a raster**

.. _figure_GDAL_Tools_2:

.. only:: html

   **Figure GDAL Tools 2:**

.. figure:: /static/user_manual/plugins/gdalinfo.png
   :align: center
   :width: 40em

   The *Information* dialog window

**Creating contour lines**

This example will create contour lines from an SRTM elevation tile.

.. _figure_GDAL_Tools_3:

.. only:: html

   **Figure GDAL Tools 3:**

.. figure:: /static/user_manual/plugins/gdal_contour.png
   :align: center
   :width: 40em

   The *Contours* dialog window

and the result:

.. _figure_GDAL_Tools_4:

.. only:: html

   **Figure GDAL Tools 4:**

.. figure:: /static/user_manual/plugins/qgis_contours.png
   :align: center
   :width: 40em

   The resulting contours layer

**Using GDALwarp to reproject a raster**

Here's the dialog window for reprojecting a landcover image, originally in the 
Albers Equal Area projection for Alaska (from the QGIS sample dataset) into 
Lon/Lat WGS84 (EPSG:4326).

.. _figure_GDAL_Tools_5:

.. only:: html

   **Figure GDAL Tools 5:**

.. figure:: /static/user_manual/plugins/gdalwarp.png
   :align: center
   :width: 40em

   The *GDAL warp* dialog window
