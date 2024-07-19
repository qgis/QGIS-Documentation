.. highlight:: python
   :linenothreshold: 5

.. testsetup:: expr

    iface = start_qgis()


.. index:: Expressions, Filtering, Calculating values
.. _expressions:

*********************************************
Expressions, Filtering and Calculating Values
*********************************************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: expr

    from qgis.core import (
        edit,
        QgsExpression,
        QgsExpressionContext,
        QgsFeature,
        QgsFeatureRequest,
        QgsField,
        QgsFields,
        QgsVectorLayer,
        QgsPointXY,
        QgsGeometry,
        QgsProject,
        QgsExpressionContextUtils
    )

.. only:: html

   .. contents::
      :local:

QGIS has some support for parsing of SQL-like expressions. Only a small subset
of SQL syntax is supported. The expressions can be evaluated either as boolean
predicates (returning :const:`True` or :const:`False`) or as functions (returning a scalar value).
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

The following example shows how to check if a given expression can be parsed correctly:

.. testcode:: expr

   exp = QgsExpression('1 + 1 = 2')
   assert(not exp.hasParserError())

   exp = QgsExpression('1 + 1 = ')
   assert(exp.hasParserError())

   assert(exp.parserErrorString() == '\nsyntax error, unexpected end of file')

.. index:: Expressions; Evaluating

Evaluating Expressions
======================

Expressions can be used in different contexts, for example to filter features or to compute
new field values. In any case, the expression has to be evaluated. That means that its
value is computed by performing the specified computational steps, which can range from
simple arithmetic to aggregate expressions.


Basic Expressions
-----------------

This basic expression evaluates a simple arithmetic operation:

.. testcode:: expr

   exp = QgsExpression('2 * 3')
   print(exp)
   print(exp.evaluate())

.. testoutput:: expr

   <QgsExpression: '2 * 3'>
   6

Expression can also be used for comparison, evaluating to 1 (:const:`True`)
or 0 (:const:`False`)

.. testcode:: expr

   exp = QgsExpression('1 + 1 = 2')
   exp.evaluate()
   # 1


Expressions with features
--------------------------

To evaluate an expression against a feature, a :class:`QgsExpressionContext <qgis.core.QgsExpressionContext>`
object has to be created and passed to the evaluate function in order to allow the expression to access
the feature's field values.

The following example shows how to create a feature with a field called "Column" and how to add this
feature to the expression context.

.. testcode:: expr

   fields = QgsFields()
   field = QgsField('Column')
   fields.append(field)
   feature = QgsFeature()
   feature.setFields(fields)
   feature.setAttribute(0, 99)

   exp = QgsExpression('"Column"')
   context = QgsExpressionContext()
   context.setFeature(feature)
   exp.evaluate(context)
   # 99


The following is a more complete example of how to use expressions in the context of a vector layer, in
order to compute new field values:

.. testcode:: expr

   from qgis.PyQt.QtCore import QMetaType

   # create a vector layer
   vl = QgsVectorLayer("Point", "Companies", "memory")
   pr = vl.dataProvider()
   pr.addAttributes([QgsField("Name", QMetaType.Type.QString),
                     QgsField("Employees",  QMetaType.Type.Int),
                     QgsField("Revenue", QMetaType.Type.Double),
                     QgsField("Rev. per employee", QMetaType.Type.Double),
                     QgsField("Sum", QMetaType.Type.Double),
                     QgsField("Fun", QMetaType.Type.Double)])
   vl.updateFields()

   # add data to the first three fields
   my_data = [
       {'x': 0, 'y': 0, 'name': 'ABC', 'emp': 10, 'rev': 100.1},
       {'x': 1, 'y': 1, 'name': 'DEF', 'emp': 2, 'rev': 50.5},
       {'x': 5, 'y': 5, 'name': 'GHI', 'emp': 100, 'rev': 725.9}]

   for rec in my_data:
       f = QgsFeature()
       pt = QgsPointXY(rec['x'], rec['y'])
       f.setGeometry(QgsGeometry.fromPointXY(pt))
       f.setAttributes([rec['name'], rec['emp'], rec['rev']])
       pr.addFeature(f)

   vl.updateExtents()
   QgsProject.instance().addMapLayer(vl)

   # The first expression computes the revenue per employee.
   # The second one computes the sum of all revenue values in the layer.
   # The final third expression doesn’t really make sense but illustrates
   # the fact that we can use a wide range of expression functions, such
   # as area and buffer in our expressions:
   expression1 = QgsExpression('"Revenue"/"Employees"')
   expression2 = QgsExpression('sum("Revenue")')
   expression3 = QgsExpression('area(buffer($geometry,"Employees"))')

   # QgsExpressionContextUtils.globalProjectLayerScopes() is a convenience
   # function that adds the global, project, and layer scopes all at once.
   # Alternatively, those scopes can also be added manually. In any case,
   # it is important to always go from “most generic” to “most specific”
   # scope, i.e. from global to project to layer
   context = QgsExpressionContext()
   context.appendScopes(QgsExpressionContextUtils.globalProjectLayerScopes(vl))

   with edit(vl):
       for f in vl.getFeatures():
           context.setFeature(f)
           f['Rev. per employee'] = expression1.evaluate(context)
           f['Sum'] = expression2.evaluate(context)
           f['Fun'] = expression3.evaluate(context)
           vl.updateFeature(f)

   print(f['Sum'])

.. testoutput:: expr

   876.5


Filtering a layer with expressions
----------------------------------

The following example can be used to filter a layer and return any feature that
matches a predicate.

.. testcode:: expr

   layer = QgsVectorLayer("Point?field=Test:integer",
                              "addfeat", "memory")

   layer.startEditing()

   for i in range(10):
       feature = QgsFeature()
       feature.setAttributes([i])
       assert(layer.addFeature(feature))
   layer.commitChanges()

   expression = 'Test >= 3'
   request = QgsFeatureRequest().setFilterExpression(expression)

   matches = 0
   for f in layer.getFeatures(request):
      matches += 1

   print(matches)


.. testoutput:: expr

   7

Handling expression errors
==========================

Expression-related errors can occur during expression parsing or evaluation:

.. testcode:: expr

   exp = QgsExpression("1 + 1 = 2")
   if exp.hasParserError():
      raise Exception(exp.parserErrorString())

   value = exp.evaluate()
   if exp.hasEvalError():
      raise ValueError(exp.evalErrorString())
