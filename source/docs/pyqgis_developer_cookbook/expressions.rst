.. only:: html

   |updatedisclaimer|

The code snippets on this page needs the following imports if you're outside the pyqgis console:

.. testcode::

   from qgis.core import (
      QgsExpression,
      QgsExpressionContext,
      QgsFeature,
      QgsField,
      QgsFields,
      QgsVectorLayer
   )

.. index:: Expressions, Filtering, Calculating values

.. _expressions:

*********************************************
Expressions, Filtering and Calculating Values
*********************************************

.. warning:: |outofdate|

.. contents::
   :local:

QGIS has some support for parsing of SQL-like expressions. Only a small subset
of SQL syntax is supported. The expressions can be evaluated either as boolean
predicates (returning True or False) or as functions (returning a scalar value).
See :ref:`vector_expressions` in the User Manual for a complete list of available
functions.

Three basic types are supported:

* number --- both whole numbers and decimal numbers, e.g. ``123``, ``3.14``
* string --- they have to be enclosed in single quotes: ``'hello world'``
* column reference --- when evaluating, the reference is substituted with the
  actual value of the field. The names are not escaped.

The following operations are available:

* arithmetic operators: ``+``, ``-``, ``*``, ``/``, ``^``
* parentheses: for enforcing the operator precedence: ``(1 + 1) * 3``
* unary plus and minus: ``-12``, ``+5``
* mathematical functions: ``sqrt``, ``sin``, ``cos``, ``tan``, ``asin``,
  ``acos``, ``atan``
* conversion functions: ``to_int``, ``to_real``, ``to_string``, ``to_date``
* geometry functions: ``$area``, ``$length``
* geometry handling functions: ``$x``, ``$y``, ``$geometry``, ``num_geometries``, ``centroid``

And the following predicates are supported:

* comparison: ``=``, ``!=``, ``>``, ``>=``, ``<``, ``<=``
* pattern matching: ``LIKE`` (using % and _), ``~`` (regular expressions)
* logical predicates: ``AND``, ``OR``, ``NOT``
* NULL value checking: ``IS NULL``, ``IS NOT NULL``

Examples of predicates:

* ``1 + 2 = 3``
* ``sin(angle) > 0``
* ``'Hello' LIKE 'He%'``
* ``(x > 10 AND y > 10) OR z = 0``

Examples of scalar expressions:

* ``2 ^ 10``
* ``sqrt(val)``
* ``$length + 1``

.. index:: Expressions; Parsing

Parsing Expressions
===================

.. testcode::

   exp = QgsExpression('1 + 1 = 2')
   assert(not exp.hasParserError())

   exp = QgsExpression('1 + 1 = ')
   assert(exp.hasParserError())

   assert(exp.parserErrorString() == '\nsyntax error, unexpected $end')

.. index:: Expressions; Evaluating

Evaluating Expressions
======================

Basic Expressions
-----------------

.. testcode::

   exp = QgsExpression('1 + 1 = 2')
   assert(exp.evaluate())


Expressions with features
--------------------------

The following example will evaluate the given expression against a feature.
A :class:`QgsExpressionContext <qgis.core.QgsExpressionContext>`
object has to be created and passed, to allow the expression to access the feature field values.
"Column" is the name of the field in the layer.

.. testcode::

   fields = QgsFields()
   field = QgsField('Column')
   fields.append(field)
   feature = QgsFeature()
   feature.setFields(fields)
   feature.setAttribute(0, 99)
   exp = QgsExpression('Column')
   context = QgsExpressionContext()
   context.setFeature(feature)
   assert(exp.evaluate(context) == 99)


Handling errors
---------------

.. testcode::

   exp = QgsExpression("1 + 1 = 2 ")
   if exp.hasParserError():
      raise Exception(exp.parserErrorString())

   value = exp.evaluate()
   if exp.hasEvalError():
      raise ValueError(exp.evalErrorString())


Examples
========

The following example can be used to filter a layer and return any feature that
matches a predicate.

.. testcode::

   def where(layer, exp):

      exp = QgsExpression(exp)
      if exp.hasParserError():
         raise Exception(exp.parserErrorString())
      context = QgsExpressionContext()
      context.setFields(layer.fields())
      exp.prepare(context)
      for feature in layer.getFeatures():
         context.setFeature(feature)
         value = exp.evaluate(context)
         if exp.hasEvalError():
            raise ValueError(exp.evalErrorString())
         if bool(value):
            yield feature

   layer = QgsVectorLayer("Point?field=Test:integer",
                              "addfeat", "memory")

   layer.startEditing()

   for i in range(10):
       feature = QgsFeature()
       feature.setAttributes([i])
       assert(layer.addFeature(feature))
   layer.commitChanges()

   matches = 0
   for f in where(layer, 'Test >= 3'):
      matches+=1

   assert(matches == 7)


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
