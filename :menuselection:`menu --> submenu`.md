:menuselection:`menu --> submenu`
:guilabel:`title`
:file:`README.rst`
|icon| :sup:`popup_text`
:kbd:`Ctrl+B`   
:kbd:`Ctrl+B`
``label``
``layer name``
.. _my_anchor:

Label/reference
---------------
see my_anchor_ for more information.
see :ref:`my_anchor` for more information.
see :ref:`Label and reference <my_anchor>` for more information.

To insert an image, use
.. figure:: /static/common/logo.png
   :width: 10 em


you can put an image inside text or add an alias to use everywhere. To use an image inside a paragraph, first create an alias in the **source/substitutions.txt** file:

   .. |nice_logo| image:: /static/common/logo.png
               :width: 1 em

 **To allow preview rendering in GitHub that is as close as possible to HTML rendering, you will also need to add the image replacement call at the end of the file you changed. This can be done by copy-pasting it from substitutions.txt or by executing the scripts/find_set_subst.py script.**              
