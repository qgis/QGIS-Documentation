|updatedisclaimer|

.. index:: Attribute_Table


The Attribute Table Item
========================

It is possible to add parts of a vector attribute table to the Print Composer
canvas: Click the |mActionOpenTable| :sup:`Add attribute table` icon, click and drag 
with the left mouse button on the Print Composer canvas to place and size the item. 
You can better position and customize its appearance in the :guilabel:`Item Properties` tab.

The :guilabel:`Item properties` tab of an attribute table provides the following
functionalities (see figure_composer_table_1_):

.. _Figure_composer_table_1:

.. only:: html

   **Figure Composer Attribute Table 1:**

.. figure:: /static/user_manual/print_composer/attribute_properties.png
   :align: center

   Attribute table Item properties Tab |nix|


Main properties
---------------

The :guilabel:`Main properties` dialog of the attribute table` provides the 
following functionalities (see figure_composer_table_2_):

.. _Figure_composer_table_2:

.. only:: html

   **Figure Composer Attribute Table 2:**

.. figure:: /static/user_manual/print_composer/attribute_mainproperties.png
   :align: center

   Attribute table Main properties Dialog |nix|

* For :guilabel:`Source` you can normally select only 'Layer features'. 
* With :guilabel:`Layer` you can choose from the vector layers loaded in the project.
* In case you activated the |checkbox|:guilabel:`Generate an atlas` option in the 
  :guilabel:`Atlas generation` tab, there are two additional :guilabel:`Source` possible:
  'Current atlas feature' (see figure_composer_table_2b_) and 'Relation children'
  (see figure_composer_table_2c_). Choosing the 'Current atlas feature'
  you won't see any option to choose the layer, and the table item will only 
  show a row with the attributes from the current feature of the atlas coverage layer. 
  Choosing 'Relation children', an option with the relation names will show up.
  The 'Relation children' option can only be used if you have defined a relation using 
  your atlas coverage layer as parent, and the table will show the children rows of 
  the atlas coverage layer's current feature (for further information about the atlas generation, see :ref:`atlas_generation`).
* The button **[Refresh table data]** can be used to refresh the table when the actual 
  contents of the table has changed.


.. _Figure_composer_table_2b:

.. only:: html

   **Figure Composer Attribute Table 2b:**

.. figure:: /static/user_manual/print_composer/attribute_mainatlas.png
   :align: center
  
   Attribute table Main properties for 'Current atlas feature' |nix|


.. _Figure_composer_table_2c:

.. only:: html

   **Figure Composer Attribute Table 2c:**

.. figure:: /static/user_manual/print_composer/attribute_mainrelation.png
   :align: center

   Attribute table Main properties for 'Relation children' |nix|


* The button **[Attributes...]** starts the :guilabel:`Select attributes` menu, see 
  figure_composer_table_3_, that can be used to change the visible contents of the table.
  After making changes use the **[OK]** button to apply changes to the table. The upper part of 
  the window shows the list of the attributes to display and the lower part helps to set the way the data is sorted.

  .. _Figure_composer_table_3:

  .. only:: html

     **Figure Composer Attribute Table 3:**

  .. figure:: /static/user_manual/print_composer/attribute_select.png
     :align: center

     Attribute table Select attributes Dialog |nix|

  In the :guilabel:`Columns` section you can:
  
  * Remove an attribute, just select an attribute row by clicking anywhere in the row 
    and press the minus button to remove the selected attribute. 
  * Add a new attribute use the plus button. At the end a new empty row appears and you can 
    select empty cell of the column :guilabel:`Attribute`. You can select a field attribute from 
    the list or you can select to build a new attribute using a regular expression 
    (|mIconExpression| button). Of course you can modify every already existing attribute 
    by means of a regular expression.
  * Use the up and down arrows to change the order of the attributes in the table.
  * Select a cell in the Headings column and, to change the heading, just type in a new name.
  * set a precise Alignment (mixing vertical and horizontal alignment options) for each column.
  * Select a cell in the Width column and change it from Automatic to a width in mm, just 
    type a number. When you want to change it back to Automatic, use the cross.
  * The **[Reset]** button can always be used to restore it to the original attribute settings.

  In the :guilabel:`Sorting` section you can:
  
  * Add an attribute to sort the table with. Select an attribute and set the sorting order 
    to 'Ascending' or 'Descending' and press the plus button. A new line is added to the sort order list.
  * select a row in the list and use the up and down button to change the sort priority on attribute level. 
    Selecting a cell in the Sort Order column helps you change the sorting order of the attribute field. 
  * use the minus button to remove an attribute from the sort order list.


Feature filtering
-----------------

The :guilabel:`Feature filtering` dialog of the attribute table provides 
the following functionalities (see figure_composer_table_4_):

.. _Figure_composer_table_4:

.. only:: html

   **Figure Composer Attribute Table 4:**

.. figure:: /static/user_manual/print_composer/attribute_filter.png
   :align: center

   Attribute table Feature filtering Dialog |nix|

You can: 

* Define the :guilabel:`Maximum rows` to be displayed.
* Activate |checkbox| :guilabel:`Remove duplicate rows from table` to show unique records only. 
* Activate |checkbox| :guilabel:`Show only visible features within a map` and select the 
  corresponding :guilabel:`Composer map` to display the attributes of features only visible 
  on selected map. 
* Activate |checkbox| :guilabel:`Show only features intersecting Atlas feature` is only 
  available when |checkbox| :guilabel:`Generate an atlas` is activated. When activated it will
  show a table with only the features shown on the map of that particular page of the atlas.
* Activate |checkbox| :guilabel:`Filter with` and provide a filter by typing in the input line 
  or insert a regular expression using the given |mIconExpression| expression button. 
  A few examples of filtering statements you can use when you have loaded the airports 
  layer from the Sample dataset:

  * ``ELEV > 500``
  * ``NAME = 'ANIAK'`` 
  * ``NAME NOT LIKE 'AN%'`` 
  * ``regexp_match( attribute( $currentfeature, 'USE' )  , '[i]')``

  The last regular expression will include only the airports that have a letter 'i' 
  in the attribute field 'USE'. 

Appearance
----------

The :guilabel:`Appearance` dialog of the attribute table provides 
the following functionalities  (see figure_composer_table_5_):

.. _Figure_composer_table_5:

.. only:: html

   **Figure Composer Attribute Table 5:**

.. figure:: /static/user_manual/print_composer/attribute_appearance.png
   :align: center

   Attribute table appearance Dialog |nix|

* Click |checkbox| :guilabel:`Show empty rows` to fill the attribute table with empty cells. 
  This option can also be used to provide additional empty cells when you have a result to show!
* With :guilabel:`Cell margins` you can define the margin around text in each cell of the table.
* With :guilabel:`Display header` you can select from a list one of 'On first frame', 
  'On all frames' default option, or 'No header'.
* The option :guilabel:`Empty table` controls what will be displayed when the result selection is empty.

  * **Draw headers only**, will only draw the header except if you have chosen 'No header' for :guilabel:`Display header`.
  * **Hide entire table**, will only draw the background of the table. You can 
    activate |checkbox| :guilabel:`Don't draw background if frame is empty` in :guilabel:`Frames` 
    to completely hide the table.
  * **Show set message**, will draw the header and adds a cell spanning all columns and 
    display a message like 'No result' that can be provided in the option :guilabel:`Message to display`  

* The option :guilabel:`Message to display` is only activated when you have selected 
  **Show set message** for :guilabel:`Empty table`. The message provided will be shown in 
  the table in the first row, when the result is an empty table.
* With :guilabel:`Background color` you can set the background color of the table. 
  The :guilabel:`Advanced customization` option helps you define different background colors 
  for each cell (see figure_composer_table_6_)

   .. _Figure_composer_table_6:

.. only:: html

   **Figure Composer Attribute Table 6:**

.. figure:: /static/user_manual/print_composer/attribute_background.png
   :align: center

   Attribute table Advanced Background Dialog |nix|

* With the :guilabel:`Wrap text on` option, you can define a character on which 
  the cell content will be wraped each time it is met
* With :guilabel:`Oversized text` you define the behaviour when the width set for a column is 
  smaller than its content's length. It can be **Wrap text** or **Truncate text**.


Show grid
---------

The :guilabel:`Show grid` dialog of the attribute table provides 
the following functionalities (see figure_composer_table_7_):

   .. _Figure_composer_table_7:

.. only:: html

   **Figure Composer Attribute Table 7:**

.. figure:: /static/user_manual/print_composer/attribute_grid.png
   :align: center

   Attribute table Show grid Dialog |nix|

* Activate |checkbox| :guilabel:`Show grid` when you want to display the grid, the outlines of the table cells. 
* With :guilabel:`Line width` you can set the thickness of the lines used in the grid.
* The :guilabel:`Color` of the grid can be set using the color selection dialog. 


Fonts and text styling
----------------------

The :guilabel:`Fonts and text styling` dialog of the attribute table 
provides the following functionalities (see figure_composer_table_8_):

   .. _Figure_composer_table_8:

.. only:: html

   **Figure Composer Attribute Table 8:**

.. figure:: /static/user_manual/print_composer/attribute_fonts.png
   :align: center

   Attribute table Fonts and text styling Dialog |nix|

* You can define :guilabel:`Font` and :guilabel:`Color` for :guilabel:`Table heading` and :guilabel:`Table contents`.
* For :guilabel:`Table heading` you can additionally set the :guilabel:`Alignment` to 
  `Follow column alignment` or override this setting by choosing `Left`, `Center` or `Right`. 
  The column alignment is set using the :guilabel:`Select Attributes` dialog (see Figure_composer_table_3_ ).  


Frames
-------

The :guilabel:`Frames` dialog of the attribute table provides 
the following functionalities (see figure_composer_table_9_):

   .. _Figure_composer_table_9:

.. only:: html

   **Figure Composer Attribute Table 9:**

.. figure:: /static/user_manual/print_composer/attribute_frame.png
   :align: center

   Attribute table Frames Dialog |nix|

* With :guilabel:`Resize mode` you can select how to render the attribute table contents:

  * `Use existing frames` displays the result in the first frame and added frames only.
  * `Extend to next page` will create as many frames (and corresponding pages) as necessary 
    to display the full selection of attribute table. Each frame can be moved around on the layout. 
    If you resize a frame, the resulting table will be divided up between the other frames. 
    The last frame will be trimmed to fit the table.
  * `Repeat until finished` will also create as many frames as the `Extend to next page` option, 
    except all frames will have the same size.

* Use the **[Add Frame]** button to add another frame with the same size as selected frame. 
  The result of the table that will not fit in the first frame will continue in the next frame 
  when you use the Resize mode `Use existing frames`. 
* Activate |checkbox| :guilabel:`Don't export page if frame is empty` prevents the page 
  to be exported when the table frame has no contents. This means all other composer items, 
  maps, scalebars, legends etc. will not be visible in the result.  
* Activate |checkbox| :guilabel:`Don't draw background if frame is empty` prevents the background 
  to be drawn when the table frame has no contents.

