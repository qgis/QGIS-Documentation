
.. _pyqgis_testing:

*************************************
 Writing code in the PyQGIS Cookbook
*************************************

If you are planning to add or review some chapters of the pyqgis cookbook, then
you have to follow some rules to enable automatic testing of code snippets.

Testing is really important because allows checking automatically the quality of
the code. During testing, if the code has errors, tests will fail, meaning that
the code snippet has errors and needs to be fixed.

The framework follows the `Sphinx rules <https://www.sphinx-doc.org/en/master/usage/extensions/doctest.html>`_:
refer to this documentation for more detailed information.


How to write testable code snippets
===================================

Writing testable code snippets is not so different from the *old* method.
Basically, you need to use a different Sphinx `directive`.

Before each code snippet was embedded within the ``.. code-block:: python``
directive: Sphinx highlighted the syntax automatically.

In order to run the test on the snippet, you have to declare all the classes and
other useful imports. You do that with the ``.. testsetup::`` directive followed
by all the imports used in the snippet, e.g.::

    .. testsetup:: *

    from qgis.core import QgsCoordinateReferenceSystem

.. note:: All the code within the ``.. testsetup:: *`` is not visible in the
    final file. The ``\*`` applies the imported class(es) to all the snippets
    in the file.

You can also use ``.. testsetup:: example1`` to target a group of snippets named
"example1"

After this you have to use the ``.. testcode::`` directive followed by a name
you want, like ``.. testcode:: example``. Within this directive you should add
all the code you want (basically all the code you added in the *old* ``.. code-block:: python``
directive).

After you wrote the code you can add some *assertion* that will evaluate the
code and that will be run automatically.

A small snippet could be:

.. code-block:: python

    crs = QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.PostgisCrsId)
    assert crs.isValid()

Basically you are creating a crs and with ``assert crs.isValid()`` you **test**
if it is valid.

You can of course run this code also in the python console or in a standalone
script, but the automatic test engine will take care to test the snippet and
check if it is valid.

You can then write text and add another ``.. testcode:: example2`` code snippet
with other assertion(s).

If the code snippet is not creating an object (and therefore you cannot use
``assert object.isValid()``) you can still compare the output with another
directive: ``.. testoutput:: mysnippet``.

Basically you have first to create your code with a known name, e.g.
``.. testcode:: mysnippet`` that contains some ``print`` statements:

.. code-block:: python

    .. testcode:: mysnippet

    print("QGIS CRS ID:", crs.srsid())
    print("PostGIS SRID:", crs.srid())

and then adding the expected results::

    .. testoutput:: mysnippet

      QGIS CRS ID: 3452
      PostGIS SRID: 4326


How to test snippets on your local machine
==========================================

.. note:: Instructions are tested for Linux system.

You have to install `Docker <https://www.docker.com/>`_ first because we will
use a docker image with QGIS in it.

To test Python code snippets, you need a *QGIS* installation. For this, there
use a docker image with QGIS in it. are many options:

* You can use your system *QGIS* installation with *Sphinx* from a Python
  virtual environment::

   make -f venv.mk doctest

* You can use a manually built installation of *QGIS*, to do so, you need to
  create a custom ``Makefile`` extension on top of the ``venv.mk`` file, for
  example a ``user.mk`` file with the following content::

    # Root installation forder
    QGIS_PREFIX_PATH = /home/user/apps/qgis-master

    # Or build output folder
    QGIS_PREFIX_PATH = /home/user/dev/QGIS-build-master/output

    include venv.mk

  Then use it to run target ``doctest``::

    make -f user.mk doctest

* Or you can run target ``doctest`` inside the official *QGIS* docker image::

   make -f docker.mk doctest
