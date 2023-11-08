
.. _qgis_unittesting: 
 
**************
 Unit Testing
**************

.. contents::
   :local:

As of November 2007 we require all new features going into master to be
accompanied with a unit test. Initially we have limited this requirement to
qgis_core, and we will extend this requirement to other parts of the code base
once people are familiar with the procedures for unit testing explained in the
sections that follow.


The QGIS testing framework - an overview
=========================================

Unit testing is carried out using a combination of QTestLib (the Qt testing
library) and CTest (a framework for compiling and running tests as part of the
CMake build process). Lets take an overview of the process before we delve into
the details:

#. There is some code you want to test, e.g. a class or function. Extreme
   programming advocates suggest that the code should not even be written yet
   when you start building your tests, and then as you implement your code you can
   immediately validate each new functional part you add with your test. In
   practice you will probably need to write tests for pre-existing code in QGIS
   since we are starting with a testing framework well after much application
   logic has already been implemented.

#. You create a unit test. This happens under ``<QGIS Source Dir>/tests/src/core``
   in the case of the core lib. The test is basically a client that creates an
   instance of a class and calls some methods on that class. It will check the
   return from each method to make sure it matches the expected value. If any
   one of the calls fails, the unit will fail.

#. You include QtTestLib macros in your test class. This macro is processed by
   the Qt meta object compiler (moc) and expands your test class into a
   runnable application.

#. You add a section to the CMakeLists.txt in your tests directory that will
   build your test.

#. You ensure you have ``ENABLE_TESTING`` enabled in ccmake / cmakesetup. This
   will ensure your tests actually get compiled when you type make.

#. You optionally add test data to ``<QGIS Source Dir>/tests/testdata`` if your
   test is data driven (e.g. needs to load a shapefile). These test data should
   be as small as possible and wherever possible you should use the existing
   datasets already there. Your tests should never modify this data in situ,
   but rather make a temporary copy somewhere if needed.

#. You compile your sources and install. Do this using normal
   ``make && (sudo)  make install`` procedure.

#. You run your tests. This is normally done simply by doing ``make test``
   after the ``make install`` step, though we will explain other approaches that offer
   more fine grained control over running tests.


Right with that overview in mind, we will delve into a bit of detail. We've
already done much of the configuration for you in CMake and other places in the
source tree so all you need to do are the easy bits - writing unit tests!


Creating a unit test
====================

Creating a unit test is easy - typically you will do this by just creating a
single :file:`.cpp` file (no :file:`.h` file is used) and implement all your
test methods as private methods that return void. We'll use a simple test class for
``QgsRasterLayer`` throughout the section that follows to illustrate. By convention
we will name our test with the same name as the class they are testing but
prefixed with 'Test'. So our test implementation goes in a file called
:file:`testqgsrasterlayer.cpp` and the class itself will be ``TestQgsRasterLayer``.
First we add our standard copyright banner:

.. code-block:: cpp

  /***************************************************************************
   testqgsvectorfilewriter.cpp
   --------------------------------------
    Date : Friday, Jan 27, 2015
    Copyright: (C) 2015 by Tim Sutton
    Email: tim@kartoza.com
   ***************************************************************************
   *
   * This program is free software; you can redistribute it and/or modify
   * it under the terms of the GNU General Public License as published by
   * the Free Software Foundation; either version 2 of the License, or
   * (at your option) any later version.
   *
   ***************************************************************************/

Next we start our includes needed for the tests we plan to run. There is
one special include all tests should have:

.. code-block:: cpp

  #include <QtTest/QtTest>

Beyond that you just continue implementing your class as per normal, pulling
in whatever headers you may need:

.. code-block:: cpp

  //Qt includes...
  #include <QObject>
  #include <QString>
  #include <QObject>
  #include <QApplication>
  #include <QFileInfo>
  #include <QDir>

  //qgis includes...
  #include <qgsrasterlayer.h>
  #include <qgsrasterbandstats.h>
  #include <qgsapplication.h>

Since we are combining both class declaration and implementation in a single
file the class declaration comes next. We start with our doxygen documentation.
Every test case should be properly documented. We use the doxygen ingroup
directive so that all the UnitTests appear as a module in the generated Doxygen
documentation. After that comes a short description of the unit test and
the class must inherit from QObject and include the Q_OBJECT macro.

.. code-block:: cpp

  /** \ingroup UnitTests
   * This is a unit test for the QgsRasterLayer class.
   */

  class TestQgsRasterLayer: public QObject
  {
      Q_OBJECT

All our test methods are implemented as private slots. The QtTest framework
will sequentially call each private slot method in the test class. There are
four 'special' methods which if implemented will be called at the start of the
unit test (``initTestCase``), at the end of the unit test
(``cleanupTestCase``). Before each test method is called, the ``init()``
method will be called and after each test method is called the ``cleanup()``
method is called. These methods are handy in that they allow you to allocate
and cleanup resources prior to running each test, and the test unit as a whole.

.. code-block:: cpp

  private slots:
    // will be called before the first testfunction is executed.
    void initTestCase();
    // will be called after the last testfunction was executed.
    void cleanupTestCase(){};
    // will be called before each testfunction is executed.
    void init(){};
    // will be called after every testfunction.
    void cleanup();

Then come your test methods, all of which should take no parameters and
should return void. The methods will be called in order of declaration. We
are implementing two methods here which illustrate two types of testing.

In the first case we want to generally test if the various parts of the class are working,
We can use a functional testing approach. Once again, extreme programmers
would advocate writing these tests before implementing the class. Then as
you work your way through your class implementation you iteratively run your
unit tests. More and more test functions should complete successfully as your
class implementation work progresses, and when the whole unit test passes, your
new class is done and is now complete with a repeatable way to validate it.

Typically your unit tests would only cover the public API of your class,
and normally you do not need to write tests for accessors and mutators. If it
should happen that an accessor or mutator is not working as expected you would
normally implement a :ref:`regression test <regression_test>` to check for this.

.. code-block:: cpp

    //
    // Functional Testing
    //

    /** Check if a raster is valid. */
    void isValid();

    // more functional tests here ...


.. _regression_test:

Implementing a regression test
------------------------------

Next we implement our regression tests. Regression tests should be
implemented to replicate the conditions of a particular bug. For example:

#. We received a report by email that the cell count by rasters was off by
   1, throwing off all the statistics for the raster bands.
#. We opened a bug report (`ticket #832 <https://issues.qgis.org/issues/832>`_)
#. We created a regression test that replicated the bug using a small
   test dataset (a 10x10 raster).
#. We ran the test, verifying that it did indeed fail
   (the cell count was 99 instead of 100).
#. Then we went to fix the bug and reran the unit test and the regression test
   passed. We committed the regression test along with the bug fix. Now if
   anybody breakes this in the source code again in the future, we can
   immediately identify that the code has regressed.
   
   Better yet, before committing any changes in the future, running our tests
   will ensure our changes don't have unexpected side effects - like breaking
   existing functionality.

There is one more benefit to regression tests - they can save you time. If you
ever fixed a bug that involved making changes to the source, and then running
the application and performing a series of convoluted steps to replicate the
issue, it will be immediately apparent that simply implementing your regression
test before fixing the bug will let you automate the testing for bug
resolution in an efficient manner.

To implement your regression test, you should follow the naming convention of
**regression<TicketID>** for your test functions. If no ticket exists for the
regression, you should create one first. Using this approach allows the person
running a failed regression test easily go and find out more information.

.. code-block:: cpp

    //
    // Regression Testing
    //

    /** This is our second test case...to check if a raster
     *  reports its dimensions properly. It is a regression test
     *  for ticket #832 which was fixed with change r7650.
     */
    void regression832();

    // more regression tests go here ...

Finally in your test class declaration you can declare privately any data
members and helper methods your unit test may need. In our case we will declare
a ``QgsRasterLayer *`` which can be used by any of our test methods. The raster
layer will be created in the ``initTestCase()`` function which is run before any
other tests, and then destroyed using ``cleanupTestCase()`` which is run after all
tests. By declaring helper methods (which may be called by various test
functions) privately, you can ensure that they won't be automatically run by the
QTest executable that is created when we compile our test.

.. code-block:: cpp

    private:
      // Here we have any data structures that may need to
      // be used in many test cases.
      QgsRasterLayer * mpLayer;
  };

That ends our class declaration. The implementation is simply inlined in the
same file lower down. First our init and cleanup functions:

.. code-block:: cpp

  void TestQgsRasterLayer::initTestCase()
  {
    // init QGIS's paths - true means that all path will be inited from prefix
    QString qgisPath = QCoreApplication::applicationDirPath ();
    QgsApplication::setPrefixPath(qgisPath, TRUE);
  #ifdef Q_OS_LINUX
    QgsApplication::setPkgDataPath(qgisPath + "/../share/qgis");
  #endif
    //create some objects that will be used in all tests...

    std::cout << "PrefixPATH: " << QgsApplication::prefixPath().toLocal8Bit().data() << std::endl;
    std::cout << "PluginPATH: " << QgsApplication::pluginPath().toLocal8Bit().data() << std::endl;
    std::cout << "PkgData PATH: " << QgsApplication::pkgDataPath().toLocal8Bit().data() << std::endl;
    std::cout << "User DB PATH: " << QgsApplication::qgisUserDbFilePath().toLocal8Bit().data() << std::endl;

    //create a raster layer that will be used in all tests...
    QString myFileName (TEST_DATA_DIR); //defined in CmakeLists.txt
    myFileName = myFileName + QDir::separator() + "tenbytenraster.asc";
    QFileInfo myRasterFileInfo ( myFileName );
    mpLayer = new QgsRasterLayer ( myRasterFileInfo.filePath(),
    myRasterFileInfo.completeBaseName() );
  }

  void TestQgsRasterLayer::cleanupTestCase()
  {
    delete mpLayer;
  }

The above init function illustrates a couple of interesting things.

#. We needed to manually set the QGIS application data path so that
   resources such as :file:`srs.db` can be found properly.
#. Secondly, this is a data driven test so we needed to provide a
   way to generically locate the :file:`tenbytenraster.asc` file. This was
   achieved by using the compiler define ``TEST_DATA_PATH``. The
   define is created in the ``CMakeLists.txt`` configuration file under
   :file:`<QGIS Source Root>/tests/CMakeLists.txt` and is available to all
   QGIS unit tests. If you need test data for your test, commit it
   under :file:`<QGIS Source Root>/tests/testdata`. You should only commit
   very small datasets here. If your test needs to modify the test
   data, it should make a copy of it first.

Qt also provides some other interesting mechanisms for data driven
testing, so if you are interested to know more on the topic, consult
the Qt documentation.

Next lets look at our functional test. The ``isValid()`` test simply checks the
raster layer was correctly loaded in the initTestCase. QVERIFY is a Qt macro
that you can use to evaluate a test condition. There are a few other use
macros Qt provide for use in your tests including:

* QCOMPARE ( *actual, expected* )
* QEXPECT_FAIL ( *dataIndex, comment, mode* )
* QFAIL ( *message* )
* QFETCH ( *type, name* )
* QSKIP ( *description, mode* )
* QTEST ( *actual, testElement* )
* QTEST_APPLESS_MAIN ( *TestClass* )
* QTEST_MAIN ( *TestClass* )
* QTEST_NOOP_MAIN ()
* QVERIFY2 ( *condition, message* )
* QVERIFY ( *condition* )
* QWARN ( *message* )

Some of these macros are useful only when using the Qt framework for data
driven testing (see the Qt docs for more detail).

.. code-block:: cpp

  void TestQgsRasterLayer::isValid()
  {
    QVERIFY ( mpLayer->isValid() );
  }

Normally your functional tests would cover all the range of functionality of
your classes public API where feasible. With our functional tests out the way,
we can look at our regression test example.

Since the issue in bug #832 is a misreported cell count, writing our test is
simply a matter of using QVERIFY to check that the cell count meets the
expected value:

.. code-block:: cpp

  void TestQgsRasterLayer::regression832()
  {
    QVERIFY ( mpLayer->getRasterXDim() == 10 );
    QVERIFY ( mpLayer->getRasterYDim() == 10 );
    // regression check for ticket #832
    // note getRasterBandStats call is base 1
    QVERIFY ( mpLayer->getRasterBandStats(1).elementCountInt == 100 );
  }

With all the unit test functions implemented, there's one final thing we need to
add to our test class:

.. code-block:: cpp

  QTEST_MAIN(TestQgsRasterLayer)
  #include "testqgsrasterlayer.moc"

The purpose of these two lines is to signal to Qt's moc that this is a QtTest
(it will generate a main method that in turn calls each test function. The last
line is the include for the MOC generated sources. You should replace
``testqgsrasterlayer`` with the name of your class in lower case.

Comparing images for rendering tests
====================================

Rendering images on different environments can produce subtle differences due to
platform-specific implementations (e.g. different font rendering and antialiasing
algorithms), to the fonts available on the system and for other obscure reasons.

When a rendering test runs on Travis and fails, look for the dash link at the
very bottom of the Travis log. This link will take you to a cdash page where
you can see the rendered vs expected images, along with a "difference" image
which highlights in red any pixels which did not match the reference image.

The QGIS unit test system has support for adding "mask" images, which are used
to indicate when a rendered image may differ from the reference image.
A mask image is an image (with the same name as the reference image,
but including a **_mask.png** suffix), and should be the same dimensions as the
reference image. In a mask image the pixel values indicate how much that
individual pixel can differ from the reference image, so a black pixel indicates
that the pixel in the rendered image must exactly match the same pixel in the
reference image. A pixel with RGB 2, 2, 2 means that the rendered image can vary
by up to 2 in its RGB values from the reference image, and a fully white pixel
(255, 255, 255) means that the pixel is effectively ignored when comparing the 
expected and rendered images.

A utility script to generate mask images is available as
``scripts/generate_test_mask_image.py``. This script is used by passing it the
path of a reference image (e.g. ``tests/testdata/control_images/annotations/expected_annotation_fillstyle/expected_annotation_fillstyle.png``)
and the path to your rendered image.

E.g.

.. code-block:: bash

  scripts/generate_test_mask_image.py tests/testdata/control_images/annotations/expected_annotation_fillstyle/expected_annotation_fillstyle.png /tmp/path_to_rendered_image.png

You can shortcut the path to the reference image by passing a partial part of
the test name instead, e.g.

.. code-block:: bash

  scripts/generate_test_mask_image.py annotation_fillstyle /tmp/path_to_rendered_image.png

(This shortcut only works if a single matching reference image is found.
If multiple matches are found you will need to provide the full path to the
reference image.)

The script also accepts http urls for the rendered image, so you can directly
copy a rendered image url from the cdash results page and pass it to the script.

Be careful when generating mask images - you should always view the generated
mask image and review any white areas in the image. Since these pixels are
ignored, make sure that these white images do not cover any important portions
of the reference image -- otherwise your unit test will be meaningless! 

Similarly, you can manually "white out" portions of the mask if you deliberately
want to exclude them from the test. This can be useful e.g. for tests which mix
symbol and text rendering (such as legend tests), where the unit test is not
designed to test the rendered text and you don't want the test to be subject to
cross-platform text rendering differences.

To compare images in QGIS unit tests you should use the class
``QgsMultiRenderChecker`` or one of its subclasses.

To improve tests robustness here are few tips:

#. Disable antialiasing if you can, as this minimizes cross-platform rendering
   differences.
#. Make sure your reference images are "chunky"... i.e. don't have 1 px wide
   lines or other fine features, and use large, bold fonts (14 points or more
   is recommended).
#. Sometimes tests generate slightly different sized images (e.g. legend
   rendering tests, where the image size is dependent on font rendering size -
   which is subject to cross-platform differences). To account for this,
   use ``QgsMultiRenderChecker::setSizeTolerance()`` and specify the maximum
   number of pixels that the rendered image width and height differ from the
   reference image.
#. Don't use transparent backgrounds in reference images (CDash does not
   support them). Instead, use ``QgsMultiRenderChecker::drawBackground()``
   to draw a checkboard pattern for the reference image background.
#. When fonts are required, use the font specified in
   ``QgsFontUtils::standardTestFontFamily()`` ("QGIS Vera Sans").

If travis reports errors for new images (for instance due to
antialiasing or font differences), the script
:source:`parse_dash_results.py <scripts/parse_dash_results.py>`
can help you when you are updating the local test masks.

Adding your unit test to CMakeLists.txt
=======================================


Adding your unit test to the build system is simply a matter of editing the
:file:`CMakeLists.txt` in the test directory, cloning one of the existing test
blocks, and then replacing your test class name into it. For example:

.. code-block:: cmake

  # QgsRasterLayer test
  ADD_QGIS_TEST(rasterlayertest testqgsrasterlayer.cpp)


The ADD_QGIS_TEST macro explained
---------------------------------

We'll run through these lines briefly to explain what they do, but if you are
not interested, just do the step explained in the above section.

.. code-block:: bash

  MACRO (ADD_QGIS_TEST testname testsrc)
  SET(qgis_${testname}_SRCS ${testsrc} ${util_SRCS})
  SET(qgis_${testname}_MOC_CPPS ${testsrc})
  QT4_WRAP_CPP(qgis_${testname}_MOC_SRCS ${qgis_${testname}_MOC_CPPS})
  ADD_CUSTOM_TARGET(qgis_${testname}moc ALL DEPENDS ${qgis_${testname}_MOC_SRCS})
  ADD_EXECUTABLE(qgis_${testname} ${qgis_${testname}_SRCS})
  ADD_DEPENDENCIES(qgis_${testname} qgis_${testname}moc)
  TARGET_LINK_LIBRARIES(qgis_${testname} ${QT_LIBRARIES} qgis_core)
  SET_TARGET_PROPERTIES(qgis_${testname}
  PROPERTIES
  # skip the full RPATH for the build tree
  SKIP_BUILD_RPATHTRUE
  # when building, use the install RPATH already
  # (so it doesn't need to relink when installing)
  BUILD_WITH_INSTALL_RPATH TRUE
  # the RPATH to be used when installing
  INSTALL_RPATH ${QGIS_LIB_DIR}
  # add the automatically determined parts of the RPATH
  # which point to directories outside the build tree to the install RPATH
  INSTALL_RPATH_USE_LINK_PATH true)
  IF (APPLE)
  # For macOS, the executable must be at the root of the bundle's executable folder
  INSTALL(TARGETS qgis_${testname} RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX})
  ADD_TEST(qgis_${testname} ${CMAKE_INSTALL_PREFIX}/qgis_${testname})
  ELSE (APPLE)
  INSTALL(TARGETS qgis_${testname} RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
  ADD_TEST(qgis_${testname} ${CMAKE_INSTALL_PREFIX}/bin/qgis_${testname})
  ENDIF (APPLE)
  ENDMACRO (ADD_QGIS_TEST)

Let's look a little more in detail at the individual lines. First we define the
list of sources for our test. Since we have only one source file (following the
methodology described above where class declaration and definition are in the
same file) its a simple statement:

.. code-block:: bash

  SET(qgis_${testname}_SRCS ${testsrc} ${util_SRCS})

Since our test class needs to be run through the Qt meta object compiler (moc)
we need to provide a couple of lines to make that happen too:

.. code-block:: bash

  SET(qgis_${testname}_MOC_CPPS ${testsrc})
  QT4_WRAP_CPP(qgis_${testname}_MOC_SRCS ${qgis_${testname}_MOC_CPPS})
  ADD_CUSTOM_TARGET(qgis_${testname}moc ALL DEPENDS ${qgis_${testname}_MOC_SRCS})

Next we tell cmake that it must make an executable from the test class.
Remember in the previous section on the last line of the class implementation we
included the moc outputs directly into our test class, so that will give it
(among other things) a main method so the class can be compiled as an
executable:

.. code-block:: bash

  ADD_EXECUTABLE(qgis_${testname} ${qgis_${testname}_SRCS})
  ADD_DEPENDENCIES(qgis_${testname} qgis_${testname}moc)

Next we need to specify any library dependencies. At the moment, classes have
been implemented with a catch-all QT_LIBRARIES dependency, but we will be
working to replace that with the specific Qt libraries that each class needs
only. Of course you also need to link to the relevant qgis libraries as
required by your unit test.

.. code-block:: bash

  TARGET_LINK_LIBRARIES(qgis_${testname} ${QT_LIBRARIES} qgis_core)

Next we tell cmake to install the tests to the same place as the qgis binaries
itself. This is something we plan to remove in the future so that the tests can
run directly from inside the source tree.

.. code-block:: bash

  SET_TARGET_PROPERTIES(qgis_${testname}
  PROPERTIES
  # skip the full RPATH for the build tree
  SKIP_BUILD_RPATHTRUE
  # when building, use the install RPATH already
  # (so it doesn't need to relink when installing)
  BUILD_WITH_INSTALL_RPATH TRUE
  # the RPATH to be used when installing
  INSTALL_RPATH ${QGIS_LIB_DIR}
  # add the automatically determined parts of the RPATH
  # which point to directories outside the build tree to the install RPATH
  INSTALL_RPATH_USE_LINK_PATH true)
  IF (APPLE)
  # For macOS, the executable must be at the root of the bundle's executable folder
  INSTALL(TARGETS qgis_${testname} RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX})
  ADD_TEST(qgis_${testname} ${CMAKE_INSTALL_PREFIX}/qgis_${testname})
  ELSE (APPLE)
  INSTALL(TARGETS qgis_${testname} RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
  ADD_TEST(qgis_${testname} ${CMAKE_INSTALL_PREFIX}/bin/qgis_${testname})
  ENDIF (APPLE)

Finally the above uses ``ADD_TEST`` to register the test with cmake / ctest.
Here is where the best magic happens - we register the class with ctest. If you
recall in the overview we gave in the beginning of this section, we are using
both QtTest and CTest together. To recap, QtTest adds a main method to your
test unit and handles calling your test methods within the class. It also
provides some macros like ``QVERIFY`` that you can use as to test for
failure of the tests using conditions. The output from a QtTest unit test is an
executable which you can run from the command line. However when you have a
suite of tests and you want to run each executable in turn, and better yet
integrate running tests into the build process, the CTest is what we use.


Building your unit test
========================

To build the unit test you need only to make sure that ``ENABLE_TESTS=true``
in the cmake configuration. There are two ways to do this:

1. Run ``ccmake ..`` ( or ``cmakesetup ..`` under windows) and interactively set
   the ``ENABLE_TESTS`` flag to ``ON``.
2. Add a command line flag to cmake e.g. ``cmake -DENABLE_TESTS=true ..``

Other than that, just build QGIS as per normal and the tests should build too.


Run your tests
===============


The simplest way to run the tests is as part of your normal build process:

.. code-block:: bash

  make && make install && make test

The ``make test`` command will invoke CTest which will run each test that was
registered using the ADD_TEST CMake directive described above. Typical output
from ``make test`` will look like this:

.. code-block:: bash

  Running tests...
  Start processing tests
  Test project /Users/tim/dev/cpp/qgis/build
  ## 13 Testing qgis_applicationtest***Exception: Other
  ## 23 Testing qgis_filewritertest *** Passed
  ## 33 Testing qgis_rasterlayertest*** Passed

  ## 0 tests passed, 3 tests failed out of 3

  The following tests FAILED:
  ## 1- qgis_applicationtest (OTHER_FAULT)
  Errors while running CTest
  make: *** [test] Error 8

If a test fails, you can use the ctest command to examine more closely why it
failed. Use the ``-R`` option to specify a regex for which tests you want to run
and ``-V`` to get verbose output:

.. code-block:: bash

  $ ctest -R appl -V

  Start processing tests
  Test project /Users/tim/dev/cpp/qgis/build
  Constructing a list of tests
  Done constructing a list of tests
  Changing directory into /Users/tim/dev/cpp/qgis/build/tests/src/core
  ## 13 Testing qgis_applicationtest
  Test command: /Users/tim/dev/cpp/qgis/build/tests/src/core/qgis_applicationtest
  ********* Start testing of TestQgsApplication *********
  Config: Using QTest library 4.3.0, Qt 4.3.0
  PASS : TestQgsApplication::initTestCase()
  PrefixPATH: /Users/tim/dev/cpp/qgis/build/tests/src/core/../
  PluginPATH: /Users/tim/dev/cpp/qgis/build/tests/src/core/..//lib/qgis
  PkgData PATH: /Users/tim/dev/cpp/qgis/build/tests/src/core/..//share/qgis
  User DB PATH: /Users/tim/.qgis/qgis.db
  PASS : TestQgsApplication::getPaths()
  PrefixPATH: /Users/tim/dev/cpp/qgis/build/tests/src/core/../
  PluginPATH: /Users/tim/dev/cpp/qgis/build/tests/src/core/..//lib/qgis
  PkgData PATH: /Users/tim/dev/cpp/qgis/build/tests/src/core/..//share/qgis
  User DB PATH: /Users/tim/.qgis/qgis.db
  QDEBUG : TestQgsApplication::checkTheme() Checking if a theme icon exists:
  QDEBUG : TestQgsApplication::checkTheme()
  /Users/tim/dev/cpp/qgis/build/tests/src/core/..//share/qgis/themes/default//mIconProjectionDisabled.png
  FAIL!: TestQgsApplication::checkTheme() '!myPixmap.isNull()' returned FALSE. ()
  Loc: [/Users/tim/dev/cpp/qgis/tests/src/core/testqgsapplication.cpp(59)]
  PASS : TestQgsApplication::cleanupTestCase()
  Totals: 3 passed, 1 failed, 0 skipped
  ********* Finished testing of TestQgsApplication *********
  -- Process completed
  ***Failed

  ## 0 tests passed, 1 tests failed out of 1

  The following tests FAILED:
  ## 1- qgis_applicationtest (Failed)
  Errors while running CTest

Running individual tests
------------------------

C++ tests are ordinary applications. You can run them from the build folder
like any executable.

.. code-block:: bash

  $ ./output/bin/qgis_dxfexporttest
  
  ********* Start testing of TestQgsDxfExport *********
  Config: Using QtTest library 5.12.5, Qt 5.12.5 (x86_64-little_endian-lp64 shared (dynamic) release build; by GCC 9.2.1 20190827 (Red Hat 9.2.1-1))
  PASS   : TestQgsDxfExport::initTestCase()
  PASS   : TestQgsDxfExport::testPoints()
  PASS   : TestQgsDxfExport::testLines()
  ...
  Totals: 19 passed, 4 failed, 0 skipped, 0 blacklisted, 612ms
  ********* Finished testing of TestQgsDxfExport *********

These tests also take `command line arguments
<https://doc.qt.io/qt-5/qtest-overview.html#qt-test-command-line-arguments>`_.
This makes it possible to run a specific subset of tests:

.. code-block:: bash

  $ ./output/bin/qgis_dxfexporttest testPoints   
  ********* Start testing of TestQgsDxfExport *********
  Config: Using QtTest library 5.12.5, Qt 5.12.5 (x86_64-little_endian-lp64 shared (dynamic) release build; by GCC 9.2.1 20190827 (Red Hat 9.2.1-1))
  PASS   : TestQgsDxfExport::initTestCase()
  PASS   : TestQgsDxfExport::testPoints()
  PASS   : TestQgsDxfExport::cleanupTestCase()
  Totals: 3 passed, 0 failed, 0 skipped, 0 blacklisted, 272ms
  ********* Finished testing of TestQgsDxfExport *********

Debugging unit tests
--------------------

C++ Tests
.........

For C++ unit tests, QtCreator automatically adds run targets, so you can start
them from the debugger.

If you go to *Projects* and there to the *Build & Run* --> Desktop *Run* tab, you can
also specify command line parameters that will allow a subset of the tests to be run
inside a .cpp file in the debugger.

Python Tests
............

It's also possible to start Python unit tests from QtCreator with GDB. For
this, you need to go to :guilabel:`Projects` and choose :guilabel:`Run` under
:guilabel:`Build & Run`.
Then add a new ``Run configuration`` with the executable ``/usr/bin/python3``
and the Command line arguments set to the path of the unit test python file,
e.g.
:file:`/home/user/dev/qgis/QGIS/tests/src/python/test_qgsattributeformeditorwidget.py`.

Now also change the ``Run Environment`` and add 3 new variables:

+------------------+--------------------------------------------------------------------------------+
| Variable         | Value                                                                          |
+------------------+--------------------------------------------------------------------------------+
| PYTHONPATH       | [build]/output/python/:[build]/output/python/plugins:[source]/tests/src/python |
+------------------+--------------------------------------------------------------------------------+
| QGIS_PREFIX_PATH | [build]/output                                                                 |
+------------------+--------------------------------------------------------------------------------+
| LD_LIBRARY_PATH  | [build]/output/lib                                                             |
+------------------+--------------------------------------------------------------------------------+

Replace ``[build]`` with your build directory and ``[source]`` with
your source directory.

Have fun
--------

Well that concludes this section on writing unit tests in QGIS. We hope you
will get into the habit of writing test to test new functionality and to check
for regressions. Some aspects of the test system (in particular the
:file:`CMakeLists.txt` parts) are still being worked on so that the testing framework
works in a truly platform independent way.
