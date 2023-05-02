.. index:: Elevation profile view
.. _`label_elevation_profile_view`:

**********************
Elevation Profile View
**********************

.. only:: html

   .. contents::
      :local:

When your project includes 3D layers you can create a side view, an elevation profile along a line.  Vector, raster, mesh and point clouds layers are supported 3D layer formats that can be used to create an elevation profile.

You can open a new empty Elevation Profile view from the menu via :menuselection:`View -->` |layoutItem3DMap| :menuselection:`Elevation Profile`

You can create several Elevation Profile views from the menu! When the first one is docked, they are piled on top of each other. Please undock the last added Elevation Profile view to see the first one.


The following tools are provided at the top of the Elevation Profile panel:

* |layerTree| :sup:`Show Layer Tree` : Switch Elevation Profile Legend on/off
* |captureLine| :sup:`Capture Curve` : Draw a line on map canvas to create Elevation Profile
* |captureCurveFromFeature| :sup:`Capture Curve From Feature` : Select a line feature on map canvas to create Elevation Profile
* |arrowLeft| :sup:`Nudge Left` : Move Elevation Profile line to the left
* |arrowRight| :sup:`Nudge Right` : Move Elevation Profile line to the right
* |clearConsole| :sup:`Clear` : Clear Elevation Profile
* |identify| :sup:`Identify Features` : Identify features in the Elevation Profile
* |pan| :sup:`Pan` : Pan the Elevation profile
* |zoomInXAxis| :sup:`Zoom X Axis` : Zoom in/out along the X-axis
* |zoomIn|:sup:`Zoom` : Zoom in/out 
* |zoomFullExtent| :sup:`Zoom Full` : Zoom in to the full extent
* |snapping| :sup:`Enable Snapping` : Snap to nearest vertical feature
* |measure| :sup:`Measurement Distances` : Measure horizontal and vertical distances
* |saveAsPDF| :sup:`Export as PDF`: Export the plot in PDF format
* |saveMapAsImage| :sup:`Export as Image` : Export the plot to several image formats
* |options| :sup:`Options` : Open options menu
* |dock| :sup:`Dock Elevation Profile View` : Switch from docked to floating and dockable QGIS panel

.. _`elevation_profile_create`:
  
Create
======

|captureLine| :sup:`Capture Curve`  is used to draw a line, in the main map canvas to create an Elevation Profile along given line. Use the left mouse button, to add points to the line, use the right mouse button to finalize the line and create the Elevation Profile.

|captureCurveFromFeature| :sup:`Capture Curve From Feature`  is used to select a line feature in the map canvas that is used to create the Elevation Profile.

.. _`elevation_profile_change`:


Change
======

|arrowLeft| :sup:`Nudge Left` and |arrowRight| :sup:`Nudge right`
are used to shift the position of the Elevation Profile line in the map canvas to the left or right. of the current Elevation Profile line. The Elevation Profile will be redrawn. It is moved sideways using the tolerance value given in |options| :sup:`Options`.

You can draw a new profile line with |captureLine| :sup:`Capture Curve` or select another line feature |captureCurveFromFeature| :sup:`Capture Curve From Feature` to create a new profile. To erase it first with the |clearConsole| :sup:`Clear` button, is not really neccesary, but good habit.

.. _`elevation_profile_presentation`:

Presentation
============

|layerTree| :sup:`Show Layer Tree`  can be used to hide or show the legend.

The legend can be used to:

* turn the visibility of 3D layers on or off
* change the order of layers, just drag an drop the layers up or down
* change the style of the selected layers in the Elevation Profile legend

Right click on on a layer in the legend gives access to the menu option :guilabel:`Properties...` in a popup menu. When you select :guilabel:`Properties...` this will open the |elevationscale| :guilabel:`Elevation` tab in the Layer Properties where you can give specific settings to change the presentation of a layer for the Elevation Profile. When you double click on a layer in the legend, this will instantly open the |elevationscale| :guilabel:`Elevation Tab` in the Layer Properties dialog.

The Elevation tab options provided are dependent on the format. Please follow the link for the full description of the Elevation tab for each format:

* :ref:`Raster Elevation Properties <raster_elevation>`
* :ref:`Vector Elevation Properties <vectorelevationmenu>`
* :ref:`Point Cloud Elevation Properties <point_clouds_elevation>`
* :ref:`Mesh Elevation Properties <meshelevation>` 

For all Elevation layers you can adapt the Elevation scaling and offset to correct or change the profile appearance. You can use the scaling option to convert layers from one map unit to the other (i.e. feet to meters). 

For the appearance of the elevation of a Raster DEM you can choose in :guilabel:`Style` either for a :guilabel:`Line` or :guilabel:`Fill Below` style.
You can give it the symbology you like with the standard :guilabel:`Symbology Settings editor`.

Mesh, vector and cloud points have the option :guilabel:`Respect layer's coloring`. When activated the layer uses the same symbols styling as used in the main canvas. However, you can decide to give the layers in the Elevation Profile another style. First deactivate the option :guilabel:`Respect layers coloring` and create for the layer a new style to use in the Elevation Profile!  

For Point Clouds you have a great option to activate :guilabel:`Apply Opacity by distance from curve effect` so near objects in the point cloud are better visible!

.. _`elevation_profile_interaction`:

Interaction
===========

|identify| :sup:`Identify Features`  is used to identify features of selected layer in the legend. You can select multiple features when you hold the :kbd:`Shift` and drag a rectangle across several features. Selected features in vector format will also be selected in the main map canvas.

|pan| :sup:`Pan`  is used to pan the Elevation profile and move it in any direction you want.

|zoomInXAxis| :sup:`Zoom X Axis`  is used to Zoom in/out along the X-Axis keeping the ratio of the Y-axis (the elevation) the same. You can stretch out the Elevation profile along the X axis by pressing the Left mouse button or the scroll wheel.

|zoomIn| :sup:`Zoom`  is used to Zoom in or Zoom out on a certain point with the scroll wheel. In combination with the :kbd:`Ctrl` key you can zoom in or out more smoothly. You can also use :kbd:`Shift` and keep the left button pressed to drag a rectangle on the area you want to zoom into.

|zoomFullExtent| :sup:`Zoom Full`  is the default zoom level used at the beginning and shows the full extent of all features you selected. Use it to reset the zoom level.
  
|snapping| :sup:`Enable Snapping`  can be turned on or of. When turned on it wil Snap to the nearest vertical feature of selected layer in the legend. It is useful to read the elevation from the cross hairs, but also helps to select a feature using the identify tool. But it really is usefull to measure distances.
  
|measure| :sup:`Measurement Distances`  is used to Measure horizontal and vertical distances. With Snapping enabled, it is easier to select the points in the Vertical elevation. The distances are given in used map units.

.. _`elevation_profile_troubleshoot`:

Troubleshoot
============

Here are some solutions for the following problems:

#. Raster or mesh layer does not appear in the legend of the Elevation Profile
   Open the properties layer of the Raster or Mesh layer from the Layers panel, open the tab |elevationscale| :guilabel:`Elevation` and activate :guilabel:`Represents Elevation Surface`. Press the :guilabel:`OK` button.
  
#. The features of the vector layer are appearing on elevation level Z=0 of the Elevation Profile.
   Your vector layer is probably still in 2D, you can check this and make it 3D using one of the following options in the Processing Toolbox:
  
   * When the vector layer has an attribute with the Z-value, you can use the Processing function |processingAlgorithm| :guilabel:`Set Z value` to create a 3D vector layer with that value.
   * When you have a DEM Raster (Digital Elevation Model) you can use the Processing function |processingAlgorithm| :guilabel:`Drape (set Z value from raster)` to add elevation to your vector layer.

.. tip:: **Two great introduction video's on the Elevation Profile tool**

   In `QGIS elevation profile/cross section tool -- a deep dive! <https://www.youtube.com/watch?v=AknJjNPystU>`_ Nyall Dawson presented the Elevation Profile tool to the QGIS community. You feel the excitement grow during the video. This video presents in one hour many aspects of the Elevation Profile tool.
   
   In `Exploring the New Elevation Profile Tool with Point Clouds in QGIS 3.26 <https://www.youtube.com/watch?v=ky0HkttaQ58>`_ Hans van der Kwast shows in 8 minutes how to download some point cloud data of the city of Rotterdam and create a nice skyline view of the Rotterdam harbour using the Elevation Profile view.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |arrowLeft| image:: /static/common/mActionArrowLeft.png
   :width: 1.2em
.. |arrowRight| image:: /static/common/mActionArrowRight.png
   :width: 1.2em
.. |captureCurveFromFeature| image:: /static/common/mActionCaptureCurveFromFeature.png
   :width: 1.5em
.. |captureLine| image:: /static/common/mActionCaptureLine.png
   :width: 1.5em
.. |clearConsole| image:: /static/common/iconClearConsole.png
   :width: 1.5em
.. |dock| image:: /static/common/dock.png
   :width: 1.5em
.. |elevationscale| image:: /static/common/elevationscale.png
   :width: 1.5em
.. |identify| image:: /static/common/mActionIdentify.png
   :width: 1.5em
.. |layerTree| image:: /static/common/miconLayerTree.png
   :width: 1.5em
.. |layoutItem3DMap| image:: /static/common/mLayoutItem3DMap.png
   :width: 1.5em
.. |measure| image:: /static/common/mActionMeasure.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |pan| image:: /static/common/mActionPan.png
   :width: 1.5em
.. |processingAlgorithm| image:: /static/common/processingAlgorithm.png
   :width: 1.5em
.. |saveAsPDF| image:: /static/common/mActionSaveAsPDF.png
   :width: 1.5em
.. |saveMapAsImage| image:: /static/common/mActionSaveMapAsImage.png
   :width: 1.5em
.. |snapping| image:: /static/common/mIconSnapping.png
   :width: 1.5em
.. |zoomFullExtent| image:: /static/common/mActionZoomFullExtent.png
   :width: 1.5em
.. |zoomIn| image:: /static/common/mActionZoomIn.png
   :width: 1.5em
.. |zoomInXAxis| image:: /static/common/mActionZoomInXAxis.png
   :width: 1.5em
