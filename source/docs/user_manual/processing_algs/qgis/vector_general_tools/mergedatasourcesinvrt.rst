Merge datasources in VRT
========================

Description
-----------

This algorithm merge the layers of different data sources in a single vrt file
This algo is expecially useful in case an algo need multiple layers but accept only one vrt in wich the layers are specified

Parameters
----------

``Input datasources`` [multipleinput: any vectors]
  Input datasources to merge in a single VRT
  input_datasources is a single string with all path ";" separated as "path1;path2;....;pathN"

``Overwrite output vrt`` [boolean]
  Overwrite VRT if it's already exist

  Default: *False*

Outputs
-------

``Output vrt filename`` [file]
  VRT output filename

``Output vrt string`` [string]
  VRT content retured as string

Console usage
-------------

::

  processing.runalg('qgis:mergedatasourcesinvrt', input_datasources, input_overwrite_flag, output_vrt_file)

See also
--------

