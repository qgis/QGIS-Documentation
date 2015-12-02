|updatedisclaimer|

.. _atlasgeneration:

.. index:: Atlas_Generation

Atlas generation
================

The Print Composer includes generation functions that allow you to create map books
in an automated way. The concept is to use a coverage layer, which contains
geometries and fields. For each geometry in the coverage layer, a new output
will be generated where the content of some canvas maps will be moved to
highlight the current geometry. Fields associated with this geometry can be used
within text labels.

Every page will be generated with each feature. To enable the generation
of an atlas and access generation parameters, refer to the `Atlas generation`
tab. This tab contains the following widgets (see Figure_composer_atlas_):

.. _figure_composer_atlas:

.. only:: html

   **Figure Composer Atlas:**

.. figure:: /static/user_manual/print_composer/print_composer_atlas.png
   :align: center

   Atlas generation tab |nix|

* |checkbox| :guilabel:`Generate an atlas`, which enables or disables the atlas generation.
* A :guilabel:`Coverage layer` |selectstring| combo box that allows you to choose the
  (vector) layer containing the features on which to iterate over.
* An optional |checkbox| :guilabel:`Hidden coverage layer` that, if checked, will
  hide the coverage layer (but not the other ones) during the generation.
* An optional :guilabel:`Page name` combo box to give a more explicite name to each feature's page(s)
  when previewing atlas. You can select an attribute of the coverage layer or set an expression. If this option is empty,
  |qg| will use an internal ID, according to the filter and/or the sort order applied to the layer.
* An optional :guilabel:`Filter with` text area that allows you to specify an
  expression for filtering features from the coverage layer. If the expression
  is not empty, only features that evaluate to ``True`` will be selected. The
  button on the right allows you to display the expression builder.
* An optional |checkbox| :guilabel:`Sort by` that, if checked, allows you to
  sort features of the coverage layer. The associated combo box allows you to choose
  which column will be used as the sorting key. Sort order (either ascending or
  descending) is set by a two-state button that displays an up or a down arrow.
  
You also have options to set the output of the atlas:

* An :guilabel:`Output filename expression` textbox that is used to generate a
  filename for each geometry if needed. It is based on expressions. This field is
  meaningful only for rendering to multiple files.
* A |checkbox| :guilabel:`Single file export when possible` that allows you to force
  the generation of a single file if this is possible with the chosen output format
  (PDF, for instance). If this field is checked, the value of the
  :guilabel:`Output filename expression` field is meaningless.



You can use multiple map items with the atlas generation; each map will be rendered according
to the coverage features. To enable atlas generation for a specific map item, you need to check
|checkbox|:guilabel:`Controlled by Atlas` under the item properties of the map item. Once checked, you can set:

* A radiobutton |radiobuttonon| :guilabel:`Margin around feature` that allows you to select the amount
  of space added around each geometry within the allocated map. Its value is
  meaningful only when using the auto-scaling mode.
* A |radiobuttonoff| :guilabel:`Predefined scale` (best fit). It will use the best fitting option from the list
  of predefined scales in your project properties settings (see :guilabel:`Project --> Project Properties --> General --> Project Scales` 
  to configure these predefined scales).
* A |radiobuttonoff| :guilabel:`Fixed scale` that allows you to toggle between auto-scale
  and fixed-scale mode. In fixed-scale mode, the map will only be translated for
  each geometry to be centered. In auto-scale mode, the map's extents are computed
  in such a way that each geometry will appear in its entirety.

Labels
------

In order to adapt labels to the feature the atlas plugin iterates over, you can include expressions.
For example, for a city layer with fields CITY_NAME and ZIPCODE, you could insert this:

.. code::

   The area of [% upper(CITY_NAME) || ',' || ZIPCODE || ' is ' format_number($area/1000000,2) %] km2
 
The information `[% upper(CITY_NAME) || ',' || ZIPCODE || ' is ' format_number($area/1000000,2) %]` 
is an expression used inside the label. That would result in the generated atlas as:

`The area of PARIS,75001 is 1.94 km2`


.. _atlas_data_defined_override:

Data Defined Override Buttons
-----------------------------

There are several places where you can use a |mIconDataDefine| :sup:`Data Defined Override` 
button to override the selected setting. These options are particularly useful with Atlas Generation.

For the following examples the `Regions` layer of the |qg| sample dataset is used and selected
for Atlas Generation.
We also assume the paper format `A4 (210X297)` is selected in the :guilabel:`Composition` tab 
for field :guilabel:`Presets`.

With a `Data Defined Override` button you can dynamically set the paper orientation. 
When the height (north-south) of the extents of a region is greater than its width (east-west), you
rather want to use `portrait` instead of `landscape` orientation to optimize the use of paper.
 
In the :guilabel:`Composition` you can set the field :guilabel:`Orientation` and select `Landscape` 
or `Portrait`. We want to set the orientation dynamically using an expression depending on the region geometry. 
press the |mIconDataDefine| button of field :guilabel:`Orientation`, select :menuselection:`Edit...` so
the :guilabel:`Expression string builder` dialog opens. Give following expression:

.. code::

   CASE WHEN bounds_width($atlasgeometry) > bounds_height($atlasgeometry) THEN 'Landscape' ELSE 'Portrait' END

Now the paper orients itself automatically for each Region you need to reposition the location 
of the composer item as well. For the map item you can use the |mIconDataDefine| button of 
field :guilabel:`Width` to set it dynamically using following expression: 

.. code::

   (CASE WHEN bounds_width($atlasgeometry) > bounds_height($atlasgeometry) THEN 297 ELSE 210 END) - 20

Use the |mIconDataDefine| button of field :guilabel:`Heigth` to provide following expression: 

.. code::

   (CASE WHEN bounds_width($atlasgeometry) > bounds_height($atlasgeometry) THEN 210 ELSE 297 END) - 20

When you want to give a title above map in the center of the page, insert a label item above the map.
First use the item properties of the label item to set the horizontal alignment to |radiobuttonon| :guilabel:`Center`.
Next activate from :guilabel:`Reference point` the upper middle checkbox.  
You can provide following expression for field :guilabel:`X` :

.. code::

   (CASE WHEN bounds_width($atlasgeometry) > bounds_height($atlasgeometry) THEN 297 ELSE 210 END) / 2

For all other composer items you can set the position in a similar way so they are correctly positioned 
when page is automatically rotated in portrait or landscape.

Information provided is derived from the excellent blog (in English and Portugese) 
on the Data Defined Override options Multiple_format_map_series_using_QGIS_2.6_ .

This is just one example of how you can use Data Defined Override option.

.. _atlas_preview:

Preview
-------

.. _figure_composer_atlas:

.. only:: html

   **Figure Composer Atlas:**

.. figure:: /static/user_manual/print_composer/print_composer_atlas_preview.png
   :align: center

   Atlas Preview toolbar |nix|

Once the atlas settings have been configured and composer items (map, table, image...) linked to it, you can create a preview of all the pages by
clicking on :menuselection:`Atlas --> Preview Atlas` or |mIconAtlas| :sup:`Preview Atlas` icon. You can then use the arrows in the same toolbar to navigate through all the features:

* |mActionAtlasFirst| :sup:`First feature`
* |mActionAtlasPrev| :sup:`Previous feature`
* |mActionAtlasNext| :sup:`Next feature`
* |mActionAtlasLast| :sup:`Last feature`
You can also use the combo box to directly select and preview a specific feature. The combo box shows 
atlas features name according to the expression set in the atlas :guilabel:`Page name` option. 

Generation
----------

The atlas generation can be done in different ways. For example, with :menuselection:`Atlas --> Print Atlas`, you can directly print it. You can also create a PDF using :menuselection:`Atlas --> Export Atlas as PDF`: The user will be asked for a directory for saving all the generated PDF files (except if the |checkbox| :guilabel:`Single file export when possible` has been selected).
If you need to print just a page of the atlas, simply start the preview function, select the page you need and click on :menuselection:`Composer --> Print` (or create a PDF).



.. _Multiple_format_map_series_using_QGIS_2.6: http://sigsemgrilhetas.wordpress.com/2014/11/09/series-de-mapas-com-formatos-multiplos-em-qgis-2-6-parte-1-multiple-format-map-series-using-qgis-2-6-part-1
