.. _processing_testing: 
 
*******************************
 Processing Algorithms Testing
*******************************

.. contents::
   :local:

Algorithm tests
===============

.. note:: The original version of these instructions is available at
  :source:`python/plugins/processing/tests/README.md`

QGIS provides several algorithms under the Processing framework.
You can extend this list with algorithms of your own and, like any new feature,
adding tests is required.

To test algorithms you can add entries into :file:`testdata/qgis_algorithm_tests.yaml`
or :file:`testdata/gdal_algorithm_tests.yaml` as appropriate.

This file is structured with `yaml syntax <https://yaml.org/>`_.

A basic test appears under the top level key ``tests`` and looks like this:

.. code-block:: yaml

 - name: centroid
   algorithm: qgis:polygoncentroids
   params:
     - type: vector
       name: polys.gml
   results:
     OUTPUT_LAYER:
       type: vector
       name: expected/polys_centroid.gml

.. _howto_processing_testing:

How To
------

To add a new test please follow these steps:

#. Run the :ref:`algorithm <processing_algs>` you want to test in QGIS from
   the :ref:`processing toolbox <processing.toolbox>`.
   If the result is a vector layer prefer GML, with its XSD, as output for its
   support of mixed geometry types and good readability. Redirect output to
   :file:`python/plugins/processing/tests/testdata/expected`. For input layers
   prefer to use what's already there in the folder :file:`testdata`.
   If you need extra data, put it into :file:`testdata/custom`.
#. When you have run the algorithm, go to :menuselection:`Processing --> History`
   and find the algorithm which you have just run.
#. Right click the algorithm and click :guilabel:`Create Test`.
   A new window will open with a text definition.
#. Open the file :file:`python/plugins/processing/tests/testdata/algorithm_tests.yaml`,
   copy the text definition there.

The first string from the command goes to the key ``algorithm``, the subsequent
ones to ``params`` and the last one(s) to ``results``.

The above translates to

.. code-block:: yaml

 - name: densify
   algorithm: qgis:densifygeometriesgivenaninterval
   params:
     - type: vector
       name: polys.gml
     - 2 # Interval
   results:
     OUTPUT:
       type: vector
       name: expected/polys_densify.gml


It is also possible to create tests for Processing scripts. Scripts should
be placed in the :file:`scripts` subdirectory in the test data directory
:file:`python/plugins/processing/tests/testdata/`. The script file name
should match the script algorithm name.

Parameters and results
----------------------

Trivial type parameters
.......................

Parameters and results are specified as lists or dictionaries:

.. code-block:: yaml

 params:
   INTERVAL: 5
   INTERPOLATE: True
   NAME: A processing test

or

.. code-block:: yaml

 params:
   - 2
   - string
   - another param

Layer type parameters
.....................

You will often need to specify layers as parameters. To specify a layer you
will need to specify:

* the type, ie ``vector`` or ``raster``
* a name, with a relative path like :file:`expected/polys_centroid.gml`

This is what it looks like in action:

.. code-block:: yaml

 params:
   PAR: 2
   STR: string
   LAYER:
     type: vector
     name: polys.gml
   OTHER: another param


File type parameters
....................

If you need an external file for the algorithm test, you need to specify
the 'file' type and the (relative) path to the file in its 'name':

.. code-block:: yaml

 params:
   PAR: 2
   STR: string
   EXTFILE:
     type: file
     name: custom/grass7/extfile.txt
   OTHER: another param


Results
.......

Results are specified very similarly.

Basic vector files
^^^^^^^^^^^^^^^^^^

It couldn't be more trivial

.. code-block:: yaml

 OUTPUT:
  name: expected/qgis_intersection.gml
  type: vector


Add the expected GML and XSD files in the folder.

Vector with tolerance
^^^^^^^^^^^^^^^^^^^^^

Sometimes different platforms create slightly different results which are
still acceptable. In this case (but only then) you may also use additional
properties to define how a layer is compared.

To deal with a certain tolerance for output values you can specify a ``compare``
property for an output. The compare property can contain sub-properties for
``fields``. This contains information about how precisely a certain field is
compared (``precision``) or a field can even entirely be ``skip``ed. There is a
special field name ``__all__`` which will apply a certain tolerance to all fields.
There is another property ``geometry`` which also accepts a ``precision`` which is
applied to each vertex.

.. code-block:: yaml

 OUTPUT:
  type: vector
  name: expected/abcd.gml
  compare:
    fields:
      __all__:
        precision: 5 # compare to a precision of .00001 on all fields
      A: skip # skip field A
    geometry:
      precision: 5 # compare coordinates with a precision of 5 digits


Raster files
^^^^^^^^^^^^

Raster files are compared with a hash checksum. This is calculated when you create
a test from the processing history.

.. code-block:: yaml

 OUTPUT:
  type: rasterhash
  hash: f1fedeb6782f9389cf43590d4c85ada9155ab61fef6dc285aaeb54d6

Files
^^^^^

You can compare the content of an output file to an expected result reference file

.. code-block:: yaml

 OUTPUT_HTML_FILE:
  name: expected/basic_statistics_string.html
  type: file


Or you can use one or more regular expressions that will be `matched
<https://docs.python.org/3/library/re.html#re.search>`_ against the file content

.. code-block:: yaml

 OUTPUT:
  name: layer_info.html
  type: regex
  rules:
    - 'Extent: \(-1.000000, -3.000000\) - \(11.000000, 5.000000\)'
    - 'Geometry: Line String'
    - 'Feature Count: 6'

Directories
^^^^^^^^^^^

You can compare the content of an output directory with an expected result
reference directory

.. code-block:: yaml

 OUTPUT_DIR:
  name: expected/tiles_xyz/test_1
  type: directory

Algorithm Context
-----------------

There are a few more definitions that can modify the context of the algorithm -
these can be specified at the top level of test:

* ``project`` - will load a specified QGIS project file before running the
  algorithm. If not specified, the algorithm will run with an empty project
* ``project_crs`` - overrides the default project CRS - e.g. ``EPSG:27700``
* ``ellipsoid`` - overrides the default project ellipsoid used for measurements,
  e.g. ``GRS80``


Running tests locally
---------------------

.. code-block:: yaml

 ctest -V -R ProcessingQgisAlgorithmsTest

or one of the following values listed in the :source:`CMakelists.txt
<python/plugins/processing/tests/CMakeLists.txt>`
