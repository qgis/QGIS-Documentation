.. _`processing.options`:

**************************************
 Configuring the Processing Framework
**************************************

.. only:: html

   .. contents::
      :local:

The Processing Options menu (:menuselection:`Settings--> Options -->`
|processingAlgorithm| :guilabel:`Processing` tab) allows you to configure how algorithms work.
Configuration parameters are structured in separate blocks that you can
select on the left-hand side of the dialog.

.. _processing_general_settings:

General
=======

The :guilabel:`General` block contains the default settings to control
how the algorithm dialog as well as input or output parameters should behave.
Some of the settings can however be overridden at the algorithm level,
per :ref:`algorithm run <alg_override_setting>`
or for :ref:`individual parameters <alg_parameter_types>`.

* :guilabel:`Default output raster layer extension` is by default ``tif``
* :guilabel:`Default output vector layer extension` is by default ``gpkg``
* :guilabel:`Invalid features filtering` when executing algorithm:

  * :guilabel:`Do not filter (better performance)`: all the features
    (with valid and invalid geometries) are processed, but the result may be erroneous
    depending on how the geometry invalidity affects the operations
  * :guilabel:`Skip (ignore) features with invalid geometries`,
    meaning that only a subset of your dataset (the valid geometry features)
    will be processed
  * :guilabel:`Stop algorithm execution when a geometry is invalid`:
    you'll need to track and fix the invalid geometries if you want the algorithm
    to process the whole layer. Algorithms like :ref:`qgischeckvalidity` or
    :ref:`qgisfixgeometries` can help you achieve this.

  The :guilabel:`Invalid features filtering` setting can be overridden
  on a per-input basis, at algorithm runtime.
* :guilabel:`Keep dialog open after running algorithm`. Once an algorithm
  has finished execution and its output layers are loaded into the QGIS
  project, the algorithm dialog is closed. If you want to keep it open
  (to run the algorithm again with different parameters, or to better
  check the output that is written to the log tab), check this option.
* :guilabel:`Max Threads`
* :guilabel:`Output folder` for non temporary outputs: If no folder path
  is provided for the Processing execution outputs, this is the folder in which
  they will be saved. Default is :file:`processing/outputs` under the active
  :ref:`user profile <user_profiles>` directory.
* :guilabel:`Override temporary output folder path`: Temporary outputs are
  saved by default in the :file:`tmp` folder on the machine.
  This option helps you set a different place for storage.
* :guilabel:`Pre-execution script` and :guilabel:`Post-execution script`.
  These parameters point to files that contain scripts written using the
  processing scripting functionality, explained in the section covering
  scripting and the console.
* :guilabel:`Prefer output filename for layer names`.
  The name of each resulting layer created by an algorithm is defined by
  the algorithm itself.
  In some cases, a fixed name might be used, meaning that the same output
  name will be used, no matter which input layer is used.
  In other cases, the name might depend on the name of the input layer or
  some of the parameters used to run the algorithm.
  If this checkbox is checked, the name will be taken from the output
  filename instead.
  Notice that, if the output is saved to a temporary file, the filename
  of this temporary file is usually a long and meaningless one intended
  to avoid collision with other already existing filenames.
* :guilabel:`Results group name`.
  If you want to obtain all processing result layers in a group in the
  :guilabel:`Layers` panel, set a group name for this parameter. The group
  may exist already or not. QGIS will add all output layers to such a group.
  By default, this parameter is empty, so all output layers are added to
  different places in the :guilabel:`Layers` panel, depending on the item
  that is active when running an algorithm.
  Note that output layers will be loaded to the :guilabel:`Layers` panel
  only if :guilabel:`Open output file after running algorithm` is checked
  in the algorithm dialog.
* :guilabel:`Show algorithms with known issues`: By default, QGIS avoids
  display of broken algorithms (generally from third-party providers).
  If checked, they will be available in the Processing toolbox, with a warning
  icon and a tooltip explaining they have issues. Use at your own risks.
* :guilabel:`Show feature count for output vector layers`. Since calculating
  the feature count might take some time in certain data formats, this option
  is off by default.
* :guilabel:`Show layer CRS definition in selection boxes`
* :guilabel:`Show tooltip when there are disabled providers`
* :guilabel:`Style for line layers`, :guilabel:`Style for point layers`,
  :guilabel:`Style for polygons layers` and
  :guilabel:`Style for raster layers` are used for setting the default
  rendering style for output layers (that is, layers generated by
  processing algorithms).
  Just create the style you want using QGIS, save it to a file, and then
  enter the path to that file in the settings so the algorithms can use
  it.
  Whenever a layer is loaded by Processing and added to the QGIS canvas,
  it will be rendered with that style.

  Rendering styles can be configured individually for each algorithm and
  each one of its outputs.
  Just right-click on the name of the algorithm in the toolbox and
  select :guilabel:`Edit rendering styles for outputs`.
  You will see a dialog like the one shown next.

  .. _figure_rendering_styles:

  .. figure:: img/rendering_styles.png
     :align: center

     Rendering Styles

  Select the style file (:file:`.qml`) that you want for each output
  and press :guilabel:`OK`.
* :guilabel:`Warn before executing if parameter CRS's do not match`: By default, QGIS native algorithms
  (i.e. the ones listed under the |menu| :menuselection:`Menus --> QGIS (native C++)` group)
  transparently reproject the input layers to the first one's CRS before execution.
  Check this option to get a notification from the other tools that do not suppport reprojection,
  when the inputs CRS are not identical.
  Third-party providers are not concerned.

Menus
=====

The |menu| :guilabel:`Menus` block controls whether an algorithm, script or
model (built-in or provided by plugins) should be made available
through a dedicated menu or toolbar (along with the Processing Toolbox).
For each item of each provider, you can:

* :guilabel:`Add button in toolbar`, making it available in the
  :guilabel:`Processing Algorithms` toolbar
* assign an :guilabel:`Icon` to the algorithm
* set a :guilabel:`Menu path`: the algorithm will then be available through
  an existing or a custom menu, e.g. ``Vect&or/MyTopAlgorithms``

Restart QGIS to apply the settings.
At any time, your changes can be :guilabel:`Reset to defaults`.

Models and Scripts
==================

In the |processingModel| :guilabel:`Models` and |pythonFile| :guilabel:`Scripts` blocks,
you can set a default folder to store, and look for models and scripts respectively.

Providers
=========

You will also find a block for algorithm |processingAlgorithm| :guilabel:`Providers`.
This is the place where installed providers expose their settings.
For example, built-in providers contain an :guilabel:`Activate` item
that you can use to make their algorithms appear or not in the toolbox.
Some algorithm providers have their own configuration items,
which will be explained when covering particular algorithm providers.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |menu| image:: /static/common/menu.png
   :width: 1.5em
.. |processingAlgorithm| image:: /static/common/processingAlgorithm.png
   :width: 1.5em
.. |processingModel| image:: /static/common/processingModel.png
   :width: 1.5em
.. |pythonFile| image:: /static/common/mIconPythonFile.png
   :width: 1.5em
