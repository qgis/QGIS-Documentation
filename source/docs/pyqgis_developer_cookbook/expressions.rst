.. index:: expressions, filtering, calculating values

.. _expressions:

*********************************************
Expressions, Filtering and Calculating Values
*********************************************

QGIS has some support for parsing of SQL-like expressions. Only a small subset
of SQL syntax is supported. The expressions can be evaluated either as boolean
predicates (returning True or False) or as functions (returning a scalar value).

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
* geometry functions: ``$area``, ``$length``
* conversion functions: ``to int``, ``to real``, ``to string``

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

.. index:: expressions; parsing

Parsing Expressions
===================

::

  >>> exp = QgsExpression('1 + 1 = 2')
  >>> exp.hasParserError()
  False
  >>> exp = QgsExpression('1 + 1 = ')
  >>> exp.hasParserError()
  True
  >>> exp.parserErrorString()
  PyQt4.QtCore.QString(u'syntax error, unexpected $end')

.. index:: expressions; evaluating

Evaluating Expressions
======================

Basic Expressions
-----------------

::

  >>> exp = QgsExpression('1 + 1 = 2')
  >>> value = exp.evaluate()
  >>> value
  1

Expressions with features
--------------------------

The following example will evaluate the given expression against a feature.
"Column" is the name of the field in the layer.

::

  >>> exp = QgsExpression('Column = 99')
  >>> value = exp.evaluate(feature, layer.pendingFields())
  >>> bool(value)
  True

You can also use :func:`QgsExpression.prepare()` if you need check more than
one feature.  Using :func:`QgsExpression.prepare()` will increase the speed
that evaluate takes to run.

::

  >>> exp = QgsExpression('Column = 99')
  >>> exp.prepare(layer.pendingFields())
  >>> value = exp.evaluate(feature)
  >>> bool(value)
  True


Handling errors
---------------

::

  exp = QgsExpression("1 + 1 = 2 ")
  if exp.hasParserError():
    raise Exception(exp.parserErrorString())

  value = exp.evaluate()
  if exp.hasEvalError():
    raise ValueError(exp.evalErrorString())

  print value

Examples
========

The following example can be used to filter a layer and return any feature that
matches a predicate.

::

  def where(layer, exp):
    print "Where"
    exp = QgsExpression(exp)
    if exp.hasParserError():
      raise Expection(exp.parserErrorString())
    exp.prepare(layer.pendingFields())
    for feature in layer.getFeatures():
      value = exp.evaluate(feature)
      if exp.hasEvalError():
        raise ValueError(exp.evalErrorString())
      if bool(value):
        yield feature

  layer = qgis.utils.iface.activeLayer()
  for f in where(layer, 'Test > 1.0'):
    print f + " Matches expression"
