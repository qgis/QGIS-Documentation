.. comment out this disclaimer (by putting space in front of it) if file is uptodate with release
 |updatedisclaimer|

.. _label_conventions:

***********
Conventions
***********

This section describes a collection of uniform styles throughout the manual.
The conventions used in this manual are as follows:

**GUI Conventions**

The GUI convention styles are intended to mimic the appearance of the GUI. In
general, the objective is to use the non-hover appearance, so a user can
visually scan the GUI to find something that looks like the instruction in the manual.

*  Menu Options: :menuselection:`Layer --> Add a Raster Layer` or
   :menuselection:`Settings --> Toolbars --> Digitizing`
*  Tool: |mActionAddRasterLayer| :sup:`Add a Raster Layer`
*  Button : **\[Save as Default\]**
*  Dialog Box Title: :guilabel:`Layer Properties`
*  Tab: :guilabel:`General`
*  Checkbox: |checkbox| :guilabel:`Render`
*  Radio Button:  |radiobuttonon| :guilabel:`Postgis SRID` |radiobuttonoff| :guilabel:`EPSG ID`
*  Select a Number: |selectnumber|
*  Select a String: |selectstring|
*  Browse for a File: |browsebutton|
*  Select a Color: |selectcolor|
*  Slider: |slider|
*  Input Text: |inputtext|

.. *  Toolbox : \toolboxtwo{nviz}{nviz - Open 3D-View in NVIZ}

A shadow indicates a clickable GUI component.

**Text or Keyboard Conventions**

The manual also includes styles related to text, keyboard commands and coding
to indicate different entities, such as classes, or methods. They don't
correspond to any actual appearance.

.. Use for all urls. Otherwise, it is not clickable in the document.

*  Hyperlinks: http://qgis.org
*  Keystroke Combinations: press :kbd:`Ctrl+B`, meaning press and hold the Ctrl
   key and then press the B key.
*  Name of a File: :file:`lakes.shp`
*  Name of a Class: **NewLayer**
*  Method: *classFactory*
*  Server: *myhost.de*
*  User Text: ``qgis --help``

.. *  Single Keystroke: press \keystroke{p}
.. *  Name of a Field: \fieldname{NAMES}
.. *  SQL Table: \sqltable{example needed here}

Lines of code are indicated by a fixed-width font::

    PROJCS["NAD_1927_Albers",
      GEOGCS["GCS_North_American_1927",

**Platform-specific instructions**

GUI sequences and small amounts of text can be formatted inline: Click
|nix| |win| :menuselection:`File` |osx| :menuselection:`QGIS  --> Quit to close QGIS`.

This indicates that on Linux, Unix and Windows platforms, click the File menu
option first, then Quit from the dropdown menu, while on Macintosh OSX platforms,
click the |qg| menu option first, then Quit from the dropdown menu. Larger
amounts of text may be formatted as a list:

*  |nix| do this;
*  |win| do that;
*  |osx| do something else.

or as paragraphs.

|nix| |osx| Do this and this and this. Then do this and this and this and this
and this and this and this and this and this.

|win| Do that. Then do that and that and that and that and that and that and
that and that and that and that and that and that and that and that and that.

Screenshots that appear throughout the user guide have been created on different
platforms; the platform is indicated by the platform-specific icon at the end of
the figure caption.
