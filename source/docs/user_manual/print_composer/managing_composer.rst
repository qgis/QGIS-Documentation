
|updatedisclaimer|


Managing the Composer
=====================

Composer Menu
--------------
With the :menuselection:`Composer --> Save Project` action, you can save the project file directly from the print composer window.
The :menuselection:`Composer` menu also provides actions to:

* Create a new and blank print composer with |mActionNewComposer| :sup:`New Composer...` 
* |mActionDupComposer| :sup:`Duplicate Composer...` : Create a new print composer by duplicating the current one
* Open the |mActionComposerManager| :sup:`Composer Manager...` 
* :guilabel:`Print Composers...` : Open an existing print composer

Once the layout is designed, with |mActionFileSaveAs| :sup:`Save as template` and |mActionFileOpen|
:sup:`Add items from template` icons, you can save the current state of a Print Composer
session as a  :file:`.qpt` template and load its item again in another session.

In the :menuselection:`Composer` menu, there are also powerful ways to share geographical information produced with |qg| that can be included in reports or published. These tools are |mActionSaveMapAsImage| :sup:`Export as Image...`, |mActionSaveAsPDF| :sup:`Export as PDF...`, |mActionSaveAsSVG| :sup:`Export as SVG...` and |mActionFilePrint| :sup:`Print...`.

.. index:: Composer_Manager

.. _composer_manager_

The Composer Manager
--------------------

The Composer Manager is the main window to manage print composers in the project. It helps you add new print composer, duplicate an existing one, rename or delete it. 
To open the composer manager dialog, click on the |mActionComposerManager| :sup:`Composer Manager` button in the toolbar or choose :menuselection:`Composer --> Composer Manager`. It can also be reached from the main window of |qg| with :menuselection:`Project --> Composer Manager`.


.. _figure_composer_manager:

.. only:: html

   **Figure Composer Manager:**

.. figure:: /static/user_manual/print_composer/print_composer_manager.png
   :align: center

   The Print Composer Manager |nix|


The composer manager lists in its upper part all the available print composers in the project. The bottom part shows tools that help to:

* open the selected composer
* duplicate the selected composer : it creates a new composer using the selected composer as template. You'll be prompted to choose a new title for the new composer
* rename the composer: you can also rename the composer by double-clicking on its title in the upper part
* remove the composer: the print composer will be deleted from the project.

With the Composer Manager, it's also possible to create new print composers as an empty composer or from a saved template. By default, |qg| will look for templates in user directory (~/.qgis2/composer_template) or application's one (appDir/composer_templates). |qg| will retrieve all the available templates and propose them in the combobox. The selected template will be used to create a new composer when clicking on :guilabel:`Add` button. 
You can also save composer templates in another folder. Choosing *specific* in the template list offers the ability to select such template and use it to create a new print composer. 


.. index::
   single:Printing; Export_Map



Creating Output
---------------

Figure_composer_output_ shows the Print Composer with an example print layout,
including each type of map item described in the next section.

.. _figure_composer_output:

.. only:: html

   **Figure Composer Output:**

.. figure:: /static/user_manual/print_composer/print_composer_complete.png
   :align: center

   Print Composer with map view, legend, image, scale bar, coordinates, text and HTML frame added |nix|

.. index:: Export_as_image, Export_as_PDF, Export_as_SVG

Before printing a layout you have the possibility to view your composition without bounding
boxes. This can be enabled by deactivating :guilabel:`View -->` |checkbox| :guilabel:`Show bounding boxes`
or pressing the shortcut :kbd:`Ctrl+Shift+B`.

The Print Composer allows you to create several output formats, and it is possible
to define the resolution (print quality) and paper size:

* The |mActionFilePrint| :sup:`Print` icon allows you to print the layout to a
  connected printer or a PostScript file, depending on installed printer drivers.
* The |mActionSaveMapAsImage| :sup:`Export as image` icon exports the Composer
  canvas in several image formats, such as PNG, BPM, TIF, JPG,...
* |mActionSaveAsPDF| :sup:`Export as PDF` saves the defined Print Composer
  canvas directly as a PDF.
* The |mActionSaveAsSVG| :sup:`Export as SVG` icon saves the Print Composer canvas
  as an SVG (Scalable Vector Graphic).

If you need to export your layout as a **georeferenced image** (i.e., to load back
inside |qg|), you need to enable this feature under the Composition tab. Check 
|checkbox| :guilabel:`World file on` and choose the map item to use. With this option, the
'Export as image' action will also create a world file.

.. note::

   * Currently, the SVG output is very basic. This is not a |qg| problem, but a
     problem with the underlying Qt library. This will hopefully be sorted out 
     in future versions.
   * Exporting big rasters can sometimes fail, even if there seems to be 
     enough memory. This is also a problem with the underlying Qt management 
     of rasters.


