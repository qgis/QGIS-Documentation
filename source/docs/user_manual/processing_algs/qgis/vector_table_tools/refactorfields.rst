Refactor fields
===============

Description
-----------

Refactor layer fields:

* Change field names and types.
* Add and remove fields.
* Reorder fields.
* Calculate new fields based on expressions.
* Load field list from another layer.

Parameters
----------

``Input layer`` [vector: any]
  Source layer.

``Fields mapping`` [fieldsmapping]
  Output fields definitions

Outputs
-------

``Output layer`` [vector]
  Destination layer

Console usage
-------------

::

  processing.runalg("qgis:refactorfields",
                    input,
                    [{'name': output_field_name,
                      'type': output_field_type,
                      'length': output_field_length,
                      'precision': output_field_precision,
                      'expression': expression_based_on_input_layer
                    }],
                    output)

See also
--------

