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

And following predicates are supported:

* comparison: ``=``, ``!=``, ``>``, ``>=``, ``<``, ``<=``
* pattern matching: ``LIKE`` (using % and _), ``~`` (regular expressions)
* logical predicates: ``AND``, ``OR``, ``NOT``
* NULL value checking: ``IS NULL``, ``IS NOT NULL``

**Compatibility note:** mathematical, geometry, conversion functions and power
operator ``^`` are available from QGIS 1.4.

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


**TODO:** parsing, error handling

::

  >>> s = QgsSearchString()
  >>> s.setString("1 + 1 = 2")
  True
  >>> s.setString("1 + 1 =")
  False
  >>> s.parserErrorMsg()
  PyQt4.QtCore.QString(u'syntax error, unexpected $end')

**TODO:** working with the tree, evaluation as a predicate, as a function, error handling

.. index:: expressions; evaluating

Evaluating Expressions
======================

::

  st = ss.tree()
  if not st:
    raise ValueError, "empty expression was used"

  print st.makeSearchString()

  res = st.checkAgainst(fields, feature.attributeMap())

  res, value = st.getValue(st, fields, feature.attributeMap(), feature.geometry())

  print st.errorMsg()
