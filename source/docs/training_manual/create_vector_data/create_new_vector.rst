|LS| Creating a New Vector Dataset
===============================================================================

The data that you use has to come from somewhere. For most common applications,
the data exists already; but the more particular and specialized the project,
the less likely it is that the data will already be available. In such cases,
you'll need to create your own new data.

**The goal for this lesson:** To create a new vector dataset.

|basic| |FA| The Layer Creation Dialog
-------------------------------------------------------------------------------

Before you can add new vector data, you need a vector dataset to add it to. In
our case, you'll begin by creating new data entirely, rather than editing an
existing dataset. Therefore, you'll need to define your own new dataset first.

You'll need to open the :guilabel:`New Vector Layer` dialog that will allow you
to define a new layer.

* Navigate to and click on the menu entry :menuselection:`Layer --> New --> New
  Shapefile Layer`.

You'll be presented with the following dialog:

.. image:: ../_static/create_vector_data/001.png
   :align: center

It's important to decide which kind of dataset you want at this stage. Each
different vector layer type is "built differently" in the background, so once
you've created the layer, you can't change its type.

For the next exercise, we're going to be creating new features which describe
areas. For such features, you'll need to create a polygon dataset.

* Click on the :guilabel:`Polygon` radio button:

.. image:: ../_static/create_vector_data/002.png
   :align: center

This has no impact on the rest of the dialog, but it will cause the correct
type of geometry to be used when the vector dataset is created.

The next field allows you to specify the Coordinate Reference System, or CRS. A
CRS specifies how to describe a point on Earth in terms of coordinates, and
because there are many different ways to do this, there are many different CRSs.
The CRS of this project is WGS84, so it's already correct by default:

.. image:: ../_static/create_vector_data/003.png
   :align: center

Next there is a collection of fields grouped under :guilabel:`New attribute`.
By default, a new layer has only one attribute, the :kbd:`id` field (which you
should see in the :guilabel:`Attributes list`) below. However, in order for the
data you create to be useful, you actually need to say something about the
features you'll be creating in this new layer! For our current purposes, it
will be enough to add one field called :kbd:`name`.

* Replicate the setup below, then click the :guilabel:`Add to attributes list`
  button:

.. image:: ../_static/create_vector_data/004.png
   :align: center

* Check that your dialog now looks like this:

.. image:: ../_static/create_vector_data/005.png
   :align: center

* Click :guilabel:`OK`. A save dialog will appear.
* Navigate to the :kbd:`exercise_data` directory.
* Save your new layer as :kbd:`school_property.shp`.

The new layer should appear in your :guilabel:`Layers list`.

|basic| |FA| Data sources
-------------------------------------------------------------------------------

When you create new data, it obviously has to be about objects that really
exist on the ground. Therefore, you'll need to get your information from
somewhere.

There are many different ways to obtain data about objects. For example, you
could use a GPS to capture points in the real world, then import the data into
QGS afterwards. Or you could survey points using a theodolite, and enter the
coordinates manually to create new features. Or you could use the digitizing
process to trace objects off of remote sensing data, such as satellite imagery
or aerial photography.

For our example, you'll be using the digitizing approach. Sample raster datasets
are provided, so you'll need to import them as necessary.

* Click on the :guilabel:`Add Raster Layer` button:

.. image:: ../_static/create_vector_data/006.png
   :align: center

* Navigate to :kbd:`exercise_data/raster/`.
* Select the file :kbd:`3420C_2010_327_RGB_LATLNG.tif`.
* Click :guilabel:`Open`. An image will load into your map.
* Find the new image in the :guilabel:`Layers list`.
* Click and drag it to the bottom of the list so that you can still see your
  other layers.
* Find and zoom to this area:

.. image:: ../_static/create_vector_data/007.png
   :align: center

You'll be digitizing these three fields:

.. image:: ../_static/create_vector_data/014.png
   :align: center

* Hide all the layers except the raster and the :guilabel:`school_property`
  layer.

In order to begin digitizing, you'll need to enter **edit mode**. GIS software
commonly requires this to prevent you from accidentally editing or deleting
important data. Edit mode is switched on or off individually for each layer.

To enter edit mode for the :guilabel:`school_property` layer:

* Click on the layer in the :guilabel:`Layer list` to select it. (Make very
  sure that the correct layer is selected, otherwise you'll edit the wrong
  layer!)
* Click on the :guilabel:`Toggle Editing` button:

.. image:: ../_static/create_vector_data/008.png
   :align: center

If you can't find this button, check that the :guilabel:`Digitizing` toolbar is
enabled. There should be a check mark next to the :menuselection:`View -->
Toolbars --> Digitizing` menu entry.

As soon as you are in edit mode, you'll see the digitizing tools are now
active:

.. image:: ../_static/create_vector_data/009.png
   :align: center

From left to right on the image above, they are:

- :guilabel:`Toggle Edit`: activates / deactivates edit mode.
- :guilabel:`Save Edits`: saves changes made to the layer.
- :guilabel:`Add Feature`: start digitizing a new feature.
- :guilabel:`Move Feature(s)`: move an entire feature around.
- :guilabel:`Node Tool`: move only one part of a feature.
- :guilabel:`Delete Selected`: delete the selected feature (only active if a
  feature is selected).
- :guilabel:`Cut Features`: cut the selected feature (only active if a feature
  is selected).
- :guilabel:`Copy Features`: copy the selected feature (only active if a
  feature is selected).
- :guilabel:`Paste Features`: paste a cut or copied feature back into the map
  (only active if a feature has been cut or copied).

You want to add a new feature.

* Click on the :guilabel:`Add Feature` button now to begin digitizing right
  away!

You'll notice that your mouse cursor has become a crosshair. This allows you to
more accurately place the points you'll be digitizing. Remember that even as
you're using the digitizing tool, you can zoom in and out on your map by
rolling the mouse wheel, and you can pan around by holding down the mouse wheel
and dragging around in the map.

The first feature you'll be digitizing is the athletics field:

.. image:: ../_static/create_vector_data/010.png
   :align: center

* Start digitizing by clicking on a point somewhere along the edge of the
  field.
* Place more points by clicking further along the edge, until the shape you're
  drawing completely covers the field.
* To place your last point, *right-click* where you want it to be. This will
  finalize the feature and show you the :guilabel:`Attributes` dialog.
* Fill in the values as below:

.. image:: ../_static/create_vector_data/013.png
   :align: center

* Click :guilabel:`OK` and you've created a new feature!

Remember, if you've made a mistake while digitizing a feature, you can always
edit it after you're done creating it. If you've made a mistake, continue
digitizing until you're done creating the feature as above. Then:

* Select the feature with the :guilabel:`Select Single Feature` tool:

.. image:: ../_static/create_vector_data/012.png
   :align: center

You can use:

* the :guilabel:`Move Feature(s)` tool to move the entire feature,
* the :guilabel:`Node Tool` to move only one point where you may have
  misclicked,
* :guilabel:`Delete Selected` to get rid of the feature entirely so you can try
  again, and
* the :menuselection:`Edit --> Undo` menu item or the :kbd:`ctrl + z` keyboard
  shortcut to undo mistakes.

|basic| |TY|
-------------------------------------------------------------------------------

* Digitize the school itself and the upper field. Use this image to assist you:

.. image:: ../_static/create_vector_data/014.png
   :align: center

Remember that each new feature needs to have a unique :kbd:`id` value!

.. note::  When you're done adding features to a layer, remember to save your
   edits and then exit edit mode.

.. _backlink-create-vector-digitize-1:

|basic| |TY|
-------------------------------------------------------------------------------

* Create a new line feature called :kbd:`river.shp` with attributes :kbd:`id`
  and :kbd:`type`. (Use the approach above to guide you.)
* Digitize the river that runs through town.

Start where the sandy riverbanks first become visible:

.. image:: ../_static/create_vector_data/015.png
   :align: center

And stop when our river joins another river:

.. image:: ../_static/create_vector_data/016.png
   :align: center

It's not always clear where the river runs. In such cases, use your better
judgment and estimate where the river goes. Remember that you're capturing the
river at a large scale, so try to follow it in detail. Take some time, don't
let the line become too straight or make the corners too sharp!

When creating the feature, give it the :kbd:`type` attribute value of
":kbd:`stream`".

:ref:`Check your results <create-vector-digitize-1>`

|IC|
-------------------------------------------------------------------------------

Now you know how to create features! This course doesn't cover adding point
features, because that's not really necessary once you've worked with more
complicated features (lines and polygons). It works exactly the same, except
that you only click once where you want the point to be, give it attributes as
usual, and then the feature is created.

Knowing how to digitize is important because it's a very common activity in GIS
programs.

|WN|
-------------------------------------------------------------------------------

Features in a GIS layer aren't just pictures, but objects in space. For
example, adjacent polygons know where they are in relation to one another. This
is called *topology*. In the next lesson you'll see an example of why this can
be useful.
