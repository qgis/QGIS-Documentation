*******************************************************************************
|MOD| Assessment
*******************************************************************************

Use your own data for this section. You will need:

- a point vector dataset of points of interest, with point names and multiple
  categories
- a line vector dataset of roads
- a polygon vector dataset of land use (using property boundaries)
- a visual-spectrum image (such as an aerial photograph)
- a DEM (downloadable from `this URL <http://srtm.csi.cgiar.org/>`_ if you
  don't have your own)

Create a base map
===============================================================================

Before doing any data analysis, you will need a base map, which will provide
your analysis result with context.

Add the point layer
-------------------------------------------------------------------------------

* Add in the point layer. Based on the level that you're doing the course at,
  do only what is listed in the appropriate section below:

|basic|
...............................................................................

* Label the points according to a unique attribute, such as place names.  Use a
  small font and keep the labels inconspicuous. The information should be
  available, but shouldn't be a main feature of the map.
* Classify the points themselves into different colors based on a category.
  For example, categories could include "tourist destination", "police
  station", and "town center".

|moderate| 
...............................................................................

* Do the same as the |basic| section.
* Classify the point size by importance: the more significant a feature, the
  larger its point. However, don't exceed the point size of :kbd:`2.00`.
* For features that aren't located at a single point (for example,
  provincial/regional names, or town names at a large scale), don't assign any
  point at all.

|hard|
...............................................................................

* Don't use point symbols to symbolize the layer at all. Instead, use labels
  centered over the points; the point symbols themselves should have no size.
* Use :guilabel:`Data defined settings` to style the labels into meaningful
  categories.
* Add appropriate columns to the attribute data if necessary. When doing so,
  don't create fictional data - rather, use the :guilabel:`Field Calculator` to
  populate the new columns, based on appropriate existing values in the
  dataset.

Add the line layer
-------------------------------------------------------------------------------

* Add the road layer and then change its symbology. Don't label the roads.

|basic|
...............................................................................

* Change the road symbology to a light color with a broad line. Make it
  somewhat transparent as well.

|moderate|
...............................................................................

* Create a symbol with multiple symbol layers. The resulting symbol should look
  like a real road. You can use a simple symbol for this; for example, a black
  line with a thin white solid line running down the center. It can be more
  elaborate as well, but the resulting map should not look too busy.
* If your dataset has a high density of roads at the scale you want to show the
  map at, you should have two road layers: the elaborate road-like symbol, and
  a simpler symbol at smaller scales. (Use scale-based visibility to make them
  switch out at appropriate scales.)
* All symbols should have multiple symbol layers. Use symbols to make them
  display correctly.

|hard|
...............................................................................

* Do the same as in the |moderate| section above.
* In addition, roads should be classified. When using realistic road-like
  symbols, each type of road should have an appropriate symbol; for example, a
  highway should appear to have two lanes in either direction.

Add the polygon layer
-------------------------------------------------------------------------------

* Add the land use layer and change its symbology.

|basic|
...............................................................................

* Classify the layer according to land use. Use solid colors.

|moderate|
...............................................................................

* Classify the layer according to land use. Where appropriate, incorporate
  symbol layers, different symbol types, etc. Keep the results looking subdued
  and uniform, however. Keep in mind that this will be part of a backdrop!

|hard|
...............................................................................

* Use rule-based classification to classify the land use into general
  categories, such as "urban", "rural", "nature reserve", etc.

Create the raster backdrop
-------------------------------------------------------------------------------

* Create a hillshade from the DEM, and use it as an overlay for a classified
  version of the DEM itself. You could also use the :guilabel:`Relief` plugin
  (as shown in the lesson on plugins).

Finalize the base map
-------------------------------------------------------------------------------

* Using the resources you above, create a base map using some or all of the
  layers. This map should include all the basic information needed to orient
  the user, as well as being visually unified / "simple".

Analyze the data
===============================================================================

* You are looking for a property that satisfies certain criteria.
* You can decide on your own criteria, which you must document.
* There are some guidelines for these criteria:

  * the target property should be of (a) certain type(s) of land use
  * it should be within a given distance from roads, or be crossed by a road
  * it should be within a given distance from some category of points, like a
    hospital for example

|moderate| / |hard| 
-------------------------------------------------------------------------------

* Include raster analysis in your results. Consider at least one derived
  property of the raster, such as its aspect or slope.

Final Map
===============================================================================

* Use the :guilabel:`Map Composer` to create a final map, which incorporates
  your analysis results.
* Include this map in a document along with your documented criteria. If the
  map has become too vsually busy due to the added layer(s), deselect the
  layers which you feel are the least necessary.
* Your map must include a title and a legend.
