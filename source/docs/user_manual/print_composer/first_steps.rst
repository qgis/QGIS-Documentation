|updatedisclaimer|

First Steps
===========

With the Print Composer you can create nice maps and atlasses that can be printed or saved as PDF-file, an image or an SVG-file. This is a powerful way to share geographical information produced with |qg| that can be included in reports or published.

The Print Composer provides growing layout and printing capabilities. It allows
you to add elements such as the |qg| map canvas, text labels, images, legends, scale bars, basic
shapes, arrows, attribute tables and HTML frames. You can size, group, align, position and rotate each
element and adjust their properties to create your layout. The layout can be printed
or exported to image formats, PostScript, PDF or to SVG (export to SVG is not
working properly with some recent Qt4 versions; you should try and check
individually on your system). You can save the layout as a template and load it again
in another session. Finally, generating several maps based on a template can be done through the atlas generator.


.. index::
   single:Composer_Template
.. index::
   single:Map_Template



Open a new Print Composer Template
----------------------------------

Before you start to work with the Print Composer, you need to load some raster
or vector layers in the |qg| map canvas and adapt their properties to suit your
own convenience. After everything is rendered and symbolized to your liking,
click the |mActionNewComposer| :sup:`New Print Composer` icon in the toolbar or
choose :menuselection:`File --> New Print Composer`. You will be prompted to
choose a title for the new Composer.


Sample Session
--------------

To demonstrate how to create a map please follow the next instructions.

#. On the left side, select the |mActionAddMap| :sup:`Add new map` toolbar button and draw a rectangle on the canvas holding down the left mouse button. Inside the drawn rectangle the |qg| map view to the canvas.
#. Select the |mActionScaleBar| :sup:`Add new scalebar` toolbar button and click with the left mouse button on the Print Composer canvas. A scalebar will be added to the canvas.
#. Select the |mActionAddLegend| :sup:`Add new legend` toolbar button and draw a rectangle on the canvas holding down the left mouse button. Inside the drawn rectangle the legend will be drawn.
#. Select the |mActionSelect| :sup:`Select/Move item` icon to select the map on the canvas and move it a bit.
#. While the map item is still selected you can also change the size of the map item. Click while holding down the left mouse button, in a white little rectangle in one of the corners of the map item and drag it to a new location to change it's size. 
#. Click the :guilabel:`Item Properties` tab on the left lower panel and find the setting for the orientation. Change the value of the setting :guilabel:`Map orientation` to '15.00\ |degrees| '. You should see the orientation of the map item change.
#. Now, you can print or export your print composition to image formats, PDF or to SVG with the export tools in Composer menu.
#. Finally, you can save your print composition within the project file with the |mActionFileSave| :sup:`Save Project` button. 
 

You can add multiple elements to the Composer. It is also possible to have more
than one map view or legend or scale bar in the Print Composer canvas, on one or
several pages. Each element has its own properties and, in the case of the map,
its own extent. If you want to remove any elements from the Composer canvas you
can do that with the :kbd:`Delete` or the :kbd:`Backspace` key.

