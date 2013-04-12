
======================================================
Creating the Fundy Footpath Trail Map with Quantum GIS
======================================================

.. figure:: ./images/canada_brunswick1.jpg
   :alt: 
   :scale: 60%
   :align: left

The `Fundy Footpath <http://fundyfootpath.info/>`_  is a wilderness hiking trail located along the Fundy coast of New Brunswick, Canada. It is a charter member of the `UNESCO Fundy Biosphere Reserve <http://fundy-biosphere.ca/en/about-us/the-reserve>`_ and affiliated with the `NB Trails Council Inc. <http://www.sentiernbtrail.com/>`_ and the Trans Canada Trail. The Footpath takes hikers through the coastal Acadian Forest, home to the world’s highest tides, old growth forests, and several rare and unique types of flora and fauna.

The trail was created, is maintained, and promoted by a group of volunteers known as the Fundy Hiking Trail Association Inc. (FHTA)(1975). As a non-profit organization the FHTA raises funds for its activities through the sale of guidebooks that include a trail map. In 2011 I approached the FHTA to volunteer to update the official trail map. As a volunteer creating a map for a non-profit organization Quantum GIS (QGIS) fit the bill as both a tool for editing data and for final map layout. Through the efforts of myself and members of the FHTA the new official map of the Fundy Footpath included with the guidebook was created from start to finish with QGIS.

.. figure:: ./images/canada_brunswick2.jpg
   :alt: QGIS GPS Tools Plugin for data collection
   :scale: 60%
   :align: right

   QGIS GPS Tools Plugin for data collection

The Project
===========

The process of creating the new Fundy Footpath map with QGIS can be broken down into three different parts:

* Data collection.
* Data editing and preparation.
* Map production.

Data was collected both with handheld GPS units and from various free data sources. Trail data (e.g. trail centerline, campsite locations, and tidal crossings) was collected with a Garmin GPSMap 60CSX. This data was then transferred from the GPS and to shapefile format in QGIS using the GPS plugin. Free data in vector formats was then obtained from the `Natural Resources Canada (NRCan) CanVec <http://geogratis.cgdi.gc.ca/geogratis/en/product/search.do?id=5460AA9D-54CD-8349-C95E-1A4D03172FDF>`_ website and from `Service New Brunswick (SNB) online <http://www.snb.ca/gdam-igec/e/2900e_1.asp>`_.


.. figure:: ./images/canada_brunswick3.jpg
   :alt: Creation of the footpath map in QGIS
   :scale: 60%
   :align: right

   Creation of the footpath map in QGIS

To prepare the data for use in the final map product the following tools within QGIS were used to accomplish specific tasks:

* The data collected with GPS was cleaned using the editing toolbar.
* The vector data obtained from NRCan and SNB was merged together, queried, and clipped for the final map area using the vector tools.
* A comma-separated file obtained from SNB was imported to QGIS as a point layer using the Add Delimited Text Layer plugin, the Interpolation plugin was used to create an elevation raster that was then used to create a hillshade raster and elevation contour layer with the GDAL raster tools plugin.

.. figure:: ./images/canada_brunswick4.jpg
   :alt: Footpath map in the Print Composer
   :scale: 60%
   :align: right

   Footpath map in the Print Composer

Once the data required to create the map was assembled and in a usable format the creation of the final map was started. To create the hiking map data was symbolized and labeled with the symbolization properties dialog and labeled with QGIS’s very functional label engine. Once labels and symbolization were in place the map composer tool was run to create the layout. It was very easy to add useful map elements such as a custom north arrow and elevation profile in the print composer. Two layouts were created since it was to be a double-sided map. Once both layouts were created they were exported as PDF files and sent to the printers.

Conclusion
==========

The hiking map was printed on heavy-duty waterproof paper, folded and inserted in the back of the new edition of the Fundy Footpath Hiker’s Guide Book. Quantum GIS was the best and most functional choice for the creation of this map. Being free software the price was right for a volunteer creating a map for a non-profit organization. But the real advantage of QGIS was that it had all of the functionality and tools required to create a highly useful and detailed hiking map from start to finish. I would highly recommend QGIS to both experienced and beginning GIS users alike.

.. figure:: ./images/canada_brunswick5.jpg
   :alt: The final Fundy Footpath map with accompanying guidebook
   :scale: 60%
   :align: right

   The final Fundy Footpath map with accompanying guidebook

Author
======

.. figure:: ./images/canada_brunswickaut.jpg
   :alt: The final Fundy Footpath map with accompanying guidebook
   :height: 200
   :align: left

This article was contributed by Jarrett Totton in January 2013. Jarrett is a GIS Technologist living in Alberta, Canada.

Websites:
=========

* http://fundyfootpath.info/
* http://fundy-biosphere.ca/en/about-us/the-reserve
* http://www.sentiernbtrail.com
* http://geogratis.cgdi.gc.ca/geogratis/en/product/search.do?id=5460AA9D-54CD-8349-C95E-1A4D03172FDF
* http://www.snb.ca/gdam-igec/e/2900e_1.asp