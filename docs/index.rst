
**********************************
 Documentation for QGIS |version|
**********************************

.. only:: testing

  .. attention::  You are reading the testing version of QGIS documentation,
    an ongoing work which targets the latest changes in the software and may
    document features not available or compatible with QGIS |CURRENT| Long
    Term Release.

.. only:: not testing

  .. hint:: Looking for documentation of versions newer than the
    |version| Long Term Release? Have a look at the
    `testing docs <https://docs.qgis.org/testing/en/>`_.

.. note:: QGIS documentation is available in various languages and versions.
  Expand the :guilabel:`QGIS Documentation` menu at the bottom of the
  sidebar to see the list.

.. only:: i18n

  .. note:: This documentation is translated from the original English version
    by community members on `Transifex <https://explore.transifex.com/qgis/qgis-documentation>`_.

    Depending on the translation effort's :ref:`completion level <translation_stats>`,
    you may find paragraphs or whole pages which are still in English.
    You can help the community by providing new translations or reviewing
    existing ones on Transifex.

    For the time being, localized translations are only available for
    the Long Term releases branch, but should be suitable to learn
    how to use QGIS nevertheless.

Welcome to the official documentation of `QGIS <https://qgis.org>`_,
the free and open source community-driven GIS software!
If you are new to this documentation, the table of contents below
and in the sidebar should let you easily access the documentation
for your topic of interest. You can also use the search function
in the top left corner.

.. todo: Actually, it could be nice to refactor the first chapters of the docs
 (preamble, foreword, features, conventions) to minimize repetition and have
 an introductory chapter for the whole documentation, not within User manual.
 Also we can consider adding an overview of how the docs is structured and what
 people should expect to find in each document (inspired by
 https://docs.godotengine.org/en/stable/about/introduction.html#doc-about-intro).


Besides the online documentation, the QGIS project also provides materials that
you can download for offline reading. They are accessible from the
:guilabel:`QGIS Documentation` menu at the bottom of the sidebar, as:

* HTML zipped files that you can extract and :ref:`use as paths <doc_config_path>`
  from within the software
* PDF files

.. note:: QGIS is an open source project developed by a community of contributors.
    The documentation team can always use your feedback and help to improve
    the tutorials and features description. If you don't understand something,
    or cannot find what you are looking for in the docs, help us make the
    documentation better by letting us know:

    * Submit an issue or pull request on the `GitHub repository
      <https://github.com/qgis/QGIS-Documentation/>`_,
    * Help us `translate the documentation
      <https://qgis.org/en/site/getinvolved/translate.html>`_ into your language
    * Or talk to us on either the `qgis-community-team
      <https://lists.osgeo.org/mailman/listinfo/qgis-community-team>`_ mailing-list,
      the `#qgis <http://webchat.freenode.net/?channels=#qgis>`_ channel on IRC
      or the `#qgis:matrix.org <http://matrix.to/#/#qgis:matrix.org>`_ room!


Please have a look into one of the documents below.

.. toctree::
   :maxdepth: 2
   :caption: For Users

   QGIS Desktop User Guide/Manual (QGIS Testing) <user_manual/index>
   QGIS Server Guide/Manual (QGIS Testing) <server_manual/index>
   Training Manual <training_manual/index>
   A Gentle Introduction to GIS <gentle_gis_introduction/index>

.. toctree::
   :maxdepth: 2
   :caption: For Writers

   Documentation Guidelines <documentation_guidelines/index>

.. toctree::
   :maxdepth: 2
   :caption: For Developers

   PyQGIS Cookbook (QGIS Testing) <pyqgis_developer_cookbook/index>
   Developers Guide <developers_guide/index>

* :ref:`genindex`


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |CURRENT| replace:: 3.28
