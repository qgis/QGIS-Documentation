.. only:: html

   |updatedisclaimer|

.. _label_meshproperties:

***********************
 Working with Mesh Data
***********************

.. toctree::
   :maxdepth: 2

Mesh properties
===============

A mesh is an unstructured grid usually with temporal and other components.
The spatial component contains a collection of vertices, edges and faces in 2D or 3D space:

* vertices - XY(Z) points (in the layer's coordinate reference system)
* edges - connect pairs of vertices
* faces - sets of edges forming a closed shape - typically triangles or quadrilaterals (quads), rarely polygons with higher number of vertices


.. _figure_mesh_grid_types:

.. figure:: img/mesh_grid_types.png
   :align: center

   Different mesh types

QGIS, can now render mesh data using a triangle grid or a regular squad mesh.

Mesh provides information about the spatial structure.
In addition, the mesh can have datasets (groups) that assign a value to every vertex. 
For example, having a triangular mesh with numbered vertices as shown in the image below:

.. _figure_triangual_grid_with_numered_vertices:

.. figure:: img/triangual_grid_with_numered_vertices.png
   :align: center

   Triangular grid with numbered vertices

Each vertex can store different datasets -typically multiple quantities-, 
and those datasets can also have a temporal dimension. Thus, a single file may contain multiple datasets.

The following table gives an idea what information is stored in datasets. 
Table columns represent indices of mesh vertices, each row represents one dataset. 
Datasets can have different datatypes.
In this case, it stored the wind velocity at 10m at particular moment of time (t1, t2, t3).

In a similar way, the mesh dataset can store vector values at each vertex, 
for example, vector of wind direction at given time stamps:

=============================== ========= ========= ========= =====
10 metre wind                   1         2         3         ...
=============================== ========= ========= ========= =====
10 metre speed at time=t1       17251     24918     32858     ...
10 metre speed at time=t2       19168     23001     36418     ...
10 metre speed at time=t3       21085     30668     17251     ...
...                             ...       ...       ...       ...
10m wind direction time=t1      [20,2]    [20,3]    [20,4.5]  ...
10m wind direction time=t2      [21,3]    [21,4]    [21,5.5]  ...
10m wind direction time=t3      [22,4]    [22,5]    [22,6.5]  ...
...                             ...       ...       ...       ...
=============================== ========= ========= ========= =====

.

We can visualize the data by assigning colors to values 
(similarly to how it is done with "Singleband pseudocolor" raster rendering) 
and interpolating data between vertices according to the mesh topology. 
It is common that some quantities are 2D vectors rather than being 
simple scalar values (e.g. wind direction). 
For such quantities it is very desired to display arrows indicating direction.

.. _figure_mesh_visualisation:

.. figure:: img/mesh_visualisation.png
   :align: center

   Possible visualisation's of mesh data


Supported formats
=================

QGIS accesses mesh data using the MDAL drivers (https://github.com/lutraconsulting/MDAL). 
Hence, the natively supported formats are:

* NetCDF: Generic format for scientific data 
* GRIB: Format commonly used in meteorology
* XMDF: As an example, hydraulic outputs from TUFLOW modelling package
* DAT: Outputs of various hydrodynamic modelling packages (e.g. BASEMENT, HYDRO_AS-2D, TUFLOW)
* 3Di: 3Di modelling package format based on Climate and Forecast Conventions (http://cfconventions.org/)
* Some examples of mesh datasets can be found: https://apps.ecmwf.int/datasets/data/interim-full-daily/levtype=sfc/

   
Loading a mesh layer
====================

In QGIS to open a mesh layer, choose :menuselection:`Layer -->` :menuselection:`Add Mesh Layer -->`
|addMeshLayer| :menuselection:`Data Source Manager...` from the menu, or open 
the :menuselection:`Data Source Manager...` in one click by clicking the :guilabel:`Data Source Manager` 
icon to open the dialog.

A new dialog will appear. From the left panel, click on Mesh layer |addMeshLayer| and 
point to the file. The layer will be added using the native mesh rendering.

.. _figure_mesh_datasource_manager:

.. figure:: img/mesh_datasource_manager.png
   :align: center

   Mesh tab in Data Source Manager


Information
-----------

.. _figure_mesh_info_properties:

.. figure:: img/mesh_info_properties.png
   :align: center

   Mesh Layer Properties

The :guilabel:`Information` tab is read-only and represents an interesting 
place to quickly grab summarized information and metadata on the current layer. 
Provided information are (based on the provider of the layer) uri, vertex count, 
face count and dataset groups count).

Source
------

The :guilabel:`Source` tab displays basic information about the selected mesh, including:

* the Layer name to display in the Layers Panel
* setting the Coordinate Reference System: Displays the layer’s Coordinate Reference System (CRS) as a PROJ.4 string. You can change the layer’s CRS, selecting a recently used one in the drop-down list or clicking on |setProjection| :guilabel:`Select CRS` button (see Coordinate Reference System Selector) Use this process only if the CRS applied to the layer is a wrong one or if none was applied. 

Use the button :guilabel:`Assign Extra Dataset to Mesh` to add more groups to the current mesh layer. 

Style
=====

By clicking the button Style |symbology|, you activate the :guilabel:`Layer Styling` dialog as shown in the following image:


.. figure:: img/styling_panel.png
   :align: center

   Mesh Layer Style

In the tab |rendering_mesh|,  QGIS offers two possibilities to display the grid:

*	Native mesh rendering that shows quadrants
*	Triangular mesh rendering that display triangles

The line width and color can be changed in this dialog or deactivate both grid rendering.

The tab |tbutton| presents the following items:

* groups available in the mesh dataset
* dataset in the selected group(s), for example, if the layer has a temporal dimension
* metadata if available
* blending mode available for the selected dataset, for example: normal, lighten,multiply,…(see blending modes :ref:`blend-modes`)


The slide bar, combo box and arrows allow to explore another dimension of the data, if available.
As the slide moves, the metadata is presented accordingly. See the figure below as an example.
The map canvas will display the selected dataset group as well.

.. figure:: img/groups_available.png
   :align: center

   Dataset in Selected Group(s)

Under groups click on |contour_inactive| to show contours with default visualization parameters. Then,
in the tab |contour_active| you can see and change the current visualization options of contours
for the selected group, as shown in the image below:

.. figure:: img/contours_style.png
   :align: center

   Styling Contours in a Mesh Layer

Use the slide bar or combo box to set the opacity of the current group.

Use :guilabel:`Load` to adjust the min and max value of the current group.

The :guilabel:`Interpolation` list contains three option to render contours: Linear, Discrete and Exact.

The :guilabel:`Color ramp`  drop down list lists the color ramp in your QGIS.
You can list all available ramps, add a new one, edit or save the one you changed.
The name of the color ramp will be saved in the configuration and in the QML files.

The :guilabel:`Label unit suffix` is a label added after the value in the legend.

By selecting ‘Continuous’ in the classification :guilabel:`Mode`, QGIS creates classes automatically considering
the :guilabel:`Min` and :guilabel:`Max` values. With ‘Equal interval’, you only need to select the number of classes
using the combo box  :guilabel:`Classes`  and pressing the button |classify|.

The button |signPlus| :sup:`Add values manually` adds a value
to the individual color table. The button |signMinus| :sup:`Remove selected row`
deletes a value from the individual color table. Double clicking on the value column
lets you insert a specific value. Double clicking on the color column opens the dialog
:guilabel:`Change color`, where you can select a color to apply on that value.

In the tab |tbutton|, click on |vector_inactive| to display vectors if available.
The map canvas will display the vectors in the selected group with default parameters.
Click on the tab |vector_active| to change the visualization parameters for vectors, see figure below:

.. figure:: img/vector_styling.png
   :align: center

   Styling Vectors in a Mesh Layer

The line width can be set using the combo box or typing the value. The color list, opens the dialog :guilabel:`Change color`,
where you can select a color to apply to vectors.

Enter values on :guilabel:`Min` and :guilabel:`Max` to filter vectors according to their magnitude.

Check on the box |display_user_grid| and specify the :guilabel:`X spacing` and the :guilabel:`Y spacing`,
QGIS will render the vector considering the given spacing.

On the Head Options :guilabel:`Head Options`, QGIS allows to set the shape of the arrow head by specifying width and length (in percentage).

Vector's :guilabel:`Arrow length` can be rendered in QGIS in three different ways:

* Defined by Min and Max: You should specify the minimum and maximum length for vector,
  QGIS will adjust their visualization accordingly
* Scale to magnitude: You should specify the (multiplying) factor to use
* Fixed: all the vectors are shown with the same length




.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
.. |addMeshLayer| image:: /static/common/mActionAddMeshLayer.png
      :width: 1.5em
.. |setProjection| image:: /static/common/mActionSetProjection.png
   :width: 1.5em
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |rendering_mesh| image:: img/rendering.png
   :width: 1.5em
.. |tbutton| image:: img/tbutton.png
   :width: 1.5em
.. |contour_active| image:: img/contours_active.png
   :width: 1.5em
.. |contour_inactive| image:: img/contours_inactive.png
   :width: 2em
.. |classify| image:: img/classify.png
   :width: 4.5em
.. |vector_active| image:: img/vector_active.png
   :width: 2em
.. |vector_inactive| image:: img/vector_inactive.png
   :width: 1.5em
.. |display_user_grid| image:: img/display_user_grid.png
   :width: 9.5em
