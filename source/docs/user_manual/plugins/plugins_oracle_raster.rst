|updatedisclaimer|

.. _oracle_raster:

Oracle Spatial GeoRaster Plugin
===============================

In Oracle databases, raster data can be stored in SDO_GEORASTER objects available
with the Oracle Spatial extension. In |qg|, the |oracle_raster|
:sup:`Oracle Spatial GeoRaster` plugin is supported by GDAL and depends on Oracle's
database product being installed and working on your machine. While Oracle is
proprietary software, they provide their software free for development and testing
purposes. Here is one simple example of how to load raster images to GeoRaster:

::

  $ gdal_translate -of georaster input_file.tif geor:scott/tiger@orcl


This will load the raster into the default GDAL\_IMPORT table, as a column named
``RASTER``.

Managing connections
--------------------

Firstly, the Oracle GeoRaster Plugin must be enabled using the Plugin Manager
(see :ref:`managing_plugins`). The first time you load a GeoRaster in
|qg|, you must create a connection to the Oracle database that contains the data.
To do this, begin by clicking on the |oracle_raster| :sup:`Add Oracle GeoRaster Layer`
toolbar button -- this will open the :guilabel:`Select Oracle Spatial GeoRaster`
dialog window. Click on **[New]** to open the dialog window, and specify
the connection parameters (See Figure_oracle_raster_1_):

* **Name**: Enter a name for the database connection.
* **Database instance**: Enter the name of the database that you will connect to.
* **Username**: Specify your own username that you will use to access the database.
* **Password**: Provide the password associated with your username that is required to
  access the database.

.. _Figure_oracle_raster_1:

.. only:: html

   **Figure Oracle Raster 1:**

.. figure:: /static/user_manual/plugins/oracle_create_dialog.png
   :align: center

   Create Oracle connection dialog

Now, back on the main :guilabel:`Oracle Spatial GeoRaster` dialog window
(see Figure_oracle_raster_2_), use the drop-down list to choose one connection,
and use the **[Connect]** button to establish a connection. You may also
**[Edit]** the connection by opening the previous dialog and making changes to
the connection information, or use the **[Delete]** button to remove the
connection from the drop-down list.

Selecting a GeoRaster
---------------------

Once a connection has been established, the subdatasets window will show the
names of all the tables that contain GeoRaster columns in that database in the
format of a GDAL subdataset name.

Click on one of the listed subdatasets and then click on **[Select]** to choose
the table name. Now another list of subdatasets will show with the names of
GeoRaster columns on that table. This is usually a short list, since most users
will not have more than one or two GeoRaster columns on the same table.

Click on one of the listed subdatasets and then click on **[Select]** to choose
one of the table/column combinations. The dialog will now show all the rows
that contain GeoRaster objects. Note that the subdataset list will now show the
Raster Data Table and Raster Id pairs.

At any time, the selection entry can be edited in order to go directly to a known
GeoRaster or to go back to the beginning and select another table name.

.. _Figure_oracle_raster_2:

.. only:: html

   **Figure Oracle Raster 2:**

.. figure:: /static/user_manual/plugins/oracle_select_dialog.png
   :align: center

   Select Oracle GeoRaster dialog


The selection data entry can also be used to enter a ``WHERE`` clause at the end of
the identification string (e.g., ``geor:scott/tiger@orcl,gdal_import,raster,geoid=``).
See http://www.gdal.org/frmt_georaster.html for more information.

Displaying GeoRaster
--------------------

Finally, by selecting a GeoRaster from the list of Raster Data Tables and Raster
Ids, the raster image will be loaded into |qg|.

The :guilabel:`Select Oracle Spatial GeoRaster` dialog can be closed now and the next
time it opens, it will keep the same connection and will show the same previous
list of subdatasets, making it very easy to open up another image from the same
context.

.. note::

   GeoRasters that contain pyramids will display much faster, but the pyramids
   need to be generated outside of |qg| using Oracle PL/SQL or gdaladdo.

The following is an example using ``gdaladdo``:

::

   gdaladdo georaster:scott/tiger@orcl,georaster\_table,georaster,georid=6 -r
   nearest 2 4 6 8 16 32


This is an example using PL/SQL:

::

   $ sqlplus scott/tiger
   SQL> DECLARE
    gr sdo_georaster;
   BEGIN
       SELECT image INTO gr FROM cities WHERE id = 1 FOR UPDATE;
       sdo_geor.generatePyramid(gr, 'rLevel=5, resampling=NN');
       UPDATE cities SET image = gr WHERE id = 1;
       COMMIT;
   END;
