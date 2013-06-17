|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _`topology`:

Topology Checker Plugin
=======================

With the Topology Checker plugin you can look over your vector files and check the topology with several topology rules.
It is very simple to create topology rules.
In figure_topology_rule_ you can see the topology rules which can be applied to a **line layer**:

* **end points must be covered by**:
* **must not have dangles**:
* **must not have duplicates**:
* **must not have invalid geometries**:
* **must not have multi-part geometries**:
* **must not have pseudos**:

On **polygon layers** the following rules are available:

* **must contain**:
* **must not have duplicates**:
* **must not have gaps**:
* **must not have invalid geometries**:
* **must not have multi-part geometries**:
* **must not overlap**:
* **must not overlap with**:

You can apply the following rules to **point layers**:

* **must be covered by**:
* **must be covered by endpoints of**:
* **must be inside**:
* **must not have duplicates**:
* **must not have invalid geometries**:
* **must not have multipart-geometries**:




