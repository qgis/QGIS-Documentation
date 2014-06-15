|updatedisclaimer|

.. _label_conventions:

***********
Conventions
***********

This section describes the uniform styles that will be used throughout
this manual.

GUI Conventions 
---------------

The GUI convention styles are intended to mimic the appearance of the
GUI. In general, a style will reflect the non-hover appearance, so a
user can visually scan the GUI to find something that looks like the
instruction in the manual.

* Menu Options: :menuselection:`Layer --> Add a Raster Layer` or
  :menuselection:`Settings --> Toolbars --> Digitizing`
* Tool: |mActionAddRasterLayer| :sup:`Add a Raster Layer`
* Button : **\[Save as Default\]**
* Dialog Box Title: :guilabel:`Layer Properties`
* Tab: :guilabel:`General`
* Checkbox: |checkbox| :guilabel:`Render`
* Radio Button: |radiobuttonon| :guilabel:`Postgis SRID`
  |radiobuttonoff| :guilabel:`EPSG ID`
* Select a number: |selectnumber|
* Select a string: |selectstring|
* Browse for a file: |browsebutton|
* Select a color: |selectcolor|
* Slider: |slider|
* Input Text: |inputtext|

.. * Toolbox : \toolboxtwo{nviz}{nviz - Open 3D-View in NVIZ}

A shadow indicates a clickable GUI component.

Text or Keyboard Conventions 
----------------------------

This manual also includes styles related to text, keyboard commands
and coding to indicate different entities, such as classes or
methods. These styles do not correspond to the actual appearance of
any text or coding within |qg|.

.. Use for all urls. Otherwise, it is not clickable in the document.

* Hyperlinks: http://qgis.org
* Keystroke Combinations: Press :kbd:`Ctrl+B`, meaning press and hold the Ctrl
  key and then press the B key.
* Name of a File: :file:`lakes.shp`
* Name of a Class: **NewLayer**
* Method: *classFactory*
* Server: *myhost.de*
* User Text: ``qgis --help``

.. * Single Keystroke: press \keystroke{p}
.. * Name of a Field: \fieldname{NAMES}
.. * SQL Table: \sqltable{example needed here}

Lines of code are indicated by a fixed-width font:

::

    PROJCS["NAD_1927_Albers",
      GEOGCS["GCS_North_American_1927",

Platform-specific instructions 
------------------------------

GUI sequences and small amounts of text may be formatted inline: Click
|nix| |win| :menuselection:`File` |osx| :menuselection:`QGIS --> Quit
to close QGIS`. This indicates that on Linux, Unix and Windows
platforms, you should click the File menu first, then Quit, while on
Macintosh OS X platforms, you should click the |qg| menu first, then
Quit.

Larger amounts of text may be formatted as a list:

* |nix| Do this
* |win| Do that
* |osx| Do something else

or as paragraphs:

|nix| |osx| Do this and this and this. Then do this and this and this,
and this and this and this, and this and this and this.

|win| Do that. Then do that and that and that, and that and that and
that, and that and that and that, and that and that and that, and that
and that and that.

Screenshots that appear throughout the user guide have been created on
different platforms; the platform is indicated by the
platform-specific icon at the end of the figure caption.
