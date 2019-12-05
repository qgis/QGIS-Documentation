
  *Contain*
    Returns 1 (true) if and only if no points of b lie in the exterior of a,
    and at least one point of the interior of b lies in the interior of a.
    In the picture, no circle is selected, but the rectangle would be if you
    would select it the other way around, as it contains a circle completely.
    This is the opposite of *are within*.
    
  *Disjoint*
    Returns 1 (true) if the geometries do not share any portion of space (no overlap, not touching).
    Only circle 4 is selected.
    
  *Equal*
    Returns 1 (true) if and only if geometries are exactly the same.
    No circles will be selected.
    
  *Touch*
    Tests whether a geometry touches another. Returns 1 (true) if the geometries
    have at least one point in common, but their interiors do not intersect.
    Only circle 3 is selected.
      
  *Overlap*
    Tests whether a geometry overlaps another. Returns 1 (true) if the geometries
    share space, are of the same dimension, but are not completely contained by
    each other. Only circle 2 is selected.
    
  *Are within*
    Tests whether a geometry is within another. Returns 1 (true) if geometry a
    is completely inside geometry b. Only circle 1 is selected.
    
  *Cross*
    Returns 1 (true) if the supplied geometries have some, but not all, interior
    points in common and the actual crossing is of a lower dimension than the
    highest supplied geometry. For example, a line crossing a polygon will cross
    as a line (selected). Two lines crossing will cross as a point (selected).
    Two polygons cross as a polygon (not selected).

  Default: *Intersect*

**end_geometric_predicates**

.. The following section is included in database algorithms such as
 qgispostgisexecutesql, qgispostgisexecuteandloadsql
 
**postgisexecutesqlexample**

**Example**

#. Set all the values of an existing field to a fixed value. The SQL query string
   will be:

   .. code-block:: sql

    UPDATE your_table SET field_to_update=20;

   In the example above, the values of the field ``field_to_update`` of the table
   ``your_table`` will be all set to ``20``.

#. Create a new ``area`` column and calculate the area of each feature with the
   ``ST_AREA`` PostGIS function.

   .. code-block:: sql

    -- Create the new column "area" on the table your_table"
    ALTER TABLE your_table ADD COLUMN area double precision;
    -- Update the "area" column and calculate the area of each feature:
    UPDATE your_table SET area=ST_AREA(geom);

**end_postgisexecutesqlexample**
