.. comment out this disclaimer (by putting '.. ' in front of it) if file is uptodate with release

.. |updatedisclaimer|

.. label_forward:

*********
Foreword
*********

Welcome to the wonderful world of Geographical Information Systems (GIS)!

Quantum GIS (QGIS) is an Open Source Geographic Information System. The project
was born in May of 2002 and was established as a project on SourceForge in June
of the same year. We've worked hard to make GIS software (which is traditionally
expensive proprietary software) a viable prospect for anyone with basic access
to a Personal Computer. QGIS currently runs on most Unix platforms, Windows, and
OS X. QGIS is developed using the Qt toolkit (http://qt.digia.com)
and C++. This means that QGIS feels snappy to use and has a pleasing,
easy-to-use graphical user interface (GUI).

QGIS aims to be an easy-to-use GIS, providing common functions and features.
The initial goal was to provide a GIS data viewer. QGIS has reached the point
in its evolution where it is being used by many for their daily GIS data viewing
needs. QGIS supports a number of raster and vector data formats, with new
format support easily added using the plugin architecture.

QGIS is released under the GNU General Public License (GPL). Developing QGIS
under this license means that you can inspect and modify the source code,
and guarantees that you, our happy user, will always have access to a GIS
program that is free of cost and can be freely modified. You should have
received a full copy of the license with your copy of QGIS, and you also can
find it in Appendix :ref:`gpl_appendix`.

.. index:: documentation

.. tip::
        **Up-to-date Documentation**
        The latest version of this document can always be found in the documentation
        area of the QGIS website at http://documentation.qgis.org

.. `label_intro`:

Introduction To GIS
===================

A Geographical Information System (GIS) (Mitchell 2005 :ref:`literature_and_web`)
is a collection of software that allows you to create, visualize, query and
analyze geospatial data. Geospatial data refers to information about the
geographic location of an entity. This often involves the use of a
geographic coordinate, like a latitude or longitude value. Spatial data is
another commonly used term, as are: geographic data, GIS data, map data,
location data, coordinate data and spatial geometry data.

Applications using geospatial data perform a variety of functions. Map
production is the most easily understood function of geospatial
applications. Mapping programs take geospatial data and render it in a form
that is viewable, usually on a computer screen or printed page.
Applications can present static maps (a simple image) or dynamic maps that
are customised by the person viewing the map through a desktop program or a
web page.

Many people mistakenly assume that geospatial applications just produce
maps, but geospatial data analysis is another primary function of
geospatial applications. Some typical types of analysis include computing:


#.  distances between geographic locations
#.  the amount of area (e.g., square meters) within a certain geographic region
#.  what geographic features overlap other features
#.  the amount of overlap between features
#.  the number of locations within a certain distance of another
#.  and so on...

These may seem simplistic, but can be applied in all sorts of ways across
many disciplines. The results of analysis may be shown on a map, but are
often tabulated into a report to support management decisions.

The recent phenomena of location-based services promises to introduce all
sorts of other features, but many will be based on a combination of maps
and analysis. For example, you have a cell phone that tracks your
geographic location. If you have the right software, your phone can tell
you what kind of restaurants are within walking distance. While this is a
novel application of geospatial technology, it is essentially doing
geospatial data analysis and listing the results for you.

.. `label_whynew`:

Why is all this so new?
-----------------------

Well, it's not. There are many new hardware devices that are enabling
mobile geospatial services. Many open source geospatial applications are
also available, but the existence of geospatially focused hardware and
software is nothing new. Global positioning system (GPS) receivers are
becoming commonplace, but have been used in various industries for more
than a decade. Likewise, desktop mapping and analysis tools have also been
a major commercial market, primarily focused on industries such as natural
resource management.

What is new is how the latest hardware and software is being applied and
who is applying it. Traditional users of mapping and analysis tools were
highly trained GIS Analysts or digital mapping technicians trained to use
CAD-like tools. Now, the processing capabilities of home PCs and open
source software (OSS) packages have enabled an army of hobbyists, professionals,
web developers, etc. to interact with geospatial data. The learning curve
has come down. The costs have come down. The amount of geospatial
technology saturation has increased.

How is geospatial data stored? In a nutshell, there are two types of
geospatial data in widespread use today. This is in addition to
traditional tabular data that is also widely used by geospatial
applications.

.. `label_rasterdata`:

Raster Data
-----------

One type of geospatial data is called raster data or simply "a raster". The
most easily recognised form of raster data is digital satellite imagery or
air photos. Elevation shading or digital elevation models are also
typically represented as raster data. Any type of map feature can be
represented as raster data, but there are limitations.

A raster is a regular grid made up of cells, or in the case of imagery,
pixels. They have a fixed number of rows and columns. Each cell has a
numeric value and has a certain geographic size (e.g. 30x30 meters in
size).

Multiple overlapping rasters are used to represent images using more than
one colour value (i.e. one raster for each set of red, green and blue
values is combined to create a colour image). Satellite imagery also
represents data in multiple "bands". Each band is essentially a separate,
spatially overlapping raster, where each band holds values of certain
wavelengths of light. As you can imagine, a large raster takes up more file
space.

A raster with smaller cells can provide more detail, but takes up
more file space. The trick is finding the right balance between cell size
for storage purposes and cell size for analytical or mapping purposes.

.. `label_vectordata`:

Vector Data
------------

Vector data is also used in geospatial applications. If you stayed awake
during trigonometry and coordinate geometry classes, you will already be
familiar with some of the qualities of vector data. In its simplest sense,
vectors are a way of describing a location by using a set of coordinates.
Each coordinate refers to a geographic location using a system of x and y
values.

This can be thought of in reference to a Cartesian plane - you know, the
diagrams from school that showed an x and y-axis. You might have used them
to chart declining retirement savings or increasing compound mortgage
interest, but the concepts are essential to geospatial data analysis and
mapping.

There are various ways of representing these geographic coordinates
depending on your purpose. This is a whole area of study for another day -
map projections.

Vector data takes on three forms, each progressively more complex and
building on the former.

#. Points - A single coordinate (x y) represents a discrete geographic location
#. Lines - Multiple coordinates (x1 y1, x2 y2, x3 y4, ... xn yn) strung
   together in a certain order, like drawing a line from Point (x1 y1)
   to Point (x2 y2) and so on. These parts between each point are considered
   line segments. They have a length and the line can be said to have a
   direction based on the order of the points. Technically, a line is a
   single pair of coordinates connected together, whereas a line string
   is multiple lines connected together.
#. Polygons - When lines are strung together by more than two points,
   with the last point being at the same location as the first, we call
   this a polygon. A triangle, circle, rectangle, etc. are all polygons.
   The key feature of polygons is that there is a fixed area within them.
