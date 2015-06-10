|updatedisclaimer|

.. index:: HTML_Frame

The HTML frame item
====================

It is possible to add a frame that displays the contents of a website or even create and style
your own HTML page and display it!
 
Click the |mActionAddHtml| :sup:`Add HTML frame` icon, place the element by dragging a 
rectangle holding down the left mouse button on the Print Composer canvas and position 
and customize the appearance in the :guilabel:`Item Properties` tab 
(see figure_composer_html_1_).

.. _Figure_composer_html_1:

.. only:: html

   **Figure Composer HTML 1:**

.. figure:: /static/user_manual/print_composer/print_composer_html1.png
   :align: center

   HTML frame, the item properties Tab |nix|


HTML Source
------------

As an HTML source, you can either set a URL and activate the URL radiobutton or 
enter the HTML source directly in the textbox provided and activate the Source radiobutton. 

The :guilabel:`HTML Source` dialog of the HTML frame :guilabel:`Item Properties` tab
provides the following functionalities (see figure_composer_html_2_):

.. _Figure_composer_html_2:

.. only:: html

   **Figure Composer HTML 2:**

.. figure:: /static/user_manual/print_composer/print_composer_html2.png
   :align: center

   HTML frame, the HTML Source properties |nix|

* In :guilabel:`URL` you can enter the URL of a webpage you copied from your internet 
  browser or select an HTML file using the browse button |browsebutton|. There is also the 
  option to use the Data defined override button, to provide an URL from the contents of an 
  attribute field of a table or using a regular expression. 
* In :guilabel:`Source` you can enter text in the textbox with some HTML tags or provide a full 
  HTML page.
* The **[insert an expression]** button can be used to insert an expression like 
  ``[%Year($now)%]`` in the Source textbox to display the current year. This button is only 
  activated when radiobutton :guilabel:`Source` is selected. After inserting the expression 
  click somewhere in the textbox before refreshing the HTML frame, otherwise you will 
  lose the expression.
* Activate |checkbox| :guilabel:`Evaluate QGIS expressions in HTML code` to see the result of 
  the expression you have included, otherwise you will see the expression instead. 
* Use the **[Refresh HTML]** button to refresh the HTML frame(s) to see the result of
  changes.


Frames
-------

The :guilabel:`Frames` dialog of the HTML frame :guilabel:`Item Properties` tab
provides the following functionalities (see figure_composer_html_3_):

.. _Figure_composer_html_3:

.. only:: html

   **Figure Composer HTML 3:**

.. figure:: /static/user_manual/print_composer/print_composer_html3.png
   :align: center

   HTML frame, the Frames properties |nix|

* With :guilabel:`Resize mode` you can select how to render the HTML contents:

  * `Use existing frames` displays the result in the first frame and added frames only.
  * `Extend to next page` will create as many frames (and corresponding pages) as 
    necessary to render the height of the web page. Each frame can be moved around on 
    the layout. If you resize a frame, the webpage will be divided up between the 
    other frames. The last frame will be trimmed to fit the web page.
  * `Repeat on every page` will repeat the upper left of the web page on every page 
    in frames of the same size.
  * `Repeat until finished` will also create as many frames as the 
    `Extend to next page` option, except all frames will have the same size.

* Use the **[Add Frame]** button to add another frame with the same size as selected 
  frame. If the HTML page that will not fit in the first frame it will continue 
  in the next frame when you use :guilabel:`Resize mode` or :guilabel:`Use 
  existing frames`. 
* Activate |checkbox| :guilabel:`Don't export page if frame is empty` prevents 
  the map layout from being exported when the frame has no HTML contents. This 
  means all other composer items, 
  maps, scalebars, legends etc. will not be visible in the result.  
* Activate |checkbox| :guilabel:`Don't draw background if frame is empty` 
  prevents the HTML frame being drawn if the frame is empty.


Use smart page breaks and User style sheet
-------------------------------------------

The :guilabel:`Use smart page breaks` dialog and :guilabel:`Use style sheet` dialog of 
the HTML frame :guilabel:`Item Properties` tab provides the following functionalities 
(see figure_composer_html_4_):

.. _Figure_composer_html_4:

.. only:: html

   **Figure Composer HTML 4:**

.. figure:: /static/user_manual/print_composer/print_composer_html4.png
   :align: center

   HTML frame, Use smart page breaks and User stylesheet properties |nix|

* Activate |checkbox| :guilabel:`Use smart page breaks` to prevent the html frame contents 
  from breaking mid-way a line of text so it continues nice and smooth in the next frame. 
* Set the :guilabel:`Maximum distance` allowed when calculating where to place page 
  breaks in the html. This distance is the maximum amount of empty space allowed at the 
  bottom of a frame after calculating the optimum break location. Setting a larger value 
  will result in better choice of page break location, but more wasted space at the bottom 
  of frames. This is only used when :guilabel:`Use smart page breaks` is activated.
* Activate |checkbox| :guilabel:`User stylesheet` to apply HTML styles that often is provided 
  in cascading style sheets. An example of style code is provide below to set the color of
  ``<h1>`` header tag to green and set the font and fontsize of text included in paragraph 
  tags ``<p>``.

  .. code-block:: css 

     h1 {color: #00ff00;
     }
     p {font-family: "Times New Roman", Times, serif;
        font-size: 20px;
     }

* Use the **[Update HTML]** button to see the result of the stylesheet settings.


.. index:: Elements_Alignment
