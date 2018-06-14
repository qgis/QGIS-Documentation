.. _translation_guidelines:

**********************
Translation Guidelines
**********************

.. contents::
   :local:

This manual is aiming to help the translator.
First the general process of how technically a translation is done
is explained. Later the translation is explained from an actual English
rst document that is translated to Dutch.
Finally a summary of :ref:`Rules of translation <translation_summary>` is given.

Although these guidelines focus on QGIS documentation, the methods and
the rules described below are also applicable to QGIS applications and
website translation.

.. _translation_process:

Translation process
===================

To create documentation first ``.rst`` documents are created.
A prebuild script creates translation files named ``.po`` files for the english
language in the folder :file:`/QGIS-Documentation/i18n/en`.

These "originals" are copied by the script to the i18n folders for other languages.

The sentences in the ``.po`` files need to be translated from english to the
language with a translation tool editor.

When you want to contribute, first get a ``.po`` file and add
translations for the sentences in the ``.po`` file.
When you are finished the ``.po`` file is placed back in the right place and
during the next build the build script now creates ``.mo`` files next to
the ``.po`` files.
These ``.mo`` files are actually used by the script to create translated output.

When afterwards an rst document is updated a new ``.po`` file is created in the
english part. The contents of this new file will be merged with already existing
``.po`` files for each language. This means that when a new line is added to
an rst document that was already translated, only the new/updated sentences are
added in the translated ``.po`` file and needs to be translated. The amount of
work for updating translations for next versions of QGIS should be relative
small.

Two different tools are currently used to do translations in QGIS:

* the Transifex web platform, the easiest and recommanded way to translate QGIS,
  transparently does the process described above and pulls all the translatable
  texts in one place for the translator. He then just picks the files he wants
  and does the translation
* Qt Linguist, a Qt development tool that requires the translator to pick and
  replace the ``.po`` files from the source code.

Note that whatever tool you choose, rules of translations are the same.

.. warning::

   **An important note:** If you want to translate content within
   the docs folder (not web), never do this in the master branch. For translations
   there are always translation branches available, once a document is fully
   updated in english for a certain version. As an example, to translate
   the manual of QGIS 2.8, you have to use the manual_en_v2.8 branch.


.. _translate_file:

Translate a file
================

To explain how translation works, we will use the heatmap plugin as an example.
In this example we will translate it from English to Dutch, but it will
be practically the same for other documents in all languages.

The source of the document can be found here:

::

  QGIS-Documentation/source/docs/user_manual/plugins/plugins_heatmap.rst

So why did I choose this document?

#. It is considered finished for the current release.
   If it is not yet completed the following statement followed by an empty line
   can be found in the top of the document.

   ``|updatedisclaimer|``

   This will produce a visible disclaimer in the output product.
   To start translating a document with an update disclaimer there is a good
   chance that later on it needs another finishing touch.

#. It also includes images, captions, headers, references and replacements.
#. I wrote it so it is easier for me to translate ;-)

The build process has created the English ``.po`` file which can be found here::

 QGIS-Documentation/i18n/en/LC_MESSAGES/docs/user_manual/plugins/plugins_heatmap.po

The equivalent Dutch ``.po`` file (basically a copy) can be found here::

 QGIS-Documentation/i18n/nl/LC_MESSAGES/docs/user_manual/plugins/plugins_heatmap.po

Along this file you will see a tiny ``.mo`` file which indicates that it
does not hold any translations yet.


.. _translation_transifex:

Translation in Transifex
........................

In order to translate QGIS with Transifex, you first need to `join the project
<http://qgis.org/en/site/getinvolved/translate.html#join-a-project>`_. Once
you got a team, click on the corresponding project and your language.
You get a list of all translatable ``.po`` files. Click on the
``docs_user-manual_plugins_plugins-heatmap`` to select the heatmap plugin file
and choose ``Translate`` in the prompted dialog.
Note that you can also choose to download the file and translate it
with tools like Qt Linguist.
The next page lists all the sentences in the file. All you need to do is select
the text and translate following the :ref:`guidelines <translate_manual>`.

For further information on the use of Transifex Web Editor, see
http://docs.transifex.com/tutorials/txeditor/.


.. _translation_linguist:

Translation in Qt Linguist
..........................

With Qt Linguist, you need to manually grab the ``.po`` file.
When you open the file in Qt Linguist for the first time you will see the
following dialog:

.. _figure_translation_language:

.. figure:: img/linguist_choose_language.png
   :align: center

   Select language for translation in linguist menu


The Target language should be filled correctly. The Source language can be left
as is with language POSIX and Country/Region on Any Country.

When you press the **[OK]** button Qt Linguist is filled with sentences and
you can start translating, see Figure_translation_menu_.


.. _figure_translation_menu:

.. figure:: img/linguist_menu.png
   :align: center
   :width: 50em

   Translate using the linguist menu

In the menu you see the following buttons which are convenient to use.

* |linguist_done_next| The Translation Done Next button, is the most important
  button. If the item needs translation, you enter a translation in the text
  field, then hit this button. If the item does not need translation just leave the
  text field for translation empty and also hit this button which indicates the
  item is done and you continue with the next item.

* |linguist_previous| The Goto Previous button, can be used to go to the
  previous translation item.

* |linguist_next| The Goto Next button, can be used to go to the next
  translation item.

* |linguist_next_todo| The Next Todo button, jumps to the first translation
  item that still needs a translation. Handy when the original document has
  changed and only several new/changed sentences need to be translated.

* |linguist_previous_todo| The Previous Todo button, searches backward and
  jumps to the first translation item it finds that still needs a translation.


.. _translate_manual:

Translate a manual
..................

Now we start to translate the plugin_heatmap manual!

Translating most of the sentences should be straightforward.
During this translation session I will point out which parts (rst statements)
need special translation.

Below we see an interesting sentence to translate:

.. code-block:: rst

   The |heatmap| :sup:`Heatmap` plugin allows to create a heatmap from a
   point vector map. A heatmap is a raster map showing the density or
   magnitude of point related information. From the result "hotspots" can
   easily be identified.


This sentence contains two rst statements:

#. ``|heatmap|`` words between ``|`` are replacements and these should never
   be translated! This will be replaced by the heatmap plugin icon!
#. ``:sup:`Heatmap```,  the ``:sup:`` statement is a superposition statement
   and prints the following text a bit higher. This is used to show the popup
   texts that appear when you hover above the toolbar item and this may be
   different when it is actually translated in the QGIS application. In the
   Dutch case it is not!

All other plain text in this sentence can be translated!

The next translation item contains the ``:ref:`` statement that is
commonly used to refer to another section somewhere in the manual! The text
following a ``:ref:`` statement should never be changed because it is a unique
identifier!

.. code-block:: rst

   First this core plugin needs to be activated using the Plugin Manager
   (see Section :ref:`load_core_plugin`). After activation the heatmap icon
   |heatmap| can be found in the Raster Toolbar.

In this case ``load_core_plugin`` is a unique reference identifier placed before
an rst item that has a caption. The ref statement will be replaced with the text
of the header and turned into a hyperlink. When the header this reference is
refering to is translated, all references to this header will be automatically
translated as well.

The next item contains the rst-tag ``:menuselection:`` followed by text
actually displayed in a menu in QGIS application, this may be translated in the
application and therefore should be changed when this is the case.

.. code-block:: rst

   Select from menu :menuselection:`View --> Toolbars --> Raster` to activate
   the Raster Toolbar when it is not yet activated.

In above item "View -->" is actually translated to "Beeld -->" because this is
the translation used in the Dutch localized QGIS application.

A bit further we meet the following tricky translation item:

.. code-block:: rst

   The |heatmap| :sup:`Heatmap` tool button starts the Dialog of the Heatmap
   plugin (see figure_heatmap_settings_).

It holds a reference to a figure ``figure_heatmap_settings_``, and like a reference
to section this reference should not be changed!! The reference definition
itself from the rst-document is not included in the ``.po`` file and can therefore
not be changed. This means the reference to figures can not be translated. When
HTML is created you will see ``figure_heatmap_settings``. When a PDF document is
created ``figure_heatmap_settings_`` is replaced with a figure number.

The next translation item with rst attributes is the following item:

.. code-block:: rst

    **Input Point dialog**: Provides a selection of loaded point vector maps.

Do not remove the stars in above line. It will print the text it holds in bold.
The text itself is often text included in the dialog itself and may well be
translated in the application.

The following translation item contains the ``:guilabel:`` rst tag.

.. code-block:: rst

    When the |checkbox| :guilabel:`Advanced` checkbox is checked it will
    give access to additional advanced options.

The text ``Advanced`` of the guilabel tag may well be translated in the QGIS
application and probably needs to be changed!

The following translation item contains \``airports\``. The quotes are
used to give the text another text font. In this case it is a literal value and
does not need translation.

.. code-block:: rst

    For the following example, we will use the ``airports`` vector point
    layer from the QGIS sample dataset (see :ref:`label_sampledata`).
    Another excellent QGIS tutorial on making heatmaps can be found on
    `http://qgis.spatialthoughts.com
    <http://qgis.spatialthoughts.com/2012/07/tutorial-making-heatmaps-using-qgis-and.html>`_.


This item also includes a hyperlink with an url and an external presentation.
The url should of course be left intact, you are allowed to change the external
text ``http://qgis.spatialthoughts.com`` which is visible by the reader. Never
remove the underscore at the end of the hyperlink which forms an essential
part of it!!


.. _translation_summary:

Summary Rules for translation
.............................

#. Do not change text between two ``|`` characters like ``|bronze|``, ``|checkbox|``, 
   ``|labels|``, ``|selectString|``, ``|addLayer|`` ... These are special tags
   used to replace images
#. Do not change references that start with the tag ``:ref:`` or ``:file:``
#. Do not change references that end with an underscore like ``figure_labels_1_``
#. Do not change the url in hyperlinks, but you may change the external
   description. Leave the underscore at the end of the hyperlink,
   without additional spacing (``>`_``)
#. Change the text inside quotes following ``:index:``,
   ``:sup:``, ``:guilabel:`` and ``:menuselection:`` tags.
   Check if/how it is translated in the QGIS Application. Do not change the tag itself.
#. Text between double stars and double quotes often indicate values or
   fieldnames, sometimes they need translation sometimes not.
#. Be aware to use exactly the same (number of) special characters of the source
   text such as `````, ``````, ``*``, ``**``, ``::``. These contribute to the
   cosmetics of the information provided
#. Do not begin nor end the text hold by special characters or tags with a space
#. Do not end the translated strings with a new paragraph, otherwise the
   text will not be translated during the html generation.

Stick to above presented rules and the translated document will look fine!

For any question, please contact the `QGIS Community Team
<qgis-community-team@lists.osgeo.org>`_ or the
`QGIS Translation Team <qgis-tr@lists.osgeo.org>`_.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addLayer| image:: /static/common/mActionAddLayer.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |heatmap| image:: /static/common/heatmap.png
   :width: 1.5em
.. |linguist_done_next| image:: img/linguist_done_next.png
   :width: 2em
.. |linguist_next| image:: img/linguist_next.png
   :width: 2em
.. |linguist_next_todo| image:: img/linguist_next_todo.png
   :width: 2em
.. |linguist_previous| image:: img/linguist_previous.png
   :width: 2em
.. |linguist_previous_todo| image:: img/linguist_previous_todo.png
   :width: 2em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
