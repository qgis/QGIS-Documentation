:orphan:

.. _expression_function_Conversions_from_base64:

from_base64
...........

Decodes a string in the Base64 encoding into a binary value.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - from_base64(string)

   * - Arguments
     - * **string** - the string to decode

   * - Examples
     - * from_base64('UUdJUw==') → 'QGIS'


.. _expression_function_Conversions_hash:

hash
....

Creates a hash from a string with a given method. One byte (8 bits) is represented with two hex ''digits'', so md4 (16 bytes) produces a 16 * 2 = 32 character long hex string and keccak_512 (64 bytes) produces a 64 * 2 = 128 character long hex string.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - hash(string, method)

   * - Arguments
     - * **string** - the string to hash

       * **method** - The hash method among 'md4', 'md5', 'sha1', 'sha224', 'sha384', 'sha512', 'sha3_224', 'sha3_256', 'sha3_384', 'sha3_512', 'keccak_224', 'keccak_256', 'keccak_384', 'keccak_512'

   * - Examples
     - * hash('QGIS', md4) → 'c0fc71c241cdebb6e888cbac0e2b68eb'

       * hash('QGIS', md5) → '57470aaa9e22adaefac7f5f342f1c6da'

       * hash('QGIS', sha1) → 'f87cfb2b74cdd5867db913237024e7001e62b114'

       * hash('QGIS', sha224) → '4093a619ada631c770f44bc643ead18fb393b93d6a6af1861fcfece0'

       * hash('QGIS', sha256) → 'eb045cba7a797aaa06ac58830846e40c8e8c780bc0676d3393605fae50c05309'

       * hash('QGIS', sha384) → '91c1de038cc3d09fdd512e99f9dd9922efadc39ed21d3922e69a4305cc25506033aee388e554b78714c8734f9cd7e610'

       * hash('QGIS', sha512) → 'c2c092f2ab743bf8edbeb6d028a745f30fc720408465ed369421f0a4e20fa5e27f0c90ad72d3f1d836eaa5d25cd39897d4cf77e19984668ef58da6e3159f18ac'

       * hash('QGIS', sha3_224) → '467f49a5039e7280d5d42fd433e80d203439e338eaabd701f0d6c17d'

       * hash('QGIS', sha3_256) → '540f7354b6b8a6e735f2845250f15f4f3ba4f666c55574d9e9354575de0e980f'

       * hash('QGIS', sha3_384) → '96052da1e77679e9a65f60d7ead961b287977823144786386eb43647b0901fd8516fa6f1b9d243fb3f28775e6dde6107'

       * hash('QGIS', sha3_512) → '900d079dc69761da113980253aa8ac0414a8bd6d09879a916228f8743707c4758051c98445d6b8945ec854ff90655005e02aceb0a2ffc6a0ebf818745d665349'

       * hash('QGIS', keccak_224) → '5b0ce6acef8b0a121d4ac4f3eaa8503c799ad4e26a3392d1fb201478'

       * hash('QGIS', keccak_256) → '991c520aa6815392de24087f61b2ae0fd56abbfeee4a8ca019c1011d327c577e'

       * hash('QGIS', keccak_384) → 'c57a3aed9d856fa04e5eeee9b62b6e027cca81ba574116d3cc1f0d48a1ef9e5886ff463ea8d0fac772ee473bf92f810d'

       * keccak_512('QGIS') → '6f0f751776b505e317de222508fa5d3ed7099d8f07c74fed54ccee6e7cdc6b89b4a085e309f2ee5210c9'


.. _expression_function_Conversions_md5:

md5
...

Creates a md5 hash from a string.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - md5(string)

   * - Arguments
     - * **string** - the string to hash

   * - Examples
     - * md5('QGIS') → '57470aaa9e22adaefac7f5f342f1c6da'


.. _expression_function_Conversions_sha256:

sha256
......

Creates a sha256 hash from a string.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - sha256(string)

   * - Arguments
     - * **string** - the string to hash

   * - Examples
     - * sha256('QGIS') → 'eb045cba7a797aaa06ac58830846e40c8e8c780bc0676d3393605fae50c05309'


.. _expression_function_Conversions_to_base64:

to_base64
.........

Encodes a binary value into a string, using the Base64 encoding.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_base64(value)

   * - Arguments
     - * **value** - the binary value to encode

   * - Examples
     - * to_base64('QGIS') → 'UUdJUw=='


.. _expression_function_Conversions_to_date:

to_date
.......

Converts a string into a date object. An optional format string can be provided to parse the string; see <a href='https://doc.qt.io/qt-5/qdate.html#fromString-1'>QDate::fromString</a> for additional documentation on the format.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_date(string, format, language)

   * - Arguments
     - * **string** - string representing a date value

       * **format** - format used to convert the string into a date

       * **language** - language (lowercase, two- or three-letter, ISO 639 language code) used to convert the string into a date

   * - Examples
     - * to_date('2012-05-04') → 2012-05-04

       * to_date('June 29, 2019','MMMM d, yyyy') → 2019-06-29

       * to_date('29 juin, 2019','d MMMM, yyyy','fr') → 2019-06-29


.. _expression_function_Conversions_to_datetime:

to_datetime
...........

Converts a string into a datetime object. An optional format string can be provided to parse the string; see <a href='https://doc.qt.io/qt-5/qdatetime.html#fromString-1'>QDateTime::fromString</a> for additional documentation on the format.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_datetime(string, format, language)

   * - Arguments
     - * **string** - string representing a datetime value

       * **format** - format used to convert the string into a datetime

       * **language** - language (lowercase, two- or three-letter, ISO 639 language code) used to convert the string into a datetime

   * - Examples
     - * to_datetime('2012-05-04 12:50:00') → 2012-05-04T12:50:00

       * to_datetime('June 29, 2019 @ 12:34','MMMM d, yyyy @ HH:mm') → 2019-06-29T12:34

       * to_datetime('29 juin, 2019 @ 12:34','d MMMM, yyyy @ HH:mm','fr') → 2019-06-29T12:34


.. _expression_function_Conversions_to_dm:

to_dm
.....

Convert a coordinate to degree, minute.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_dm(coordinate, axis, precision, formatting)

   * - Arguments
     - * **coordinate** - A latitude or longitude value.

       * **axis** - The axis of the coordinate. Either 'x' or 'y'.

       * **precision** - Number of decimals.

       * **formatting** - Designates the formatting type. Acceptable values are NULL, 'aligned' or 'suffix'.

   * - Examples
     - * to_dm(6.3545681, 'x', 3) → 6°21.274′

       * to_dm(6.3545681, 'y', 4, 'suffix') → 6°21.2741′N


.. _expression_function_Conversions_to_dms:

to_dms
......

Convert a coordinate to degree, minute, second.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_dms(coordinate, axis, precision, formatting)

   * - Arguments
     - * **coordinate** - A latitude or longitude value.

       * **axis** - The axis of the coordinate. Either 'x' or 'y'.

       * **precision** - Number of decimals.

       * **formatting** - Designates the formatting type. Acceptable values are NULL, 'aligned' or 'suffix'.

   * - Examples
     - * to_dms(6.3545681, 'x', 3) → 6°21′16.445″

       * to_dms(6.3545681, 'y', 4, 'suffix') → 6°21′16.4452″N


.. _expression_function_Conversions_to_int:

to_int
......

Converts a string to integer number. Nothing is returned if a value cannot be converted to integer (e.g '123asd' is invalid).

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_int(string)

   * - Arguments
     - * **string** - string to convert to integer number

   * - Examples
     - * to_int('123') → 123


.. _expression_function_Conversions_to_interval:

to_interval
...........

Converts a string to a interval type. Can be used to take days, hours, month, etc of a date.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_interval(string)

   * - Arguments
     - * **string** - a string representing an interval. Allowable formats include {n} days {n} hours {n} months.

   * - Examples
     - * to_datetime('2012-05-05 12:00:00') - to_interval('1 day 2 hours') → 2012-05-04T10:00:00


.. _expression_function_Conversions_to_real:

to_real
.......

Converts a string to a real number. Nothing is returned if a value cannot be converted to real (e.g '123.56asd' is invalid).  Numbers are rounded after saving changes if the precision is smaller than the result of the conversion.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_real(string)

   * - Arguments
     - * **string** - string to convert to real number

   * - Examples
     - * to_real('123.45') → 123.45


.. _expression_function_Conversions_to_string:

to_string
.........

Converts a number to string.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_string(number)

   * - Arguments
     - * **number** - Integer or real value. The number to convert to string.

   * - Examples
     - * to_string(123) → '123'


.. _expression_function_Conversions_to_time:

to_time
.......

Converts a string into a time object. An optional format string can be provided to parse the string; see <a href='https://doc.qt.io/qt-5/qtime.html#fromString-1'>QTime::fromString</a> for additional documentation on the format.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - to_time(string, format, language)

   * - Arguments
     - * **string** - string representing a time value

       * **format** - format used to convert the string into a time

       * **language** - language (lowercase, two- or three-letter, ISO 639 language code) used to convert the string into a time

   * - Examples
     - * to_time('12:30:01') → 12:30:01

       * to_time('12:34','HH:mm') → 12:34:00

       * to_time('12:34','HH:mm','fr') → 12:34:00


