|LS| Forms
===============================================================================

When you add new data via digitizing, you're presented with a dialog that lets
you fill in the attributes for that feature. However, this dialog is not, by
default, very nice to look at. This can cause a usability problem, especially
if you have large datasets to create, or if you want other people to help you
digitize and they find the default forms to be confusing.

Fortunately, QGIS lets you create your own custom dialogs for a layer. This
lesson shows you how.

**The goal for this lesson:** To create a form for a layer.

|basic| |FA| Using QGIS' Form Design Functionality
-------------------------------------------------------------------------------

* Select the :guilabel:`roads` layer in the :guilabel:`Layers list`.
* Enter :guilabel:`Edit Mode` as before.
* Open its :guilabel:`Attribute Table`.
* Right-click on any cell in the table. A short menu will appear, with the only
  entry being :guilabel:`Open form`.
* Click on it to see the form that QGIS generates for this layer.

Obviously it would be nice to be able to do this while looking at the map,
rather than needing to search for a specific street in the :guilabel:`Attribute
Table` all the time.

* Go to the :menuselection:`Settings --> Options` menu.
* In the dialog that appears, select the :guilabel:`Map Tools` tab.
* Check the :guilabel:`Open feature form ...` checkbox:

.. image:: /static/training_manual/create_vector_data/open_feature_form.png
   :align: center

* Click :guilabel:`Ok`.
* Select the :guilabel:`roads` layer in the :guilabel:`Layers list`.
* Using the :guilabel:`Identify` tool, click on any street in the map.

  |mActionIdentify|

Instead of the normal :guilabel:`Identify` dialog, you'll see the now-familiar
form instead:

.. image:: /static/training_manual/create_vector_data/roads_form.png
   :align: center

|basic| |TY| Using the Form to Edit Values
-------------------------------------------------------------------------------

If you are in edit mode, you can use this form to edit a feature's attributes.

* Activate edit mode (if it isn't already activated).
* Using the :guilabel:`Identify` tool, click on the main street running through
  Swellendam (or a major road in your town):

.. image:: /static/training_manual/create_vector_data/main_street_selected.png
   :align: center

* Edit its :guilabel:`highway` value to be :kbd:`secondary`.
* Save your edits.
* Exit edit mode.
* Open the :guilabel:`Attribute Table` and note that the value has been updated
  in the attributes table and therefore in the source data.

.. Note:: There is more than one road on this map called :kbd:`Voortrek Street`.

|moderate| |FA| Setting Form Field Types
-------------------------------------------------------------------------------

It's nice to edit things using a form, but you still have to enter everything
by hand. Fortunately, forms have different kinds of so-called *widgets* that
allow you to edit data in various different ways.

* Open the :guilabel:`roads` layer's :guilabel:`Layer Properties`.
* Switch to the :guilabel:`Fields` tab. You'll see this:

.. image:: /static/training_manual/create_vector_data/fields_panel.png
   :align: center

* Click on the :guilabel:`Line edit` button in the same row as
  :guilabel:`man_made` and you'll be given a new dialog.
* Select :guilabel:`Checkbox` in the list of options:

.. image:: /static/training_manual/create_vector_data/checkbox_selected.png
   :align: center

* Click :guilabel:`OK`.
* Enter edit mode (if the :guilabel:`roads` layer is not already in edit mode.
* Click on the :guilabel:`Identify` tool.
* Click on the same main road you chose earlier.

You'll now see that the :guilabel:`man_made` attribute has a checkbox next to it
denoting :kbd:`True` (checked) or :kbd:`False` (unchecked).

.. _backlink-create-vector-forms-1:

|hard| |TY|
-------------------------------------------------------------------------------

Set a more appropriate form widget for the :guilabel:`highway` field.

:ref:`Check your results <create-vector-forms-1>`

|hard| |TY| Creating Test Data
-------------------------------------------------------------------------------

You can also design your own custom form completely from scratch.

* Create a simple point layer named :kdb:`test-data` with two attributes:

  * Name (text)
  * Age (text)

.. image:: /static/training_manual/create_vector_data/new_point_layer.png
   :align: center

* Capture a few points on your new layer using the digitizing tools so
  that you have a little data to play with. You should be presented with the
  default QGIS generated attribute capture form each time you capture a new
  point.

.. note:: You may need to disable Snapping if still enabled from earlier tasks.

.. image:: /static/training_manual/create_vector_data/new_point_entry.png
   :align: center

|hard| |FA| Creating a New Form
-------------------------------------------------------------------------------

Now we want to create our own custom form for the attribute data capture phase.
To do this, you need to have *Qt4 Designer* installed (only needed for the
person who creates the forms). It should be provided as part of your course
materials, if you're using Windows. You may need to look for it if you're using
another OS. In Ubuntu, do the following in the terminal:

.. note:: At the time of writing, Qt5 is the latest version available. However,
  this process specifically requires Qt4 and is not necessarily compatible with
  Qt5.

:kbd:`sudo apt-get install qt4-designer`

... and it should install automatically. Otherwise, look for it in the
*Software Center*.

* Start *Designer* by opening its *Start Menu* entry in Windows (or whatever
  approach is appropriate in your OS).
* In the dialog that appears, create a new dialog:

.. image:: /static/training_manual/create_vector_data/qt4_new_dialog.png
   :align: center

* Look for the :guilabel:`Widget Box` along the left of your screen (default).
  It contains an item called :guilabel:`Line Edit`.
* Click and drag this item into your form. This creates a new :guilabel:`Line
  Edit` in the form.
* With the new line edit element selected, you'll see its *properties* along
  the side of your screen (on the right by default):

.. image:: /static/training_manual/create_vector_data/qt4_line_edit.png
   :align: center

* Set its name to :kbd:`Name`.
* Using the same approach, create a new spinbox and set its name to :kbd:`Age`.
* Add a :guilabel:`Label` with the text :kbd:`Add a New Person` in a bold font
  (look in the object *properties* to find out how to set this). Alternatively,
  you may want to set the title of the dialog itself (rather than adding a
  label).
* Click anywhere in your dialog.
* Find the :guilabel:`Lay Out Vertically` button (in a toolbar along the top
  edge of the screen, by default). This lays out your dialog automatically.
* Set the dialog's maximum size (in its properties) to :kbd:`200` (width) by
  :kbd:`100` (height).
* Save your new form as :kbd:`exercise_data/forms/add_people.ui`.
* When it's done saving, you can close the *Qt4 Designer* program.

|hard| |FA| Associating the Form with Your Layer
-------------------------------------------------------------------------------

* Go back to QGIS.
* Double click the :guilabel:`test-data` layer in the legend to access its properties.
* Click on the :guilabel:`Fields` tab in the :guilabel:`Layer Properties`
  dialog.
* In the :guilabel:`Attribute editor layout` dropdown, select
  :guilabel:`Provide ui-file`.
* Click the ellipsis button and choose the :kbd:`add_people.ui` file you just
  created:

.. image:: /static/training_manual/create_vector_data/provide_ui_file.png
  :align: center

* Click :guilabel:`OK` on the :guilabel:`Layer Properties` dialog.
* Enter edit mode and capture a new point.
* When you do so, you will be presented with your custom dialog (instead of the
  generic one that QGIS usually creates).
* If you click on one of your points using the :guilabel:`Identify` tool, you
  can now bring up the form by right clicking in the identify results window
  and choosing :guilabel:`View Feature Form` from the context menu.
* If you are in edit mode for this layer, that context menu will show
  :guilabel:`Edit Feature Form` instead, and you can then adjust the attributes
  in the new form even after initial capture.

|IC|
-------------------------------------------------------------------------------

Using forms, you can make life easier for yourself when editing or creating
data. By editing widget types or creating an entirely new form from scratch,
you can control the experience of someone who digitizes new data for that
layer, thereby minimizing misunderstandings and unnecessary errors.

|FR|
-------------------------------------------------------------------------------

If you completed the advanced section above and have knowledge of Python, you
may want to check out `this blog entry <http://tinyurl.com/6tr42rb>`_ about
creating custom feature forms with Python logic, which allows advanced
functions including data validation, autocompletion, etc.

|WN|
-------------------------------------------------------------------------------

Opening a form on identifying a feature is one of the standard actions that
QGIS can perform. However, you can also direct it to perform custom actions
that you define. This is the subject of the next lesson.
