|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _`topology`:

Topology Checker Plugin
=======================

Topology describes the relationships between the points, lines and polygons that represent the features of a geographic region.
With the Topology Checker plugin you can look over your vector files and check the topology with several topology rules.
These rules check with spatial relations whether your features 'Equal', 'Contain', 'Cover', are 'CoveredBy', 'Cross', 'Disjoint',
'Intersect', 'Overlap', 'Touches' and are 'Within' each other. It depends on your individual questions which topology rules
you apply to your vector data. E.g. normally you won't accept overshoots in line layers but if they depict dead-end streets you 
won't remove them from your vector layer.

QGis has the built-in topological editing feature which is great for creating new features without errors. But existing data errors and user induced errors are hard to find out. This plugin helps find out such errors through a list of rules.

It is very simple to create topology rules with the Topology Checker plugin.

In figure_topology_rule_ you can see the topology rules which can be applied to a **line layer**:

* **end points must be covered by**: Here you can select a point layer from your project. 
* **must not have dangles**: This will show the overshoots in the line layer.
* **must not have duplicates**: Whenever a line feature is represented twice or more it will occur in the 'Error' field.
* **must not have invalid geometries**: Invalid line geometries are ... ... ... .
* **must not have multi-part geometries**: All multi-part lines are written into the 'Error' field.
* **must not have pseudos**: Pseudo lines are ...

On **polygon layers** the following rules are available:

* **must contain**: Here you can use a points layer that should be inside the polygons.
* **must not have duplicates**: Whenever a polygon feature is represented twice or more it will occur in the 'Error' field.
* **must not have gaps**: 
* **must not have invalid geometries**:
* **must not have multi-part geometries**:
* **must not overlap**:
* **must not overlap with**:

You can apply the following rules to **point layers**:

* **must be covered by**: Here you can choose a vector layer from your project. Points that aren't covered by the given vector layer occur in the   'Error' field
* **must be covered by endpoints of**: Here you can choose a line layer from your project. 
* **must be inside**: Here you can choose a polygon layer from your project. The points must be inside a polygon. Otherwise QGIS writes an 'Error'  for the point.
* **must not have duplicates**: Whenever a point is represented twice or more it will occur in the 'Error' field.
* **must not have invalid geometries**: 
* **must not have multipart-geometries**:
