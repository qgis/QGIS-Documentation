Lesson: Actions
======================================================================

Now that you have seen a default action in the previous lesson, it is
time to define your own actions.

An action is something that happens when you click on a feature.
It can add a lot of extra functionality to your map, allowing you to
retrieve additional information about an object, for example.
Assigning actions can add a whole new dimension to your map!

**The goal for this lesson:** To learn how to add custom actions.

In this lesson you will use the :guilabel:`school_property` layer you
created previously.
The sample data include photos of each of the three properties you
digitized.
What we are going to do is to associate each property with its image.
Then we will create an action that will open the image for a property
when clicking on the property.

:abbr:`★☆☆ (Basic level)` Follow Along: Add a Field for Images
----------------------------------------------------------------------

The ``school_property`` layer has no way to associate an image with a
property yet. First we will create a field for this purpose.

#. Open the :guilabel:`Layer Properties` dialog.
#. Click on the :guilabel:`Fields` tab.
#. Toggle editing mode:

   .. figure:: img/toggle_editing_mode.png
      :align: center

#. Add a new column:

   .. figure:: img/add_new_column.png
      :align: center

#. Enter the values below:

   .. figure:: img/column_settings.png
      :align: center

#. After the field has been created, move to the
   :guilabel:`Attributes Form` tab and select the ``image`` field.
#. Set :guilabel:`Widget Type` to :guilabel:`Attachment`:

   .. figure:: img/select_file_name.png
      :align: center

#. Click :guilabel:`OK` in the :guilabel:`Layer Properties` dialog.
#. Use the :guilabel:`Identify` tool to click on one of the three
   features in the :guilabel:`school_property` layer.

   Since you are still in edit mode, the dialog should be active and
   look like this:

   .. figure:: img/school_property_no_image.png
      :align: center

#. Click on the browse button (the :guilabel:`...` next to the
   :guilabel:`image` field).
#. Select the path for your image. The images are in
   :file:`exercise_data/school_property_photos/` and are named the
   same as the features they should be associated with.
#. Click :guilabel:`OK`.
#. Associate all of the images with the correct features using this
   method.
#. Save your edits and exit edit mode.


:abbr:`★☆☆ (Basic level)` Follow Along: Creating an Action
----------------------------------------------------------------------

#. Open the :guilabel:`Actions` tab for the
   :guilabel:`school_property` layer, and click on the
   |symbologyAdd| :sup:`Add a new action` button.

   .. figure:: img/layer_actions.png
      :align: center

#. In the :guilabel:`Add New Action` dialog, enter the words
   ``Show Image`` into the :guilabel:`Description` field:

   .. figure:: img/show_image_action.png
      :align: center

   What to do next varies according to your operating system, so
   choose the appropriate course to follow:

   * Windows

     Click on the :guilabel:`Type` dropdown and choose
     :guilabel:`Open`.

   * Ubuntu Linux

     Under :guilabel:`Action`, write ``eog`` for the
     *Gnome Image Viewer*, or write ``display`` to use
     *ImageMagick*.
     Remember to put a space after the command!

   * macOS

     #. Click on the :guilabel:`Type` dropdown and choose
        :guilabel:`Mac`.
     #. Under :guilabel:`Action`, write ``open``.
        Remember to put a space after the command!


   Now you can continue writing the command.

   You want to open the image, and QGIS knows where the image is.
   All it needs to do is to tell the :guilabel:`Action` where the
   image is.

#. Select :guilabel:`image` from the list:

   .. figure:: img/select_image.png
      :align: center

#. Click the :guilabel:`Insert field` button.
   QGIS will add the phrase ``[% "image" %]`` in the
   :guilabel:`Action Text` field.
#. Click the :guilabel:`OK` button to close the
   :guilabel:`Add New Action` dialog
#. Click :guilabel:`OK` to close the :guilabel:`Layer Properties`
   dialog

Now it is time to test the new action:

#. Click on the :guilabel:`school_property` layer in the
   :guilabel:`Layers` panel so that it is highlighted.
#. Find the |actionRun| :sup:`Run feature action` button (in the
   :guilabel:`Attributes Toolbar`).
#. Click on the down arrow to the right of this button.
   There is only one action defined for this layer so far, which is
   the one you just created.

   .. figure:: img/run_feature_action_select.png
      :align: center

#. Click the button itself to activate the tool.
#. Using this tool, click on any of the three school properties.

   The image for that property should open.

:abbr:`★★☆ (Moderate level)` Follow Along: Searching the Internet
----------------------------------------------------------------------

Let's say we are looking at the map and want to know more about the area that a
farm is in. Suppose you know nothing of the area in question and want to find
general information about it. Your first impulse, considering that you're using
a computer right now, would probably be to Google the name of the area. So
let's tell QGIS to do that automatically for us!

#. Open the attribute table for the :guilabel:`landuse` layer.

   We will be using the ``name`` field for each of our landuse
   areas to search Google.
#. Close the attribute table.
#. Go back to :guilabel:`Actions` in :guilabel:`Layer Properties`.
#. Click on the :guilabel:`Create Default Actions` button to add a
   number of pre-defined actions.
#. Remove all the actions but the :guilabel:`Open URL` action with
   the short name :guilabel:`Search Web` using the |symbologyRemove|
   :sup:`Remove the selected action` button below.
#. Double-click on the remaining action to edit it
#. Change the :guilabel:`Description` to ``Google Search``, and
   remove the content of the :guilabel:`Short Name` field.
#. Make sure that :guilabel:`Canvas` is among the
   checked :guilabel:`Action scopes`.

   What to do next varies according to your operating system, so
   choose the appropriate course to follow:

   * Windows

     Under :guilabel:`Type`, choose :guilabel:`Open`.
     This will tell Windows to open an Internet address in your
     default browser, such as Internet Explorer.

   * Ubuntu Linux

     Under :guilabel:`Action`, write ``xdg-open``.
     This will tell Ubuntu to open an Internet address in your
     default browser, such as Chrome or Firefox.

   * macOS

     Under :guilabel:`Action`, write ``open``.
     This will tell macOS to open an Internet address in your default
     browser, such as Safari.

   Now you can continue writing the command

   Whichever command you used above, you need to tell it which
   Internet address to open next.
   You want it to visit Google, and to search for a phrase
   automatically.

   Usually when you use Google, you enter your search phrase into the
   Google Search bar.
   But in this case, you want your computer to do this for you.
   The way you tell Google to search for something (if you don't want
   to use its search bar directly) is by giving your Internet browser
   the address
   ``https://www.google.com/search?q=SEARCH_PHRASE``,
   where ``SEARCH_PHRASE``` is what you want to search for.
   Since we don't know what phrase to search for yet, we will just
   enter the first part (without the search phrase).

#. In the :guilabel:`Action` field, write
   ``https://www.google.com/search?q=``.
   Remember to add a space after your initial command before writing
   this in!

   Now you want QGIS to tell the browser to tell Google to search for
   the value of ``name`` for any feature that you could click on.

#. Select the :guilabel:`name` field.
#. Click :guilabel:`Insert` button:

   .. figure:: img/google_search_action.png
      :align: center

   What this means is that QGIS is going to open the browser and send
   it to the address
   ``https://www.google.com/search?q=[% "name" %]``.
   ``[% "name" %]`` tells QGIS to use the contents of the ``name``
   field as the phrase to search for.

   So if, for example, the landuse area you click on is named
   ``Marloth Nature Reserve``, QGIS is going to send the browser
   to ``https://www.google.com/search?q=Marloth%20Nature%20Reserve``,
   which will cause your browser to visit Google, which will in turn
   search for "Marloth Nature Reserve".

#. If you have not done so already, set everything up as explained
   above.
#. Click the :guilabel:`OK` button to close the
   :guilabel:`Add New Action` dialog
#. Click :guilabel:`OK` to close the :guilabel:`Layer Properties`
   dialog

Now to test the new action.

#. With the :guilabel:`landuse` layer active in the
   :guilabel:`Layers` panel, click on the down arrow to the right of
   the |actionRun| :sup:`Run feature action` button, and select the
   only action (``Google Search``) defined for this layer.
#. Click on any landuse area you can see on the map.
   Your browser will now open, and will start a Google search for the
   place that is recorded as that area's ``name`` value.

.. note:: If your action doesn't work, check that everything was
   entered correctly; typos are common with this kind of work!

:abbr:`★★★ (Advanced level)` Follow Along: Open a Webpage Directly in QGIS
-----------------------------------------------------------------------------

Above, you've seen how to open a webpage in an external browser. There are some
shortcomings with this approach in that it adds an unknowable dependency – will
the end-user have the software required to execute the action on their system?
As you've seen, they don't necessarily even have the same kind of base command
for the same kind of action, if you don't know which OS they will be using. With
some OS versions, the above commands to open the browser might not work at all.
This could be an insurmountable problem.

However, QGIS sits on top of the incredibly powerful and versatile Qt library.
Also, QGIS actions can be arbitrary, tokenized (i.e. using variable information
based on the contents of a field attribute) Python commands!

Now you will see how to use a python action to show a web page.
It is the same general idea as opening a site in an external browser,
but it requires no browser on the user’s system since it uses the Qt
QWebView class (which is a webkit based html widget) to display the
content in a pop-up window.

Let us use Wikipedia this time.
So the URL you request will look like this:

``https://wikipedia.org/wiki/SEARCH_PHRASE``

To create the layer action:

#. Open the :guilabel:`Layer Properties` dialog and head over to the
   :guilabel:`Actions` tab.
#. Set up a new action using the following properties for the action:

   * :guilabel:`Type`: ``Python``
   * :guilabel:`Description`: ``Wikipedia``
   * :guilabel:`Scope`: ``Feature``, ``Canvas``
   * :guilabel:`Action Text`::

         from qgis.PyQt.QtCore import QUrl
         from qgis.PyQt.QtWebKitWidgets import QWebView

         myWV = QWebView(None)
         myWV.load(QUrl('https://wikipedia.org/wiki/[%name%]'))
         myWV.show()

   .. figure:: img/python_action_example.png
      :align: center

   There are a couple of things going on here:

   * ``[%name%]`` will be replaced by the actual attribute value
     when the action is invoked (as before).
   * The code simply creates a new ``QWebView`` instance, sets its
     URL, and then calls ``show()`` on it to make it visible as a
     window on the user’s desktop.

   You could also use this approach to display an image without
   requiring that the users have a particular image viewer on their
   system.

#. Try to use the methods described above to load a Wikipedia page
   using the Wikipedia action you just created.

In Conclusion
----------------------------------------------------------------------

Actions allow you to give your map extra functionality, useful to the
end-user who views the same map in QGIS.
Due to the fact that you can use shell commands for any operating
system, as well as Python, the sky is the limit in terms of the
functions you could incorporate!

What's Next?
----------------------------------------------------------------------

Now that you've done all kinds of vector data creation, you will
learn how to analyze the data to solve problems.
That is the topic of the next module.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |actionRun| image:: /static/common/mAction.png
   :width: 1.5em
.. |symbologyAdd| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |symbologyRemove| image:: /static/common/symbologyRemove.png
   :width: 1.5em
