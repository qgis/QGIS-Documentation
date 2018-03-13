.. _coding_standards:

***********************
 QGIS Coding Standards
***********************

.. contents::
   :local:

These standards should be followed by all QGIS developers.

Classes
=======


Names
-----

Class in QGIS begin with Qgs and are formed using camel case.

Examples:

* ``QgsPoint``
* ``QgsMapCanvas``
* ``QgsRasterLayer``


Members
-------


Class member names begin with a lower case m and are formed using mixed
case.

* ``mMapCanvas``
* ``mCurrentExtent``

All class members should be private.
Public class members are STRONGLY discouraged. Protected members should
be avoided when the member may need to be accessed from Python subclasses,
since protected members cannot be used from the Python bindings.

Mutable static class member names should begin with a lower case ``s``,
but constant static class member names should be all caps:

* ``sRefCounter``
* ``DEFAULT_QUEUE_SIZE``


Accessor Functions
------------------


Class member values should be obtained through accesssor functions. The
function should be named without a get prefix. Accessor functions for the
two private members above would be:

* ``mapCanvas()``
* ``currentExtent()``

Ensure that accessors are correctly marked with ``const``. Where appropriate,
this may require that cached value type member variables are marked with
``mutable``.

Functions
---------


Function names begin with a lowercase letter and are formed using mixed case.
The function name should convey something about the purpose of the function.

* ``updateMapExtent()``
* ``setUserOptions()``

For consistency with the existing QGIS API and with the Qt API, abbreviations
should be avoided. E.g. ``setDestinationSize`` instead of ``setDestSize``,
``setMaximumValue`` instead of ``setMaxVal``.

Acronyms should also be camel cased for consistency. E.g. ``setXml`` instead
of ``setXML``.


Function Arguments
------------------


Function arguments should use descriptive names. Do not use single letter
arguments (e.g. ``setColor( const QColor& color )`` instead of
``setColor( const QColor& c )``).

Pay careful attention to when arguments should be passed by reference.
Unless argument objects are small and trivially copied (such as QPoint
objects), they should be passed by const reference. For consistency
with the Qt API, even implicitly shared objects are passed by const
reference (e.g. ``setTitle( const QString& title )`` instead of
``setTitle( QString title )``.


Function Return Values
----------------------

Return small and trivially copied objects as values. Larger objects
should be returned by const reference. The one exception to this
is implicitly shared objects, which are always returned by value. Return
``QObject`` or subclassed objects as pointers.

* ``int maximumValue() const``
* ``const LayerSet& layers() const``
* ``QString title() const`` (``QString`` is implicitly shared)
* ``QList< QgsMapLayer* > layers() const`` (``QList`` is implicitly shared)
* ``QgsVectorLayer *layer() const;`` (``QgsVectorLayer`` inherits ``QObject``)
* ``QgsAbstractGeometry *geometry() const;`` (``QgsAbstractGeometry`` is
  abstract and will probably need to be casted)


API Documentation
=================

It is required to write API documentation for every class, method, enum and
other code that is available in the public API.

QGIS uses Doxygen for documentation. Write descriptive and meaningful comments
that give a reader information about what to expect, what happens in edge cases
and give hints about other interfaces he could be looking for, best best
practice and code samples.

Methods
-------

Method descriptions should be written in a descriptive form, using the 3rd
person. Methods require a ``\since`` tag that defines when they have been
introduced. You should add additional ``\since`` tags for important changes
that were introduced later on.

.. code-block:: cpp

  /**
   * Cleans the laundry by using water and fast rotation.
   * It will use the provided \a detergent during the washing programme.
   *
   * \returns True if everything was successful. If false is returned, use
   * \link error() \endlink to get more information.
   *
   * \note Make sure to manually call dry() after this method.
   *
   * \since QGIS 3.0
   * \see dry()
   */

Members Variables
-----------------

Member variables should normally be in the ``private`` section and made
available via getters and setters. One exception to this is for data
containers like for error reporting. In such cases do not prefix the member
with an ``m``.

.. code-block:: cpp

  /**
   * \ingroup core
   * Represents points on the way along the journey to a destination.
   *
   * \since QGIS 2.20
   */
  class QgsWaypoint
  {
    /**
     * Holds information about results of an operation on a QgsWaypoint.
     *
     * \since QGIS 3.0
     */
    struct OperationResult
    {
      QgsWaypoint::ResultCode resultCode; //!< Indicates if the operation completed successfully.
      QString message; //!< A human readable localized error message. Only set if the resultCode is not QgsWaypoint::Success.
      QVariant result; //!< The result of the operation. The content depends on the method that returned it. \since QGIS 3.2
    };
  };


Qt Designer
===========

Generated Classes
-----------------

QGIS classes that are generated from Qt Designer (ui) files should have a
Base suffix. This identifies the class as a generated base class.

Examples:

* ``QgsPluginManagerBase``
* ``QgsUserOptionsBase``


Dialogs
-------

All dialogs should implement tooltip help for all toolbar icons and other
relevant widgets. Tooltips add greatly to feature discoverability
for both new and experienced users.

Ensure that the tab order for widgets is updated whenever the layout
of a dialog changes.


C++ Files
=========

Names
-----

C++ implementation and header files should have a .cpp and .h extension
respectively. Filename should be all lowercase and, in the case of classes,
match the class name.

Example:
Class ``QgsFeatureAttribute`` source files are
:file:`qgsfeatureattribute.cpp` and :file:`qgsfeatureattribute.h`

.. note:: In case it is not clear from the statement above, for a filename
  to match a class name it implicitly means that each class should be declared
  and implemented in its own file. This makes it much easier for newcomers to
  identify where the code is relating to specific class.


Standard Header and License
----------------------------

Each source file should contain a header section patterned after the following
example:

.. code-block:: cpp

  /***************************************************************************
    qgsfield.cpp - Describes a field in a layer or table
    --------------------------------------
    Date : 01-Jan-2004
    Copyright: (C) 2004 by Gary E.Sherman
    Email: sherman at mrcc.com
  /***************************************************************************
   *
   * This program is free software; you can redistribute it and/or modify
   * it under the terms of the GNU General Public License as published by
   * the Free Software Foundation; either version 2 of the License, or
   * (at your option) any later version.
   *
   ***************************************************************************/

.. note:: There is a template for Qt Creator in git. To use it, copy it from
  :file:`doc/qt_creator_license_template` to a local location, adjust the
  mail address and - if required - the name and configure QtCreator to use it:
  :menuselection:`Tools --> Options --> C++ --> File Naming`.


Variable Names
===============

Local variable names begin with a lower case letter and are formed using mixed
case. Do not use prefixes like ``my`` or ``the``.

Examples:

* ``mapCanvas``
* ``currentExtent``


Enumerated Types
=================

Enumerated types should be named in CamelCase with a leading capital e.g.:

.. code-block:: cpp

  enum UnitType
  {
    Meters,
    Feet,
    Degrees,
    UnknownUnit
  };

Do not use generic type names that will conflict with other types. e.g. use
``UnkownUnit`` rather than ``Unknown``

Global Constants & Macros
==========================

Global constants and macros should be written in upper case underscore separated
e.g.:

.. code-block:: cpp

  const long GEOCRS_ID = 3344;


Qt Signals and Slots
====================

All signal/slot connects should be made using the "new style" connects available
in Qt5. Futher information on this requirement is available in
`QEP #77 <https://github.com/qgis/QGIS-Enhancement-Proposals/issues/77>`_.

Avoid use of Qt auto connect slots (i.e. those named
``void on_mSpinBox_valueChanged``). Auto connect slots are fragile and
prone to breakage without warning if dialogs are refactored.


Editing
=======

Any text editor/IDE can be used to edit QGIS code, providing the following
requirements are met.

Tabs
----

Set your editor to emulate tabs with spaces. Tab spacing should be set to 2
spaces.

.. note:: In vim this is done with ``set expandtab ts=2``

Indentation
-----------

Source code should be indented to improve readability. There is a
:file:`scripts/prepare-commit.sh` that looks up the changed files and reindents
them using astyle. This should be run before committing. You can also use
:file:`scripts/astyle.sh` to indent individual files.

As newer versions of astyle indent differently than the version used to do a
complete reindentation of the source, the script uses an old astyle version,
that we include in our repository (enable ``WITH_ASTYLE`` in cmake to include
it in the build).

Braces
------

Braces should start on the line following the expression:

.. code-block:: cpp

  if(foo == 1)
  {
    // do stuff
    ...
  }
  else
  {
    // do something else
    ...
  }

API Compatibility
==================

There is `API documentation <http://qgis.org/api/>`_ for C++.

We try to keep the API stable and backwards compatible. Cleanups to the API
should be done in a manner similar to the Qt sourcecode e.g.

.. code-block:: cpp

  class Foo
  {
    public:
      /**
       * This method will be deprecated, you are encouraged to use
       * doSomethingBetter() rather.
       * \deprecated doSomethingBetter()
       */
      Q_DECL_DEPRECATED bool doSomething();

      /**
       * Does something a better way.
       * \note added in 1.1
       */
      bool doSomethingBetter();

    signals:
      /**
       * This signal will is deprecated, you are encouraged to
       * connect to somethingHappenedBetter() rather.
       * \deprecated use somethingHappenedBetter()
       */
  #ifndef Q_MOC_RUN
      Q_DECL_DEPRECATED
  #endif
      bool somethingHappened();

      /**
       * Something happened
       * \note added in 1.1
       */
      bool somethingHappenedBetter();
  }
  
SIP Bindings
============

Some of the SIP files are automatically generated using a dedicated script.


Header pre-processing
---------------------


All the information to properly build the SIP file must be found in the C++
header file. Some macros are available for such definition:

* Use ``#ifdef SIP_RUN`` to generate code only in SIP files or
  ``#ifndef SIP_RUN`` for C++ code only. ``#else`` statements are handled in
  both cases.
* Use ``SIP_SKIP`` to discard a line
* The following annotations are handled:

  * ``SIP_FACTORY``: ``/Factory/``
  * ``SIP_OUT``: ``/Out/``
  * ``SIP_INOUT``: ``/In,Out/``
  * ``SIP_TRANSFER``: ``/Transfer/``
  * ``SIP_PYNAME(name)``: ``/PyName=name/``
  * ``SIP_KEEPREFERENCE``: ``/KeepReference/``
  * ``SIP_TRANSFERTHIS``: ``/TransferThis/``
  * ``SIP_TRANSFERBACK``: ``/TransferBack/``
  
* ``private`` sections are not displayed, except if you use a ``#ifdef SIP_RUN``
  statement in this block.
* ``SIP_PYDEFAULTVALUE(value)`` can be used to define an alternative default
  value of the python method. If the default value contains a comma ``,``,
  the value should be surrounded by single quotes ``'``
* ``SIP_PYTYPE(type)`` can be used to define an alternative type for an argument
  of the python method. If the type contains a comma ``,``, the type should be
  surrounded by single quotes ``'``

A demo file can be found in :file:`tests/scripts/sipifyheader.h`.

Generating the SIP file
-----------------------

The SIP file can be generated using a dedicated script. For instance:

::

    scripts/sipify.pl src/core/qgsvectorlayer.h > python/core/qgsvectorlayer.sip
    
    
As soon as a SIP file is added to one of the source file
(:file:`python/core/core.sip`, :file:`python/gui/gui.sip` or
:file:`python/analysis/analysis.sip`), it will be considered as generated
automatically. A test on Travis will ensure that this file is up to date with
its corresponding header.

Older files for which the automatic creation is not enabled yet are listed in
:file:`python/auto_sip.blacklist`.

Improving sipify script
-----------------------

If some improvements are required for sipify script, please add the missing bits
to the demo file :file:`tests/scripts/sipifyheader.h` and create the expected
header :file:`tests/scripts/sipifyheader.expected.si`. This will also be
automatically tested on Travis as a unit test of the script itself.


Coding Style
=============


Here are described some programming hints and tips that will hopefully reduce
errors, development time and maintenance.


Where-ever Possible Generalize Code
------------------------------------


If you are cut-n-pasting code, or otherwise writing the same thing more than
once, consider consolidating the code into a single function.

This will:

- allow changes to be made in one location instead of in multiple places
- help prevent code bloat
- make it more difficult for multiple copies to evolve differences over time,
  thus making it harder to understand and maintain for others


Prefer Having Constants First in Predicates
--------------------------------------------

Prefer to put constants first in predicates.

``0 == value`` instead of ``value == 0``

This will help prevent programmers from accidentally using ``=`` when they meant
to use ``==``, which can introduce very subtle logic bugs. The compiler will
generate an error if you accidentally use ``=`` instead of ``==`` for comparisons
since constants inherently cannot be assigned values.

Whitespace Can Be Your Friend
------------------------------

Adding spaces between operators, statements, and functions makes it easier for
humans to parse code.

Which is easier to read, this:

.. code-block:: cpp

  if (!a&&b)

or this:

.. code-block:: cpp

  if ( ! a && b )

.. note:: :file:`scripts/prepare-commit.sh` will take care of this.


Put commands on separate lines
-------------------------------

When reading code it's easy to miss commands, if they are not at the beginning
of the line. When quickly reading through code, it's common to skip lines
if they don't look like what you are looking for in the first few characters.
It's also common to expect a command after a conditional like ``if``.

Consider:

.. code-block:: cpp

  if (foo) bar();
  
  baz(); bar();

It's very easy to miss part of what the flow of control.
Instead use

.. code-block:: cpp

  if (foo)
    bar();
    
  baz();
  bar();

Indent access modifiers
------------------------

Access modifiers structure a class into sections of public API, protected API
and private API. Access modifiers themselves group the code into this structure.
Indent the access modifier and declarations.

.. code-block:: cpp

  class QgsStructure
  {
    public:
      /**
       * Constructor
       */
       explicit QgsStructure();
  }


Book recommendations
---------------------


- `Effective Modern C++ <http://shop.oreilly.com/product/0636920033707.do>`_, Scott Meyers
- `More Effective C++ <http://www.informit.com/store/more-effective-c-plus-plus-35-new-ways-to-improve-your-9780201633719>`_, Scott Meyers
- `Effective STL <http://www.informit.com/store/effective-stl-50-specific-ways-to-improve-your-use-9780201749625>`_, Scott Meyers
- `Design Patterns <http://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612>`_, GoF

You should also really read this article from Qt Quarterly on
`designing Qt style (APIs) <https://doc.qt.io/archives/qq/qq13-apis.html>`_


Credits for contributions
==========================

Contributors of new functions are encouraged to let people know about their
contribution by:

* adding a note to the changelog for the first version where 
  the code has been incorporated, of the type::

    This feature was funded by: Olmiomland http://olmiomland.ol
    This feature was developed by: Chuck Norris http://chucknorris.kr

* writing an article about the new feature on a blog, 
  and add it to the QGIS planet http://plugins.qgis.org/planet/
* adding their name to:

  * https://github.com/qgis/QGIS/blob/master/doc/CONTRIBUTORS
  * https://github.com/qgis/QGIS/blob/master/doc/AUTHORS
  * https://github.com/qgis/QGIS/blob/master/doc/contributors.json
  
  