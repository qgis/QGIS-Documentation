|LS| Forms
======================================================================

When you add new data via digitizing, you're presented with a dialog
that lets you fill in the attributes for that feature.
However, this dialog is not, by default, very nice to look at.
This can cause a usability problem, especially if you have large
datasets to create, or if you want other people to help you digitize
and they find the default forms to be confusing.

Fortunately, QGIS lets you create your own custom dialogs for a
layer.
This lesson shows you how.

**The goal for this lesson:** To create a form for a layer.

|basic| |FA| Using QGIS' Form Design Functionality
----------------------------------------------------------------------

#. Select the ``roads`` layer in the :guilabel:`Layers` panel
#. Enter *Edit Mode* as before
#. Open the ``roads`` layer's attribute table
#. Right-click on any cell in the table. A short menu will appear,
   that includes the :guilabel:`Open form` entry.
#. Click on it to see the form that QGIS generates for this layer

Obviously it would be nice to be able to do this while looking at the
map, rather than needing to search for a specific street in the
:guilabel:`Attribute Table` all the time.

#. Select the :guilabel:`roads` layer in the :guilabel:`Layers` panel
#. Using the |identify| :sup:`Identify Features` tool, click on any
   street in the map.
#. The :guilabel:`Identify Results` panel opens and shows a tree view
   of the fields values and other general information about the
   clicked feature.
#. At the top of the panel, check the :guilabel:`Auto open form for single feature results`
   checkbox in the |options| sup:`Identify Settings` menu.
#. Now, click again on any street in the map. Along the previous
   :guilabel:`Identify Results` dialog, you'll see the now-familiar
   form:

   .. figure:: img/roads_form.png
      :align: center

#. Each time you click on a single feature with the *Identify* tool,
   its form pops up as long as the :guilabel:`Auto open form` is
   checked.

|basic| |TY| Using the Form to Edit Values
----------------------------------------------------------------------

If you are in edit mode, you can use this form to edit a feature's
attributes.

#. Activate edit mode (if it isn't already activated).
#. Using the |identify| :sup:`Identify Features` tool, click on the
   main street running through |majorUrbanName|:

   .. figure:: img/main_street_selected.png
      :align: center

#. Edit its :guilabel:`highway` value to be ``secondary``
#. Exit edit mode and save your edits
#. Open the :guilabel:`Attribute Table` and note that the value has
   been updated in the attributes table and therefore in the source
   data

|moderate| |FA| Setting Form Field Types
----------------------------------------------------------------------

It's nice to edit things using a form, but you still have to enter
everything by hand.
Fortunately, forms have different kinds of so-called *widgets* that
allow you to edit data in various different ways.

#. Open the :guilabel:`roads` layer's :guilabel:`Properties...`
#. Switch to the :guilabel:`Fields` tab. You'll see this:

   .. figure:: img/fields_panel.png
      :align: center

#. Switch to the :guilabel:`Attribute Form` tab. You'll see this:

   .. figure:: img/attributes_form.png
      :align: center

#. Click on the ``oneway`` row and choose :guilabel:`Checkbox` as
   :guilabel:`Widget Type` in the list of options:

   .. figure:: img/checkbox_selected.png
      :align: center

#. Click :guilabel:`OK`
#. Enter edit mode (if the ``roads`` layer is not already in edit mode)
#. Click on the |identify| :sup:`Identify Features` tool
#. Click on the same main road you chose earlier

You will now see that the :guilabel:`oneway` attribute has a
checkbox next to it denoting ``True`` (checked) or ``False``
(unchecked).

.. _backlink-create-vector-forms-1:

|hard| |TY|
----------------------------------------------------------------------

Set a more appropriate form widget for the :guilabel:`highway` field.

:ref:`Check your results <create-vector-forms-1>`

|hard| |TY| Creating Test Data
----------------------------------------------------------------------

You can also design your own custom form completely from scratch.

#. Create a simple point layer named ``test-data`` with two
   attributes:

   * name (text)
   * age (text)

   .. figure:: img/new_point_layer.png
      :align: center

#. Capture a few points on your new layer using the digitizing tools
   so that you have a little data to play with.
   You should be presented with the default QGIS generated attribute
   capture form each time you capture a new point.

   .. note:: You may need to disable Snapping if still enabled from
      earlier tasks.

   .. figure:: img/new_point_entry.png
      :align: center

.. _creating-new-form:

|hard| |FA| Creating a New Form
----------------------------------------------------------------------

Now we want to create our own custom form for the attribute data
capture phase.
To do this, you need to have *QT Designer* installed (only needed for
the person who creates the forms).

#. Start *QT Designer*.
#. In the dialog that appears, create a new dialog:

   .. figure:: img/qt_new_dialog.png
      :align: center

#. Look for the :guilabel:`Widget Box` along the left of your screen
   (default).
   It contains an item called :guilabel:`Line Edit`.
#. Click and drag this item into your form. This creates a new
   :guilabel:`Line Edit` in the form.
#. With the new line edit element selected, you'll see its
   *properties* along the side of your screen (on the right by
   default):

   .. figure:: img/qt_line_edit.png
      :align: center

#. Set its name to ``Name``.
#. Using the same approach, create a new spinbox and set its name to
   ``Age``.
#. Add a :guilabel:`Label` with the text ``Add a New Person`` in a
   bold font (look in the object *properties* to find out how to set
   this).
   Alternatively, you may want to set the title of the dialog itself
   (rather than adding a label).
#. Click anywhere in your dialog.
#. Find the *Lay Out Vertically* button (in a toolbar along the top
   edge of the screen, by default). This lays out your dialog
   automatically.
#. Set the dialog's maximum size (in its properties) to ``200``
   (width) by ``100`` (height).
#. Save your new form as :file:`exercise_data/forms/add_people.ui`
#. When it's done saving, you can close *Qt Designer*

|hard| |FA| Associating the Form with Your Layer
----------------------------------------------------------------------

#. Go back to QGIS
#. Double click the :guilabel:`test-data` layer in the legend to
   access its properties.
#. Click on the :guilabel:`Fields` tab in the
   :guilabel:`Layer Properties` dialog
#. In the :guilabel:`Attribute editor layout` dropdown, select
   :guilabel:`Provide ui-file`.
#. Click the ellipsis button and choose the :file:`add_people.ui` file
   you just created:

   .. figure:: img/provide_ui_file.png
      :align: center

#. Click :guilabel:`OK` on the :guilabel:`Layer Properties` dialog
#. Enter edit mode and capture a new point
#. When you do so, you will be presented with your custom dialog
   (instead of the generic one that QGIS usually creates).
#. If you click on one of your points using the
   |identify| :sup:`Identify Features` tool, you can now bring up the
   form by right clicking in the identify results window and choosing
   :menuselection:`View Feature Form` from the context menu.
#. If you are in edit mode for this layer, that context menu will show
   :menuselection:`Edit Feature Form` instead, and you can then adjust
   the attributes in the new form even after initial capture.

|IC|
----------------------------------------------------------------------

Using forms, you can make life easier for yourself when editing or
creating data.
By editing widget types or creating an entirely new form from scratch,
you can control the experience of someone who digitizes new data for
that layer, thereby minimizing misunderstandings and unnecessary
errors.

|FR|
----------------------------------------------------------------------

If you completed the advanced section above and have knowledge of
Python, you may want to check out
`this blog entry <https://woostuff.wordpress.com/2011/09/05/qgis-tips-custom-feature-forms-with-python-logic/>`_
about creating custom feature forms with Python logic, which allows
advanced functions including data validation, autocompletion, etc.

|WN|
----------------------------------------------------------------------

Opening a form on identifying a feature is one of the standard actions
that QGIS can perform.
However, you can also direct it to perform custom actions that you
define.
This is the subject of the next lesson.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |FR| replace:: Further Reading
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |TY| replace:: Try Yourself
.. |WN| replace:: What's Next?
.. |basic| image:: /static/common/basic.png
.. |hard| image:: /static/common/hard.png
.. |identify| image:: /static/common/mActionIdentify.png
   :width: 1.5em
.. |majorUrbanName| replace:: Swellendam
.. |moderate| image:: /static/common/moderate.png
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
