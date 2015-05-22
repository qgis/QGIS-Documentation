|updatedisclaimer|

Feature extraction
==================

BinaryMorphologicalOperation (closing)
--------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Structuring Element Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ball

  Default: *0*

``The Structuring Element Radius`` [number]
  <put parameter description here>

  Default: *5*

``Morphological Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- closing

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:binarymorphologicaloperationclosing', -in, -channel, -ram, -structype, -structype.ball.xradius, -filter, -out)

See also
........

BinaryMorphologicalOperation (dilate)
-------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Structuring Element Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ball

  Default: *0*

``The Structuring Element Radius`` [number]
  <put parameter description here>

  Default: *5*

``Morphological Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- dilate

  Default: *0*

``Foreground Value`` [number]
  <put parameter description here>

  Default: *1*

``Background Value`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:binarymorphologicaloperationdilate', -in, -channel, -ram, -structype, -structype.ball.xradius, -filter, -filter.dilate.foreval, -filter.dilate.backval, -out)

See also
........

BinaryMorphologicalOperation (erode)
------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Structuring Element Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ball

  Default: *0*

``The Structuring Element Radius`` [number]
  <put parameter description here>

  Default: *5*

``Morphological Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- erode

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:binarymorphologicaloperationerode', -in, -channel, -ram, -structype, -structype.ball.xradius, -filter, -out)

See also
........

BinaryMorphologicalOperation (opening)
--------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Structuring Element Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ball

  Default: *0*

``The Structuring Element Radius`` [number]
  <put parameter description here>

  Default: *5*

``Morphological Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- opening

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:binarymorphologicaloperationopening', -in, -channel, -ram, -structype, -structype.ball.xradius, -filter, -out)

See also
........

EdgeExtraction (gradient)
-------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Edge feature`` [selection]
  <put parameter description here>

  Options:

  * 0 --- gradient

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:edgeextractiongradient', -in, -channel, -ram, -filter, -out)

See also
........

EdgeExtraction (sobel)
----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Edge feature`` [selection]
  <put parameter description here>

  Options:

  * 0 --- sobel

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:edgeextractionsobel', -in, -channel, -ram, -filter, -out)

See also
........

EdgeExtraction (touzi)
----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Edge feature`` [selection]
  <put parameter description here>

  Options:

  * 0 --- touzi

  Default: *0*

``The Radius`` [number]
  <put parameter description here>

  Default: *1*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:edgeextractiontouzi', -in, -channel, -ram, -filter, -filter.touzi.xradius, -out)

See also
........

GrayScaleMorphologicalOperation (closing)
-----------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Structuring Element Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ball

  Default: *0*

``The Structuring Element Radius`` [number]
  <put parameter description here>

  Default: *5*

``Morphological Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- closing

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:grayscalemorphologicaloperationclosing', -in, -channel, -ram, -structype, -structype.ball.xradius, -filter, -out)

See also
........

GrayScaleMorphologicalOperation (dilate)
----------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Structuring Element Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ball

  Default: *0*

``The Structuring Element Radius`` [number]
  <put parameter description here>

  Default: *5*

``Morphological Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- dilate

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:grayscalemorphologicaloperationdilate', -in, -channel, -ram, -structype, -structype.ball.xradius, -filter, -out)

See also
........

GrayScaleMorphologicalOperation (erode)
---------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Structuring Element Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ball

  Default: *0*

``The Structuring Element Radius`` [number]
  <put parameter description here>

  Default: *5*

``Morphological Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- erode

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:grayscalemorphologicaloperationerode', -in, -channel, -ram, -structype, -structype.ball.xradius, -filter, -out)

See also
........

GrayScaleMorphologicalOperation (opening)
-----------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Structuring Element Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ball

  Default: *0*

``The Structuring Element Radius`` [number]
  <put parameter description here>

  Default: *5*

``Morphological Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- opening

  Default: *0*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:grayscalemorphologicaloperationopening', -in, -channel, -ram, -structype, -structype.ball.xradius, -filter, -out)

See also
........

Haralick Texture Extraction
---------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``X Radius`` [number]
  <put parameter description here>

  Default: *2*

``Y Radius`` [number]
  <put parameter description here>

  Default: *2*

``X Offset`` [number]
  <put parameter description here>

  Default: *1*

``Y Offset`` [number]
  <put parameter description here>

  Default: *1*

``Image Minimum`` [number]
  <put parameter description here>

  Default: *0*

``Image Maximum`` [number]
  <put parameter description here>

  Default: *255*

``Histogram number of bin`` [number]
  <put parameter description here>

  Default: *8*

``Texture Set Selection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- simple
  * 1 --- advanced
  * 2 --- higher

  Default: *0*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:haralicktextureextraction', -in, -channel, -ram, -parameters.xrad, -parameters.yrad, -parameters.xoff, -parameters.yoff, -parameters.min, -parameters.max, -parameters.nbbin, -texture, -out)

See also
........

Line segment detection
----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``No rescaling in [0, 255]`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Output Detected lines`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:linesegmentdetection', -in, -norescale, -out)

See also
........

Local Statistic Extraction
--------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Neighborhood radius`` [number]
  <put parameter description here>

  Default: *3*

Outputs
.......

``Feature Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:localstatisticextraction', -in, -channel, -ram, -radius, -out)

See also
........

Multivariate alteration detector
--------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image 1`` [raster]
  <put parameter description here>

``Input Image 2`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Change Map`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:multivariatealterationdetector', -in1, -in2, -ram, -out)

See also
........

Radiometric Indices
-------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Blue Channel`` [number]
  <put parameter description here>

  Default: *1*

``Green Channel`` [number]
  <put parameter description here>

  Default: *1*

``Red Channel`` [number]
  <put parameter description here>

  Default: *1*

``NIR Channel`` [number]
  <put parameter description here>

  Default: *1*

``Mir Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available Radiometric Indices`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ndvi
  * 1 --- tndvi
  * 2 --- rvi
  * 3 --- savi
  * 4 --- tsavi
  * 5 --- msavi
  * 6 --- msavi2
  * 7 --- gemi
  * 8 --- ipvi
  * 9 --- ndwi
  * 10 --- ndwi2
  * 11 --- mndwi
  * 12 --- ndpi
  * 13 --- ndti
  * 14 --- ri
  * 15 --- ci
  * 16 --- bi
  * 17 --- bi2

  Default: *0*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:radiometricindices', -in, -ram, -channels.blue, -channels.green, -channels.red, -channels.nir, -channels.mir, -list, -out)

See also
........

