*******************************************************************************
Appendix: Contributing To This Manual
*******************************************************************************

To add materials to this course, you must follow the guidelines in this Appendix.
You are not allowed to alter the conditions in this Appendix except for clarification.
This is to ensure that the quality and consistency of this manual can be maintained.

Downloading Resources
===============================================================================

The source of this document is available at `GitHub
<https://github.com/qgis/QGIS-Documentation>`_. Consult `GitHub.com
<https://github.com/>`_ for instructions on how to use the git version control system.

Manual Format
===============================================================================

This manual is written using `Sphinx <https://www.sphinx-doc.org/en/master/>`_,
a Python document generator using the `reStructuredText
<https://docutils.sourceforge.io/rst.html>`_ markup language.
Instructions on how to use these tools are available on their respective sites.

Adding a Module
===============================================================================

To add a new module:

#. First create a new directory (directly under the  top-level
   of the :file:`qgis-training-manual` directory) with the name of the new module.
#. Under this new directory, create a file called :file:`index.rst`.
   Leave this file blank for now.
#. Open the :file:`index.rst` file under the top-level directory.
   Its first lines are::

    .. toctree::
       :maxdepth: 2

       foreword/index
       introduction/index

  You will note that this is a list of directory names, followed by the name ``index``.
  This directs the top-level index file to the index files in each directory.
  The order in which they are listed determines the order they will have in the document.

#. Add the name of your new module (i.e., the name you gave the new directory),
   followed by ``/index``, to this list, wherever you want your module to appear.
#. Remember to keep the order of the modules logical, such that later modules build
   on the knowledge presented in earlier modules.
#. Open your new module's own index file (:file:`{module_name}/index.rst`).
#. Along the top of the page, create the module heading:

   #. write a first line of asterisks (``*``).
   #. Follow this with a line containing the markup phrase ``Module:``,
      followed by the name of your module.
   #. End this off with another line of same number of asterisks.

   .. note:: The underline and the overline should not be shorter than the
    line containing the module title.

#. Leave a line open beneath this.
#. Write a short paragraph explaining the purpose and content of the module.
#. Leave one line open, then add the following text::

    .. toctree::
       :maxdepth: 2

       lesson1
       lesson2

   ... where ``lesson1``, ``lesson2``, etc., are the names of your planned lessons.

The module-level index file will look like this:

::

  *******************************************************************************
  Module: Module Name
  *******************************************************************************

  Short paragraph describing the module.

  .. toctree::
     :maxdepth: 2

     lesson1
     lesson2

Adding a Lesson
===============================================================================

To add a lesson to a new or existing module:

#. Open the module directory.
#. Open the :file:`index.rst` file (created above in the case of new modules).
#. Ensure that the name of the planned lesson is listed underneath the
   :file:`toctree` directive, as shown above.
#. Create a new file under the module directory.
#. Name this file exactly the same as the name you provided in the module's
   :file:`index.rst` file, and add the extension :file:`.rst`.

  .. note:: For editing purposes, a :file:`.rst` file works exactly like a normal
    text file (:file:`.txt`).

#. To begin writing the lesson, write the markup phrase ``Lesson``,
   followed by the lesson name.
#. In the next line, write a line of equal signs (``=``), not shorter than the lesson title.
#. Leave a line open after this.
#. Write a short description of the lesson's intended purpose.
#. Include a general introduction to the subject matter.
   See the existing lessons in this manual for examples.
#. Beneath this, start a new paragraph, beginning with this phrase::

    **The goal for this lesson:**

#. Briefly explain the intended outcome of completing this lesson.
#. If you can't describe the goal of the lesson in one or two sentences,
   consider breaking the subject matter up into multiple lessons.

Each lesson will be subdivided into multiple sections, which will be addressed next.

Adding a Section
===============================================================================

There are two types of sections: "follow along" and "try yourself".

* A "follow along" section is a detailed set of directions intended to teach
  the reader how to use a given aspect of QGIS. This is typically done by
  giving click-by-click directions as clearly as possible, interspersed with
  screenshots.
* A "try yourself" section gives the reader a short assignment to try by
  themselves. It is usually associated with an entry in the answer box beneath,
  which will show or explain how to complete the assignment,
  and will show the expected outcome if possible.

Every section comes with a difficulty level. An easy section is denoted by
``★☆☆``, moderate by ``★★☆``, and advanced by ``★★★``.

Adding a "follow along" section
-------------------------------------------------------------------------------

#. To start this section, write the markup phrase of the intended difficulty
   level (as shown above).
#. Leave a space and then write ``Follow Along:``.
#. Leave another space and write the name of the section (use only an initial
   capital letter, as well as capitals for proper nouns).
#. In the next line, write a line of minuses/dashes (``-``), not shorter than the section title.
#. Write a short introduction to the section, explaining its purpose.
   Then give detailed (click-by-click) instructions on the procedure to be demonstrated.
#. In each section, include internal links, external links and screenshots as needed.
#. Try to end each section with a short paragraph that concludes it
   and leads naturally to the next section, if possible.

Adding a "try yourself" section
-------------------------------------------------------------------------------


#. To start this section, write the markup phrase of the intended difficulty
   level (as shown above).
#. Leave a space and then write ``Try Yourself:``.
#. In the next line, write a line of minuses/dashes (``-``), not shorter than the section title.
#. Explain the exercise that you want the reader to complete.
   Refer to previous sections, lessons or modules if necessary.
#. Include screenshots to clarify the requirements if a plain textual
   description is not clear.

In most cases, you will want to provide an answer regarding how to complete the
assignment given in this section.
To do so, you will need to create and feed an answer block beneath the instructions.

#. First, create the custom collapsible widget that contains the answer::
  
    .. admonition:: Answer
       :class: dropdown

#. Keeping an indentation with regard to the above block, write the instructions
   on how to complete the assignment, using links and images where needed.


Add a Conclusion
===============================================================================

To end a lesson:

#. Write the phrase ``In Conclusion``, followed by a new line of minuses/dashes (``-``).
#. Write a conclusion for the lesson, explaining which concepts have been covered in the lesson.

Add a Further Reading Section
===============================================================================

This section is optional.

* Write the phrase ``Further Reading``, followed by a new line
  of minuses/dashes (``-``).
* Include links to appropriate external websites.

Add a What's Next Section
===============================================================================

#. Write the phrase ``What's Next?``, followed by a new line of minuses/dashes (``-``).
#. Explain how this lesson has prepared students for the next lesson or module.
#. Remember to change the "what's next" section of the previous lesson if necessary,
   so that it refers to your new lesson.
   This will be necessary if you have inserted a new lesson among existing lessons,
   or after an existing lesson.

Using Markup
===============================================================================

To adhere to the standards of this document, you will need to add standard
markup to your text.

New concepts
-------------------------------------------------------------------------------

If you are explaining a new concept, you will need to write the new concept's
name in italics by enclosing it in asterisks (``*``).

::
  
  This sample text shows how to introduce a *new concept*.

Emphasis
-------------------------------------------------------------------------------

* To emphasize a crucial term which is not a new concept, write the term in
  bold by enclosing it in double asterisks (``**``).
* Use this sparingly! If used too much, it can seem to the reader that you are
  shouting or being condescending.

::

  This sample text shows how to use **emphasis** in a sentence. Include the
  punctuation mark if it is followed by a **comma,** or at the **end of the
  sentence.**

Images
-------------------------------------------------------------------------------

* When adding an image, save it to an :file:`img` folder next to the lesson file.
* Include it in the document like this::
  
    .. figure:: img/image_file.extension
       :align: center

* Remember to leave a line open above and below the image markup.

Internal links
-------------------------------------------------------------------------------

* To create an anchor for a link, write the following line above the place
  where you want the link to point to::

    .. _link-name:

* Remember to leave a line open above and below this line.
* To create a link, refer to it as below::

    :ref:`Descriptive link text <link-name>`

External links
-------------------------------------------------------------------------------

* To create an external link, write it out like this::

    `Descriptive link text <link-url>`_

Using monospaced text
-------------------------------------------------------------------------------

* When you are writing text that the user needs to enter, a path name, or the
  name of a database element such as a table or column name, you must write it
  in ``monospaced text``. For example::

    Enter the following path in the text box: ``path/to/file``.

Labeling GUI items
-------------------------------------------------------------------------------

* If you are referring to a GUI item, such as a button, you must write its name
  in :guilabel:`the GUI label format`. For example::

    To access this tool, click on the :guilabel:`Tool Name` button.

* This also applies if you are mentioning the name of a tool without requiring
  the user to click a button.

Menu selections
-------------------------------------------------------------------------------

* If you are guiding a user through menus, you must use the
  :menuselection:`menu --> selection --> format`. For example::

    To use the :guilabel:`Tool Name` tool, go to :menuselection:`Plugins -->
    Tool Type --> Tool Name`.

Adding notes
-------------------------------------------------------------------------------

* You might need to add a note in the text, which explains extra details that can't
  easily be made part of the flow of the lesson. This is the markup::

    [Normal paragraph.]
  
    .. note:: Note text.
      New line within note.
  
      New paragraph within note.
  
    [Unindented text resumes normal paragraph.]

Adding a sponsorship/authorship note
-------------------------------------------------------------------------------

If you are writing a new module, lesson or section on behalf of a sponsor, you
must include a short sponsor message of their choice. This must notify the
reader of the name of the sponsor and must appear below the heading of the
module, lesson or section that they sponsored. However, it may not be an
advertisement for their company.

If you have volunteered to write a module, lesson or section in your own
capacity, and not on behalf of a sponsor, you may include an authorship note
below the heading of the module, lesson or section that you authored. This must
take the form ``This [module/lesson/section] contributed by [author name].``
Do not add further text, contact details, etc. Such details are to be added in
the "Contributors" section of the Foreword, along with the name(s) of the
part(s) you added. If you only made enhancements, corrections and/or additions,
list yourself as an editor.

Thank You!
===============================================================================

Thank you for contributing to this project! By so doing, you are making QGIS
more accessible to users and adding value to the QGIS project as a whole.
