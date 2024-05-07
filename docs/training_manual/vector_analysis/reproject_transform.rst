Lesson: Reprojecting and Transforming Data
======================================================================

Let us talk about Coordinate Reference Systems (CRSs) again.
We have touched on this briefly before, but haven't discussed what it
means practically.

**The goal for this lesson:** To reproject and transform vector datasets.

:abbr:`★☆☆ (Basic level)` Follow Along: Projections
----------------------------------------------------------------------

The CRS that all the data, as well as the map itself are in right now
is called *WGS84*.
This is a very common Geographic Coordinate System (GCS) for
representing data.
But there's a problem, as we will see.

#. Save your current map
#. Then open the map of the world which you will find under
   :file:`exercise_data/world/world.qgs`
#. Zoom in to South Africa by using the :guilabel:`Zoom In` tool
#. Try setting a scale in the :guilabel:`Scale` field, which is in the
   *Statusbar* along the bottom of the screen.
   While over South Africa, set this value to ``1:5 000 000``
   (one to five million).
#. Pan around the map while keeping an eye on the :guilabel:`Scale`
   field

Notice the scale changing? That's because you are moving away from the
one point that you zoomed into at ``1:5 000 000``, which was at the
center of your screen.
All around that point, the scale is different.

To understand why, think about a globe of the Earth.
It has lines running along it from North to South.
These longitude lines are far apart at the equator, but they meet at
the poles.

In a GCS, you are working on this sphere, but your screen is flat.
When you try to represent the sphere on a flat surface, distortion
occurs, similar to what would happen if you cut open a tennis ball and
tried to flatten it out.
What this means on a map is that the longitude lines stay equally far
apart from each other, even at the poles (where they are supposed to
meet).
This means that, as you travel away from the equator on your map, the
scale of the objects that you see gets larger and larger.
What this means for us, practically, is that there is no constant
scale on our map!

To solve this, let's use a Projected Coordinate System (PCS) instead.
A PCS "projects" or converts the data in a way that makes allowance
for the scale change and corrects it.
Therefore, to keep the scale constant, we should reproject our data to
use a PCS.

:abbr:`★☆☆ (Basic level)` Follow Along: "On the Fly" Reprojection
----------------------------------------------------------------------

By default, QGIS reprojects data "on the fly". What this means is that even if
the data itself is in another CRS, QGIS can project it as if it were in a CRS of
your choice.

You can change the CRS of the project by clicking on the
|projectionEnabled| :sup:`Current projection` button in the bottom
right corner of QGIS.

#. In the dialog that appears, type the word ``global`` into the
   :guilabel:`Filter` field.
   A few CRSs should appear in the
   :guilabel:`Predefined Reference Systems` field below.
#. Select :guilabel:`WGS 84 / NSIDC EASE-Grid 2.0 Global | EPSG:6933`
   entry by clicking on it, and then click :guilabel:`OK`.

   Notice how the shape of South Africa changes.
   All projections work by changing the apparent shapes of objects on
   Earth.
#. Zoom to a scale of ``1:5 000 000`` again, as before.
#. Pan around the map.

   Notice how the scale stays the same!

"On the fly" reprojection is also used for combining datasets that are
in different CRSs.

#. Add another vector layer to your map which has the data for South
   Africa only.
   You will find it as :file:`exercise_data/world/RSA.shp`.
#. Load it. 
   A quick way to see its CRS is by hovering the mouse over the layer
   in the legend. It is ``EPSG:3410``.

   What do you notice?

   The layer is visible even if it has a different CRS from the
   :guilabel:`continents` one.


:abbr:`★★☆ (Moderate level)` Follow Along: Saving a Dataset to Another CRS
---------------------------------------------------------------------------

Sometimes you need to export an existing dataset with another CRS.
As we will see in the next lesson, if you need to make distance
calculations on layer, it is always better to have the layer in a
projected coordinate system.

Be aware that the 'on the fly' reprojection is related to the
**project** and not to single layers.
This means that a layer can have a different CRS from the project even
if you see it in the *correct* position.

You can easily export the layer with another CRS.

#. Add the ``buildings`` dataset from :file:`training_data.gpkg`
#. Right-click on the ``buildings`` layer in the :guilabel:`Layers`
   panel
#. Select :menuselection:`Export --> Save Features As...` in the menu
   that appears.
   You will be shown the :guilabel:`Save Vector Layer as...` dialog.
#. Click on the :guilabel:`Browse` button next to the
   :guilabel:`File name` field
#. Navigate to :file:`exercise_data/` and specify the name of the new
   layer as :file:`buildings_reprojected.shp`.
#. Change the value of the :guilabel:`CRS`.
   Only the recent CRSs used will be shown in the drop-down menu.
   Click on the |setProjection| :sup:`Select projection` button next
   to the drop-down menu.
#. The :guilabel:`Coordinate Reference System Selector` dialog will
   appear.
   In its :guilabel:`Filter` field, search for ``34S``.
#. Select :guilabel:`WGS 84 / UTM zone 34S | EPSG:32734` from the list

   .. figure:: img/CRSselector.png
      :align: center

#. Leave the other options unchanged.
   The :guilabel:`Save Vector Layer as...` dialog now looks like this:

   .. figure:: img/save_vector_dialog.png
      :align: center

#. Click :guilabel:`OK`

You can now compare the old and new projections of the layer and see that they
are in two different CRS but they are still overlapping.


:abbr:`★★★ (Advanced level)` Follow Along: Creating Your Own Projection
------------------------------------------------------------------------

There are many more projections than just those included in QGIS by default.
You can also create your own projections.

#. Start a new map
#. Load the :file:`world/oceans.shp` dataset
#. Go to :menuselection:`Settings --> Custom Projections...` and you
   will see this dialog.

   .. figure:: img/custom_crs.png
      :align: center

#. Click on the |symbologyAdd| :sup:`Add new CRS` button to create a new
   projection
#. An interesting projection to use is called ``Van der Grinten I``.
   Enter its name in the :guilabel:`Name` field.

   This projection represents the Earth on a circular field instead of
   a rectangular one, as most other projections do.

#. In :guilabel:`Format`, select :guilabel:`WKT (Recommended)`
#. Add the following string in the :guilabel:`Parameters` field::

    PROJCRS["unknown",
        BASEGEOGCRS["unknown",
            DATUM["unknown",
                ELLIPSOID["unknown",6371000,0,
                    LENGTHUNIT["metre",1,
                        ID["EPSG",9001]]]],
            PRIMEM["Greenwich",0,
                ANGLEUNIT["degree",0.0174532925199433],
                ID["EPSG",8901]]],
        CONVERSION["unknown",
            METHOD["Van Der Grinten"],
            PARAMETER["Longitude of natural origin",0,
                ANGLEUNIT["degree",0.0174532925199433],
                ID["EPSG",8802]],
            PARAMETER["False easting",0,
                LENGTHUNIT["metre",1],
                ID["EPSG",8806]],
            PARAMETER["False northing",0,
                LENGTHUNIT["metre",1],
                ID["EPSG",8807]]],
        CS[Cartesian,2],
            AXIS["(E)",east,
                ORDER[1],
                LENGTHUNIT["metre",1,
                    ID["EPSG",9001]]],
            AXIS["(N)",north,
                ORDER[2],
                LENGTHUNIT["metre",1,
                    ID["EPSG",9001]]]]

   .. figure:: img/new_crs_parameters.png
      :align: center

#. Click :guilabel:`OK`
#. Click on the |projectionEnabled| :sup:`Current CRS` button at the
   right of the status bar to change the project CRS
#. Choose your newly defined projection (search for its name in the
   :guilabel:`Filter` field)
#. On applying this projection, the map will be reprojected thus:

   .. figure:: img/van_grinten_projection.png
      :align: center

In Conclusion
----------------------------------------------------------------------

Different projections are useful for different purposes. By choosing the
correct projection, you can ensure that the features on your map are being
represented accurately.

Further Reading
----------------------------------------------------------------------

Materials for the *Advanced* section of this lesson were taken from `this
article <https://anitagraser.com/2012/03/18/beautiful-global-projections-adding-custom-projections-to-qgis/>`_.

Read further information on :ref:`Coordinate Reference Systems <gis_coord_ref_system>`.

What's Next?
----------------------------------------------------------------------

In the next lesson you will learn how to analyze vector data using
QGIS' various vector analysis tools.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |projectionEnabled| image:: /static/common/mIconProjectionEnabled.png
   :width: 1.5em
.. |setProjection| image:: /static/common/mActionSetProjection.png
   :width: 1.5em
.. |symbologyAdd| image:: /static/common/symbologyAdd.png
   :width: 1.5em
