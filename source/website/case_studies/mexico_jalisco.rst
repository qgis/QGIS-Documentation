
=======================================================================
Working with QGIS in a spatial data infrastructure of Jalisco in Mexico
=======================================================================

The Instituto de Información Territorial del Estado de Jalisco is a government organization which was founded in 1998 to share geographical information between the government agencies of Jalisco in México.
 
.. figure:: ./images/mexico_jalisco1.jpg
   :alt: Exploring the data with its online viewer
   :scale: 60%
   :align: right

   Exploring the data with its online viewer

Within the years, the institution has gathered loads of information in several formats such as SHP, DWG, DXF, GeoTIFF and ECW, among others. So, what we wanted was to have all this information available, organized and in a common format with the purpose of being able to provide and display it over the Internet.

.. figure:: ./images/mexico_jalisco2.jpg
   :alt: Connecting to the Spatial Data Infrastructure with WMS
   :scale: 60%
   :align: right

   Connecting to the Spatial Data Infrastructure with WMS

That's how it was developed the Sistema de Información Territorial Estatal en Línea, with the main target to build a spatial data infrastructure which allows our government agencies to share this kind of information to be included in their own projects as health, security or mobility.
 
Decision for QGIS
=================

I decided to use Mapserver and PostgreSQL with PostGIS extension to be able to deliver our satellite imagery, orthopothos, digital elevation models and vector information with Web Map Services, thinking that any application will consume our services. But the problem was that many of the commercial and free applications don’t work with OGC standards, specially with WFS. After exploring many geographic information systems, I realized that QGIS was the only one which 
can connect to WMS, WCS and WFS successfully.

What we use QGIS for
====================

Internally, we use QGIS to check the raster and vector data of the agencies before publishing it, and after its integration, we used it again to test the Web services that we’ve created. Also, we have done many spatial analysis with QGIS pulling the data directly from our PostgreSQL spatial database, then, we export the results as shape files.

.. figure:: ./images/mexico_jalisco3.jpg
   :alt: Connecting to the Spatial Data Infrastructure with WFS
   :scale: 60%
   :align: right

   Connecting to the Spatial Data Infrastructure with WFS

We’re encouraging our users to download QGIS and link directly with our Sistema de Información Territorial Estatal en Línea, mainly because it fully supports OGC standards and has many interesting features like geoprocessing tools, which allow them to make analysis of their interest, and all this absolutely for free.
 
Conclusion
==========

This project understood as the technological component of a Spatial Data Infrastructure, has been considered as a PostGIS case study, and I have to say that working with open source in all of our system’s cycle, has been satisfactory and trustworthy, the best choice that we have found to share our geographic information.

Author
======

.. figure:: ./images/mexico_jaliscoaut.jpg
   :alt: Carlos Ruiz
   :height: 200
   :align: left

   Carlos Ruiz

This article was contributed in July 2010 by IC Carlos Ruiz. He works as project's coordinator at the Instituto de Información Territorial del Estado de Jalisco, Mexico.