:orphan:

.. _expression_function_Maps_from_json:

from_json
.........

Loads a JSON formatted string.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - from_json(string)

   * - Arguments
     - * **string** - JSON string

   * - Examples
     - * from_json('{"qgis":"rocks"}') → { "qgis" : "rocks" }

       * from_json('[1,2,3]') → [1,2,3]


.. _expression_function_Maps_hstore_to_map:

hstore_to_map
.............

Creates a map from a hstore-formatted string.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - hstore_to_map(string)

   * - Arguments
     - * **string** - the input string

   * - Examples
     - * hstore_to_map('qgis=>rocks') → { "qgis" : "rocks" }


.. _expression_function_Maps_json_to_map:

json_to_map
...........

Creates a map from a json-formatted string.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - json_to_map(string)

   * - Arguments
     - * **string** - the input string

   * - Examples
     - * json_to_map('{"qgis":"rocks"}') → { "qgis" : "rocks" }


.. _expression_function_Maps_map:

map
...

Returns a map containing all the keys and values passed as pair of parameters.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map(key1, value1, key2, value2, ...)

   * - Arguments
     - * **key** - a key (string)

       * **value** - a value

   * - Examples
     - * map('1','one','2', 'two') → { '1': 'one', '2': 'two' }


.. _expression_function_Maps_map_akeys:

map_akeys
.........

Returns all the keys of a map as an array.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map_akeys(map)

   * - Arguments
     - * **map** - a map

   * - Examples
     - * map_akeys(map('1','one','2','two')) → [ '1', '2' ]


.. _expression_function_Maps_map_avals:

map_avals
.........

Returns all the values of a map as an array.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map_avals(map)

   * - Arguments
     - * **map** - a map

   * - Examples
     - * map_avals(map('1','one','2','two')) → [ 'one', 'two' ]


.. _expression_function_Maps_map_concat:

map_concat
..........

Returns a map containing all the entries of the given maps. If two maps contain the same key, the value of the second map is taken.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map_concat(map1, map2, ...)

   * - Arguments
     - * **map** - a map

   * - Examples
     - * map_concat(map('1','one', '2','overridden'),map('2','two', '3','three')) → { '1': 'one, '2': 'two', '3': 'three' }


.. _expression_function_Maps_map_delete:

map_delete
..........

Returns a map with the given key and its corresponding value deleted.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map_delete(map, key)

   * - Arguments
     - * **map** - a map

       * **key** - the key to delete

   * - Examples
     - * map_delete(map('1','one','2','two'),'2') → { '1': 'one' }


.. _expression_function_Maps_map_exist:

map_exist
.........

Returns true if the given key exists in the map.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map_exist(map, key)

   * - Arguments
     - * **map** - a map

       * **key** - the key to lookup

   * - Examples
     - * map_exist(map('1','one','2','two'),'3') → false


.. _expression_function_Maps_map_get:

map_get
.......

Returns the value of a map, given it's key.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map_get(map, key)

   * - Arguments
     - * **map** - a map

       * **key** - the key to lookup

   * - Examples
     - * map_get(map('1','one','2','two'),'2') → 'two'


.. _expression_function_Maps_map_insert:

map_insert
..........

Returns a map with an added key/value.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map_insert(map, key, value)

   * - Arguments
     - * **map** - a map

       * **key** - the key to add

       * **value** - the value to add

   * - Examples
     - * map_insert(map('1','one'),'3','three') → { '1': 'one', '3': 'three' }


.. _expression_function_Maps_map_to_hstore:

map_to_hstore
.............

Merge map elements into a hstore-formatted string.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map_to_hstore(map)

   * - Arguments
     - * **map** - the input map

   * - Examples
     - * map_to_hstore(map('qgis','rocks')) → "qgis"=>"rocks"}


.. _expression_function_Maps_map_to_json:

map_to_json
...........

Merge map elements into a json-formatted string.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - map_to_json(map)

   * - Arguments
     - * **map** - the input map

   * - Examples
     - * map_to_json(map('qgis','rocks')) → {"qgis":"rocks"}


.. _expression_function_Maps_to_json:

to_json
.......

Create a JSON formatted string from a map, array or other value.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_json(value)

   * - Arguments
     - * **value** - The input value

   * - Examples
     - * to_json(map('qgis','rocks')) → {"qgis":"rocks"}

       * to_json(array(1,2,3)) → [1,2,3]


