|updatedisclaimer|

Vector selection
================

Extract by attribute
--------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Layer`` [vector: any]
  <put parameter description here>

``Selection attribute`` [tablefield: any]
  <put parameter description here>

``Operator`` [selection]
  <put parameter description here>

  Options:

  * 0 --- =
  * 1 --- !=
  * 2 --- >
  * 3 --- >=
  * 4 --- <
  * 5 --- <=
  * 6 --- begins with
  * 7 --- contains

  Default: *0*

``Value`` [string]
  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:extractbyattribute', input, field, operator, value, output)

See also
........

Extract by location
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer to select from`` [vector: any]
  <put parameter description here>

``Additional layer (intersection layer)`` [vector: any]
  <put parameter description here>

``Predicate [array of Unicode strings]
Condition for the selection. Array of one or more of the following predicates:

* disjoint
* intersects
* contains
* equals
* touches
* overlaps
* within
* crosses

For console usage the precicates must be defined as an array of Unicode strings, eg. [u'intersects',u'contains']

Outputs
.......

``Selection`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:extractbylocation', input, intersect, predicates, output)

See also
........

Random extract
--------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Number of selected features
  * 1 --- Percentage of selected features

  Default: *0*

``Number/percentage of selected features`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Selection`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:randomextract', input, method, number, output)

See also
........

Random extract within subsets
-----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``ID Field`` [tablefield: any]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Number of selected features
  * 1 --- Percentage of selected features

  Default: *0*

``Number/percentage of selected features`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Selection`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:randomextractwithinsubsets', input, field, method, number, output)

See also
........

Random selection
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Number of selected features
  * 1 --- Percentage of selected features

  Default: *0*

``Number/percentage of selected features`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Selection`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:randomselection', input, method, number)

See also
........

Random selection within subsets
-------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``ID Field`` [tablefield: any]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Number of selected features
  * 1 --- Percentage of selected features

  Default: *0*

``Number/percentage of selected features`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Selection`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:randomselectionwithinsubsets', input, field, method, number)

See also
........

Select by attribute
-------------------

Description
...........

Selects and saves as new layer all features from input layer that satisfy
condition.

*NOTE*: algorithm is case-sensitive ("qgis" is different from "Qgis" and "QGIS")

Parameters
..........

``Input Layer`` [vector: any]
  Layer to process.

``Selection attribute`` [tablefield: any]
  Field on which perform the selection.

``Operator`` [selection]
  Comparison operator.

  Options:

  * 0 --- =
  * 1 --- !=
  * 2 --- >
  * 3 --- >=
  * 4 --- <
  * 5 --- <=
  * 6 --- begins with
  * 7 --- contains

  Default: *0*

``Value`` [string]
  Value to compare.

  Default: *(not set)*

Outputs
.......

``Output`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('qgis:selectbyattribute', input, field, operator, value, output)

See also
........

Select by expression
--------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Layer`` [vector: any]
  <put parameter description here>

``Expression`` [string]
  <put parameter description here>

  Default: *(not set)*

``Modify current selection by`` [selection]
  <put parameter description here>

  Options:

  * 0 --- creating new selection
  * 1 --- adding to current selection
  * 2 --- removing from current selection

  Default: *0*

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:selectbyexpression', layername, expression, method)

See also
........

Select by location
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer to select from`` [vector: any]
  <put parameter description here>

``Additional layer (intersection layer)`` [vector: any]
  <put parameter description here>

``Predicate [array of Unicode strings]
Condition for the selection. Array of one or more of the following predicates:

* disjoint
* intersects
* contains
* equals
* touches
* overlaps
* within
* crosses

For console usage the precicates must be defined as an array of Unicode strings, eg. [u'intersects',u'contains']


``Modify current selection by`` [selection]
  <put parameter description here>

  Options:

  * 0 --- creating new selection
  * 1 --- adding to current selection
  * 2 --- removing from current selection

  Default: *0*

Outputs
.......

``Selection`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:selectbylocation', input, intersect, predicate, method)

See also
........

