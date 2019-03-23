================
Translation test
================

This is just a file to test Transifex translations.

Two sentences.

Some styling tests: a **bold** item, and *italic* item and a 
``fixed-space literal``. See what this looks like in github/lab.
Or what about combinations of those: **``fixed bold``** or 
*``fixed italic``* ?

This is an image |actionRun0| with ``/static/common`` (OK in build but fails in git*.com if static in source folder). We could try to do a feature request at git*.com OR sphin to handle ``/static`` either as coming from project root OR source|conf.py root? BUT OK  in gitlab if static folder in root

This is an image |actionRun1| with ``static/common`` (fails in build and git*.com), BUT OK in gitlab if static in root of project.

This is an image |actionRun2| with ``docs/user_manual/static/common/mAction.png`` (fails in build and git*.com)

This is an image |actionRun3| with ``../../static/common/mAction.png`` (OK in build and OK in git*.com)

Test urls:

https://github.com/rduivenvoorde/qgisdoc/blob/master/source/docs/user_manual/trans.rst

https://gitlab.com/rduivenvoorde/qgisdoc/blob/master/source/docs/user_manual/trans.rst

http://localhost/qgisdocs/en/docs/user_manual/trans.html




.. |actionRun0| image:: /static/common/mAction.png
   :width: 1.5em
.. |actionRun1| image:: static/common/mAction.png
   :width: 1.5em
.. |actionRun2| image:: docs/user_manual/static/common/mAction.png
   :width: 1.5em
.. |actionRun3| image:: ../../static/common/mAction.png
   :width: 1.5em
