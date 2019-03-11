.. only:: html

   |updatedisclaimer|

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

.. code-block:: python

  exp = QgsExpression('1 + 1 = 2')
  exp.hasParserError() #will return False

  exp = QgsExpression('1 + 1 = ')
  exp.hasParserError() #Will return True

  exp.parserErrorString() #will return 'syntax error, unexpected $end'

.. index:: Expressions; Evaluating

Evaluating Expressions
======================

Basic Expressions
-----------------

  .. code-block:: python

  exp = QgsExpression('1 + 1 = 2')
  value = exp.evaluate()


Expressions with features
--------------------------

The following example will evaluate the given expression against a feature.
A :class:`QgsExpressionContext <qgis.core.QgsExpressionContext>`
object has to be creted and passed, to allow the expression to access the feature field values.
"Column" is the name of the field in the layer.

.. code-block:: python

  exp = QgsExpression('Column')
  context = QgsExpressionContext()
  context.setFeature(feature)
  exp.evaluate(context)
  99

You can also use :meth:`QgsExpression.prepare() <qgis.core.QgsExpression.prepare>` if you need check more than
one feature.  Using :meth:`QgsExpression.prepare() <qgis.core.QgsExpression.prepare>` will increase the speed
that evaluate takes to run.

.. code-block:: python

  exp = QgsExpression('Column')
  context = QgsExpressionContext()
  context.setFeature(feature)
  exp.prepare(context)
  exp.evaluate(feature)



Handling errors
---------------

.. code-block:: python

  exp = QgsExpression("1 + 1 = 2 ")
  if exp.hasParserError():
    raise Exception(exp.parserErrorString())

  value = exp.evaluate()
  if exp.hasEvalError():
    raise ValueError(exp.evalErrorString())

  print(value)

Examples
========

The following example can be used to filter a layer and return any feature that
matches a predicate.

.. code-block:: python

  def where(layer, exp):
    print("Where")
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

  layer = qgis.utils.iface.activeLayer()
  for f in where(layer, 'Test > 1.0'):
    print(f + " Matches expression")


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
