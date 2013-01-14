.. _translation_guidelines:

**********************
Translation Guidelines
**********************


This manual is aiming to help the translator.
First the general process of how technically a translation is done 
is explained. Later the translation is explained from an actual English 
rst document that is translated to Dutch.
Finally a summary of "Rules of translation" is given.

.. _translation_general:

General information
===================


To explain how translation works, we will use the heatmap plugin as an example. 
In this example we will translate it from English to Dutch, but it will 
be practically the same for other documents in all languages.

.. _first_translation:

First translation
.................


To create documentation first rst documents are created.
A prebuild script creates translation files named .po files for the english 
language in the folder /QGIS-Documentation/i18n/en. 

These "originals" are copied by the script to the i18n folders for other languages. 

The sentences in the .po files needs to be translated from english to the 
language with a translation tool editor. There is a web translation tool called 
pootle we would like to use, but it is not activated yet. However there is an 
excellent tool supplied with the qt development tools named Qt Linguist.

When you want to contribute, first get a .po file and add 
translations for the sentences in the .po file. 

When you are finished the .po file is placed back in the right place and during the next 
build the buildscript now creates .mo files next to the .po files.

These .mo files are actually used by the script to create translated output.

.. _update_translation:


Update translations
...................

 
When afterwards an rst document is updated a new .po file is created in the 
english part. The contents of this new file will be merged with already existing .po 
files for each language. This means that when a new line is added to 
an rst document that was allready translated, only the new/updated sentences are 
added in the translated .po file and needs to be translated. The amount of 
work for updating translations for next versions of |QG| should be relative 
small.

.. _translate_po_file:


Translate a .po-file
====================


For this example we will use the relative smaller rst document 
for the heatmap plugin. The source of the document can be found here:

  QGIS-Documentation/source/docs/user_manual/plugins/plugins_heatmap.rst

So why did I choose this document? 

1. It is considered finished for the current release.
   If it is not yet completed the following statement followed by an empty line 
   can be found in the top of the document.

   ``|updatedisclamer|``

   This will produce a visible disclaimer in the output product. 
   To start translating a document with an update disclaimer there is a good 
   chance that later on it needs another finishing touch.

2. It also includes images, captions, headers, references and replacements.
3. I wrote it so it is easier for me to translate ;-)

The build process has created the English .po file which can be found here:

  QGIS-Documentation/i18n/en/LC_MESSAGES/docs/user_manual/plugins/plugins_heatmap.po

The equivalent Dutch .po file (basically a copy) can be found here:

  QGIS-Documentation/i18n/nl/LC_MESSAGES/docs/user_manual/plugins/plugins_heatmap.po

Along this file you will see a tiny .mo file which indicates that it 
does not hold any translations yet. 

Now I will grab this .po file and start translating it. During this translation 
session I will point out which parts (rst statements) need translation.

.. _translation_linguist:

Translation in Qt Linguist
..........................


When you open the .po file in Qt Linguist for the first time you will see the 
following dialog:

.. _figure_translation_1:

.. only:: html

   **Figure Translation 1:**

.. figure:: /static/documentation_guidelines/linguist_choose_language.png
   :align: center

   Select language for translation in linguist menu |osx|


The Target language should be filled correctly. The Source language can be left 
as is with language POSIX and Country/Region on Any Country. 
 
When you press the **[OK]** button Qt Linguist is filled with sentences and 
you can start translating, see Figure translation 2.


.. _figure_translation_2:

.. only:: html

   **Figure Translation 2:**
  
.. figure:: /static/documentation_guidelines/linguist_menu.png
   :align: center
   :width: 50em

   Translate using the linguist menu |osx|


.. |linguist_done_next| image:: /static/documentation_guidelines/linguist_done_next.png
   :width: 2em
.. |linguist_next| image:: /static/documentation_guidelines/linguist_next.png
   :width: 2em
.. |linguist_previous| image:: /static/documentation_guidelines/linguist_previous.png
   :width: 2em
.. |linguist_next_todo| image:: /static/documentation_guidelines/linguist_next_todo.png
   :width: 2em
.. |linguist_previous_todo| image:: /static/documentation_guidelines/linguist_previous_todo.png
   :width: 2em

In the menu you see the following buttons which are convenient to use.

   * |linguist_done_next| The Translation Done Next button, is the most important 
     button. If the item needs translation, you enter a translation in the text 
     field, then hit this button. If the item does not translation just leave the 
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

The first two items do not need translation, just push the toolbar button which 
considers the translation finished and jump to the next item.

When I get to the third item we see a more interesting sentence to translate:

::

   The |heatmap| :sup:`Heatmap` plugin allows to create a heatmap from a point vector map. A heatmap is a raster map showing the density or magnitude of point related information. From the result "hotspots" can easily be identified. 
  

This sentence contains two rst statements:
  #. ``|heatmap|`` words between ``|`` are replacements and these should never 
     be translated! This will be replaced by the heatmap plugin icon!
  #. ``:sup:`Heatmap` `` the ``:sup:`` statement is a superposition statement 
     and prints the following text a bit higher. This is used to show the popup 
     texts that appear when you hover above the toolbar item and this may be 
     different when it is actually translated in the QGIS application. In this 
     case it is not!

All other plain text in this sentence can be translated!
  
The fifth translation item contains the ``:ref:`` rst statement that is 
commonly used to refer to another section somewhere in het manual! The text 
following a ``:ref:`` statement should never be changed because it is a unique 
identifier!

::

   First this core plugin needs to be activated using the Plugin Manager (see Section :ref:`load_core_plugin`). After activation the heatmap icon |heatmap| can be found in the Raster Toolbar.

In this case "load_core_plugin" is a unique reference identifier placed before 
an rst item that has a caption. The ref statement will be replaced with the text 
of the header and turned into a hyerlink. When the header this reference is 
refering to is translated, all references to this header will be automatically 
translated as well. 

The next item contains the rst-tag ``:menuselection:`` followed by text 
actually displayed in a menu in QGIS application, this may be translated in the 
application and therefore should be changed when this is the case.

::

   Select from menu :menuselection:`View -->` :menuselection:`Toolbars -->` :menuselection:`Raster` to activate the Raster Toolbar when it is not yet activated.
  
In above item "View -->" is actually translated to "Beeld -->" because this is 
the translation used in the Dutch localized QGIS application. 

A bit further we meet the following tricky translation item:

::

   The |heatmap| :sup:`Heatmap` toolbutton starts the Dialog of the Heatmap plugin (see figure_heatmap_2_).

It holds a reference to a figure ``figure_heatmap_2_``, and like a reference 
to section this reference should not be changed!! The reference definition 
itself from the rst-document is not included in the .po file and can therefore 
not be changed. This means the reference to figures can not be translated. When 
HTML is created you will see ``figure_heatmap_2``. When a PDF document is 
created ``figure_heatmap_2_`` is replaced with a figure number.

The next translation item with rst attributes is the following item:

::

    **Input Point dialog**: Provides a selection of loaded point vector maps.

Do not remove the stars in above line. It will print the text it holds in bold. 
The text itself is often text included in the dialog itself and may wel be 
translated in the application. 

The following translation item contains the ``:guilabel:`` rst tag.

::
    
    When the |checkbox| :guilabel:`Advanced` checkbox is checked it will give acces to additional advanced options.

The text `Advanced` of the guilabel tag may wel be translated in the QGIS 
application and probably needs to be changed!

The following translation item contains \`\`airports\`\`. The apostrophs are 
used this to give text another textfont. In this case it is a literal value and
does not need translation. 

::

    For the following example, we will use the ``airports`` vector point layer from the QGIS sample dataset (see :ref:`label_sampledata`). Another exellent QGIS tutorial on making heatmaps can be found on `http://qgis.spatialthoughts.com <http://qgis.spatialthoughts.com/2012/07/tutorial-making-heatmaps-using-qgis-and.html>`_.


This item also includes a hyperlink with a url and an external presentation. 
The url should ofcourse be left intact, you are allowed to change the external 
text "http://qgis.spatialthoughts.com" which is visible by the reader. Never 
remove the underscore at the end of the hyperlink which forms an essential 
part of it!!

.. _translation_summary:

Summary Rules for translation
.............................


#. Do not change replacements like ``|nix|``
#. Do not change references that start with the tag ``:ref:``
#. Do not change references that end with an underscore like ``figure_1_``
#. Do not change the url in hyperlinks, but you may change the external 
   description. Leave the underscore at the end of the hyperlink
#. Change the contents of ``:sup:``, ``:guilabel:`` and ``:menuselection:``,
   Check if/how it is translated in the QGIS Application.
#. Text between Double Stars and double apostrophes often indicate values or 
   fieldnames, sometimes they need translation sometimes not.
#. Be aware to use exactly the same apostrophes of the source text.
#. Don't end the translated strings with a new paragraph, otherwise the 
   text will not be translated during the html generation.


Stick to above presented rules and the translated document will look fine!

