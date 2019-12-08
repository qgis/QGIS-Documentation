
|LS| Creating a Dynamic Print Layout
===============================================================================

Now that you've learned to create a basic map layout we go a step further and
create a map layout that adapts dynamically to our map extent and to the page
properties, e.g. when you change the size of the page. Also, the date of creation
will adapt dynamically.

|moderate| |FA| Creating the dynamic map canvas
-------------------------------------------------------------------------------

#. Load the ESRI Shapefile format datasets :file:`protected_areas.shp`, :file:`places.shp`,
   :file:`rivers.shp` and :file:`water.shp`
   into the map canvas and adapt its properties to suit your own convenience.
#. After everything is rendered and symbolized to your liking,
   click the |newLayout| :sup:`New Print Layout` icon in the toolbar or
   choose :menuselection:`File --> New Print Layout`. You will be prompted to
   choose a title for the new layer.
#. We want to create a map layout consisting of a header and a map with the regions of
   Alaska. The layout should have a margin of 7.5 mm and the header should be 36mm high.
#. Create a map item called ``main map`` on the canvas and go to the :guilabel:`Layout` panel.
   Scroll down to the :guilabel:`Variables` section and find the :guilabel:`Layout` part.
   Here we set some variables you can use all over the dynamic print layout. Go to the :guilabel:`Layout` panel
   and scroll down to the :guilabel:`Variables` section.  The first variable will define the margin.
   Press the |signPlus| button and type in the name ``sw_layout_margin``. Set the value to ``7.5``. Press
   the |signPlus| button again and type in the name ``sw_layout_height_header``. Set the value to ``36``.
#. Now you are ready to create the position and the size of the map canvas automatically
   by means of the variables. Go to the :guilabel:`Item Properties` panel and open the :guilabel:`Position and Size` section.
   Click the |dataDefineExpressionOn| :sup:`Data defined override` for :guilabel:`X` and from the :guilabel:`Variables` entry,
   choose ``@sw_layout_margin``. 
#. Click the |dataDefineExpressionOn| :sup:`Data defined override` for :guilabel:`Y`,
   choose :guilabel:`Edit...` and type in the formula
   
   ::
   
    to_real(@sw_layout_margin) + to_real(@sw_layout_height_header)
    
#. You can create the size of the map item by using the variables for :guilabel:`Width` and :guilabel:`Height`.
   Click the |dataDefineExpressionOn| :sup:`Data defined override` for :guilabel:`Width` and choose :guilabel:`Edit ...` again.
   Fill in the formula
   
   ::
   
    @layout_pagewidth - @sw_layout_margin * 2

   Click the |dataDefineExpressionOn| :sup:`Data defined override` for :guilabel:`Height` and choose :guilabel:`Edit ...`.
   Here fill in the formula
   
   ::
    
    @layout_pageheight -  @sw_layout_header -  @sw_layout_margin * 2
    
#. We will also create a grid containing the coordinates of the main canvas map extent.
   Go to :guilabel:`Item Properties` again and choose the :guilabel:`Grids` section.
   Insert a grid by clicking the
   |signPlus| button. Go to :guilabel:`Modify grid ...` and set the :guilabel:`Interval` for X, Y and :guilabel:`Offset` according
   to the map scale you chose in the QGIS main canvas. The :guilabel:`Grid type` :guilabel:`Cross` is very well suited
   for our purposes.
   
|moderate| |FA| Creating the dynamic header
-------------------------------------------------------------------------------

#. Insert a rectangle which will contain the header with the |addBasicShape| :sup:`Add Shape` button. 
   In the :guilabel:`Items` panel enter the name ``header``.
#. Again, go to the :guilabel:`Item Properties` and open the :guilabel:`Position and Size` section.
   Using |dataDefineExpressionOn| :sup:`Data defined override`,
   choose the ``@sw_layout_margin`` variable for :guilabel:`X` as well as for :guilabel:`Y`.
   :guilabel:`Width` shall be defined by the expression
   
   ::
    
    @layout_pagewidth - @sw_layout_margin * 2
    
   and :guilabel:`Height` by the expression 
   
   ::
    
    @sw_layout_header
    
#. We will insert a horizontal line and two vertical lines to divide the header into different sections
   using the |addNodesShape| :sup:`Add Node Item`. Create a horizontal line and two vertical lines.
   After entering the names, insert the expression
   
   ::
    
    @sw_layout_margin
    
   for :guilabel:`X`,
   
   ::
    
    @sw_layout_margin + 8
    
   for :guilabel:`Y`, and
   
   ::
    
    @layout_pagewidth -  @sw_layout_margin * 2 - 53.5
    
   for the :guilabel:`Width`.
#. The first vertical line is defined by
   ::
   
    @layout_pagewidth -  @sw_layout_margin * 2 - 53.5
   
   for :guilabel:`X` and
   
   ::
   
    @sw_layout_margin

   for :guilabel:`Y`. It's defined by the height of the header we created, so enter
   the expression
   
   ::
   
     @sw_layout_height_header

   for :guilabel:`Height`.The second vertical line is placed to the left of the first one. Enter the expression
   
   ::
    
    @layout_pagewidth-@sw_layout_margin*2-83.5
    
   for :guilabel:`X` and
   ::
   
    @sw_layout_margin
    
   for :guilabel:`Y`. It shall have the same value for :guilabel:`Height` as the first vertical line: 
   
   ::
   
    @sw_layout_height_header
    
   The figure below shows the structure of our dynamic layout. We will fill
   the areas created by the lines with some elements.

.. figure:: img/dynamic_layout_structure.png
   :align: center

|moderate| |FA| Creating labels for the dynamic header
---------------------------------------------------------------------------------------

#. The title of your QGIS project can be included automatically. The title is set
   in the :guilabel:`Project Properties`.
   Insert a label with the |addLabel| :sup:`Adds a new Label to the layout` button
   and enter the name ``project title (variable)``.
   In the :guilabel:`Main Properties` of the :guilabel:`Items Properties` Panel enter the expression
   
   ::
   
    [%@project title%]
    
   Set the position of the label with the expression
   
   ::
   
    @sw_layout_margin +3
    
   for :guilabel:`X` and
   
   ::
    
    @sw_layout_margin + 0.25
    
   for :guilabel:`Y`. Enter the expression 
   
   ::
   
    @layout_pagewidth - @sw_layout_margin *2 -90
   
   for :guilabel:`Width` (this should give a width of 105 mm), and enter ``11.25`` for :guilabel:`Height`.
   Under :guilabel:`Appearance` set the Font size to 16 pt.
#. The second label will include a description of the map you created. Again, insert a label and name it
   ``map description``. In the :guilabel:`Main Properties` also enter the text ``map description``.
   Here we will also include the date using
   
   ::
    
     printed on: [%format_date(now(),'dd.MM.yyyy')%]
     
   We are again using a variable that QGIS creates automatically.
   For :guilabel:`X` insert the expression 
   
   ::
   
    @sw_layout_margin + 3
  
   and for :guilabel:`Y` enter the expression 
   
   ::
   
    @sw_layout_margin + 11.5
   
#. The third label will include information about your organisation. First we will create some variables
   in the :guilabel:`Variables` menu of the :guilabel:`Item Properties`. Go to the :guilabel:`Layout` menu, click the
   |signPlus| button each time and enter the names ``o_department``, ``o_name`` , ``o_adress``
   and ``o_postcode`` as shown in the picture below.
   In the second row enter the detailed information about your organisation.
   We will use these variables in the :guilabel:`Main Properties`
   section. The position is defined by 
   
   :: 
   
    @layout_pagewidth - @sw_layout_margin - 49.5
    
   for :guilabel:`X` and
    
   ::
   
    @sw_layout_margin + 15.5
    
   for :guilabel:`Y`. :guilabel:`Width` is ``49.00`` and :guilabel:`Height`
   is defined by
   
   ::
    
     @sw_layout_header - 15.5

.. figure:: img/dynamic_layout_organisation.png

|moderate| |FA| Adding pictures to the dynamic header
---------------------------------------------------------------------------------------

#. Use the |addNewImage| :sup:`Adds a new Picture to the layout` button to place a picture above your
   label ``organisation information``. After entering the name ``organisation logo`` define the position
   for :guilabel:`X` with
   
   ::
   
    @layout_pagewidth - @sw_layout_margin - 48.5
    
   and for :guilabel:`Y` with
   
   ::
   
    @sw_layout_margin + 3.5
    
   The size of the logo is set to ``39.292`` for :guilabel:`Width` and ``9.583`` for :guilabel:`Height`.
   To include a logo of your organisation you have to save your logo under your home directory and enter
   the path under :menuselection:`Main Properties --> Image Source`.
#. Our layout still needs a north arrow.
   This will also be insterted by using |addNewImage| :sup:`Adds a new Picture to the layout`.
   Set the name to ``north arrow``, go to :guilabel:`Main Properties` and select the
   :file:`Arrow_02.svg`.
   The position is defined by
   
   ::
   
    @layout_pagewidth - @sw_layout_margin - 68.25
   
   for :guilabel:`X` and by 
   
   ::
   
    @sw_layout_margin + 22.5
   
   for :guilabel:`Y`. We use static numbers here to define the :guilabel:`Width` and the
   :guilabel:`Height`: ``21.027`` and ``21.157``.
  
|moderate| |FA| Creating the scalebar of the dynamic header
----------------------------------------------------------------------------------------

#. To insert a scalebar in the header click on |addScalebar| :sup:`Adds a new Scale Bar to the layout` and
   place it in the rectangle above the north arrow. In :guilabel:`Map` under the :guilabel:`Main Properties`
   choose your ``main map(Map 0)``.
   This means that the scale changes automatically according to the extent you choose
   in the QGIS main canvas. Choose the :guilabel:`Style` ``Numeric``. This means that we insert a simple scale without
   a scalebar. The scale still needs a position and size. For :guilabel:`X` enter
   
   ::
   
    @layout_pagewidth - @sw_layout_margin - 68.25
    
   For :guilabel:`Y` enter 
   
   ::
    
    @sw_layout_margin + 6.5
    
   ,for :guilabel:`Width` enter ``28,639``
   and for :guilabel:`Height` ``13.100``. The ``Reference point``
   should be placed in the center.
  
Congratulations! You created your first dynamic map layout.
Take a look at the layout and check if everything looks the way you want it!
The dynamic map layout reacts automatically when you change the :guilabel:`page properties`.
For example, if you change the page size from DIN A4 to DIN A3, just click the |draw| :sup:`Refresh view` button and
the page design is adapted.

.. figure:: img/dynamic_layout.png
   :align: center

|WN|
-------------------------------------------------------------------------------

On the next page, you will be given an assignment to complete. This will allow
you to practice the techniques you have learned so far.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |LS| replace:: Lesson:
.. |WN| replace:: What's Next?
.. |addBasicShape| image:: /static/common/mActionAddBasicShape.png
   :width: 1.5em
.. |addLabel| image:: /static/common/mActionLabel.png
   :width: 1.5em
.. |addNewImage| image:: /static/common/mActionAddImage.png
   :width: 1.5em
.. |addNodesShape| image:: /static/common/mActionAddNodesShape.png
   :width: 1.5em
.. |addScalebar| image:: /static/common/mActionScaleBar.png
   :width: 1.5em
.. |dataDefineExpressionOn| image:: /static/common/mIconDataDefineExpressionOn.png
   :width: 1.5em
.. |draw| image:: /static/common/mActionDraw.png
   :width: 1.5em
.. |moderate| image:: /static/global/moderate.png
.. |newLayout| image:: /static/common/mActionNewLayout.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
