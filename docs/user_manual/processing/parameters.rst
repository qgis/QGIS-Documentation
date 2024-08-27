.. _processing_algs_input_output:

**************************************************
Input and output types for Processing Algorithms
**************************************************

Here is the list of input and output types that are supported in
Processing with their corresponding alg decorator constants,
their name in the modeler designer if exposed.


Input types
===========


.. list-table::
   :widths: 20 25 20 30
   :header-rows: 1
   :class: longtable

   * - Input name
     - Class
     - Alg constant
     - Description
   * - Annotation layer
     - :class:`QgsProcessingParameterAnnotationLayer <qgis.core.QgsProcessingParameterAnnotationLayer>`
     - ``alg.ANNOTATION_LAYER``
     - An annotation layer
   * - Authentication Configuration
     - :class:`QgsProcessingParameterAuthConfig <qgis.core.QgsProcessingParameterAuthConfig>`
     - ``alg.AUTH_CFG``
     - Allows users to select from available authentication configurations or
       create new authentication configurations
   * - Raster band
     - :class:`QgsProcessingParameterBand <qgis.core.QgsProcessingParameterBand>`
     - ``alg.BAND``
     - A band of a raster layer
   * - Boolean
     - :class:`QgsProcessingParameterBoolean <qgis.core.QgsProcessingParameterBoolean>`
     - ``alg.BOOL``
     - A boolean value
   * - Connection Name
     - :class:`QgsProcessingParameterProviderConnection <qgis.core.QgsProcessingParameterProviderConnection>`
     -
     - A selection from available registered connections for a particular data provider
   * - Color
     - :class:`QgsProcessingParameterColor <qgis.core.QgsProcessingParameterColor>`
     - ``alg.COLOR``
     - A color
   * - Coordinate Operation
     - :class:`QgsProcessingParameterCoordinateOperation <qgis.core.QgsProcessingParameterCoordinateOperation>`
     - ``alg.COORDINATE_OPERATION``
     - A coordinate operation (for CRS transformations)
   * - CRS
     - :class:`QgsProcessingParameterCrs <qgis.core.QgsProcessingParameterCrs>`
     - ``alg.CRS``
     - A Coordinate Reference System
   * - Database Schema
     - :class:`QgsProcessingParameterDatabaseSchema <qgis.core.QgsProcessingParameterDatabaseSchema>`
     - ``alg.DATABASE_SCHEMA``
     - A database schema
   * - Database Table
     - :class:`QgsProcessingParameterDatabaseTable <qgis.core.QgsProcessingParameterDatabaseTable>`
     - ``alg.DATABASE_TABLE``
     - A database table
   * - Date
     - :class:`ProcessingDateTimeParameterDataType.Date <qgis.core.Qgis.ProcessingDateTimeParameterDataType>`
     - ``alg.DATE``
     - A pure date
   * - Datetime
     - :class:`ProcessingDateTimeParameterDataType.DateTime <qgis.core.Qgis.ProcessingDateTimeParameterDataType>`
     - ``alg.DATETIME``
     - A datetime
   * - Distance
     - :class:`QgsProcessingParameterDistance <qgis.core.QgsProcessingParameterDistance>`
     - ``alg.DISTANCE``
     - A double numeric parameter for distance values
   * - DXF Layers
     - :class:`QgsProcessingParameterDxfLayers <qgis.core.QgsProcessingParameterDxfLayers>`
     -
     - A list of vector layers to export as DXF file
   * - Enum
     - :class:`QgsProcessingParameterEnum <qgis.core.QgsProcessingParameterEnum>`
     - ``alg.ENUM``
     - An enumeration, allowing for selection from a set of predefined values
   * - Expression
     - :class:`QgsProcessingParameterExpression <qgis.core.QgsProcessingParameterExpression>`
     - ``alg.EXPRESSION``
     - An expression
   * - Extent
     - :class:`QgsProcessingParameterExtent <qgis.core.QgsProcessingParameterExtent>`
     - ``alg.EXTENT``
     - A spatial extent defined by xmin, xmax, ymin, ymax
   * -
     - :class:`QgsProcessingParameterField <qgis.core.QgsProcessingParameterField>`
     - ``alg.FIELD``
     - A field in the attribute table of a vector layer
   * - Field Aggregates
     - :class:`QgsProcessingParameterAggregate <qgis.core.QgsProcessingParameterAggregate>`
     -
     - A parameter for “aggregate” configurations, which consist of a definition of desired output fields,
       types, and aggregate used to populate them
   * - Fields Mapper
     - :class:`QgsProcessingParameterFieldMapping <qgis.core.QgsProcessingParameterFieldMapping>`
     -
     - A parameter for “field mapping” configurations, which consist of a definition of desired output fields,
       types, and expressions used to populate them
   * - File/Folder
     - :class:`QgsProcessingParameterFile <qgis.core.QgsProcessingParameterFile>`
     - ``alg.FILE``
     - A filename of an existing file
   * -
     - :class:`QgsProcessingParameterFileDestination <qgis.core.QgsProcessingParameterFileDestination>`
     - ``alg.FILE_DEST``
     - A filename for a newly created output file
   * -
     - :class:`QgsProcessingParameterFolderDestination <qgis.core.QgsProcessingParameterFolderDestination>`
     - ``alg.FOLDER_DEST``
     - A folder (destination folder)
   * - Geometry
     - :class:`QgsProcessingParameterGeometry <qgis.core.QgsProcessingParameterGeometry>`
     - ``alg.GEOMETRY``
     - A geometry
   * -
     - :class:`ProcessingNumberParameterType.Integer <qgis.core.Qgis.ProcessingNumberParameterType>`
     - ``alg.INT``
     - An integer
   * - Print Layout
     - :class:`QgsProcessingParameterLayout <qgis.core.QgsProcessingParameterLayout>`
     - ``alg.LAYOUT``
     - A layout
   * - Print Layout Item
     - :class:`QgsProcessingParameterLayoutItem <qgis.core.QgsProcessingParameterLayoutItem>`
     - ``alg.LAYOUT_ITEM``
     - A layout item
   * - Map Layer
     - :class:`QgsProcessingParameterMapLayer <qgis.core.QgsProcessingParameterMapLayer>`
     - ``alg.MAPLAYER``
     - A map layer
   * - Map Theme
     - :class:`QgsProcessingParameterMapTheme <qgis.core.QgsProcessingParameterMapTheme>`
     - ``alg.MAP_THEME``
     - A project map theme
   * - Matrix
     - :class:`QgsProcessingParameterMatrix <qgis.core.QgsProcessingParameterMatrix>`
     - ``alg.MATRIX``
     - A matrix
   * - Mesh Dataset Groups
     - :class:`QgsProcessingParameterMeshDatasetGroups <qgis.core.QgsProcessingParameterMeshDatasetGroups>`
     -
     - Dataset groups of mesh layer
   * - Mesh Dataset Time
     - :class:`QgsProcessingParameterMeshDatasetTime <qgis.core.QgsProcessingParameterMeshDatasetTime>`
     - 
     - Dataset index from a mesh layer by time setting
   * - Mesh Layer
     - :class:`QgsProcessingParameterMeshLayer <qgis.core.QgsProcessingParameterMeshLayer>`
     - ``alg.MESH_LAYER``
     - A mesh layer
   * - Multiple Input
     - :class:`QgsProcessingParameterMultipleLayers <qgis.core.QgsProcessingParameterMultipleLayers>`
     - ``alg.MULTILAYER``
     - A set of layers
   * - Number
     - :class:`ProcessingNumberParameterType.Double <qgis.core.Qgis.ProcessingNumberParameterType>`
     - ``alg.NUMBER``
     - A numerical value
   * - Point
     - :class:`QgsProcessingParameterPoint <qgis.core.QgsProcessingParameterPoint>`
     - ``alg.POINT``
     - A point
   * - Point Cloud Attribute
     - :class:`QgsProcessingParameterPointCloudAttribute <qgis.core.QgsProcessingParameterPointCloudAttribute>`
     -
     - An attribute from a point cloud layer
   * -
     - :class:`QgsProcessingParameterPointCloudDestination <qgis.core.QgsProcessingParameterPointCloudDestination>`
     - ``alg.POINTCLOUD_LAYER_DEST``
     - A point cloud layer destination parameter, for specifying the destination path
       for a point cloud layer created by the algorithm
   * - Point Cloud Layer
     - :class:`QgsProcessingParameterPointCloudLayer <qgis.core.QgsProcessingParameterPointCloudLayer>`
     - ``alg.POINTCLOUD_LAYER``
     - A point cloud layer
   * -
     - :class:`QgsProcessingParameterProviderConnection <qgis.core.QgsProcessingParameterProviderConnection>`
     - ``alg.PROVIDER_CONNECTION``
     - An available connection for a database provider
   * - Range
     - :class:`QgsProcessingParameterRange <qgis.core.QgsProcessingParameterRange>`
     - ``alg.RANGE``
     - A number range
   * - Raster Layer
     - :class:`QgsProcessingParameterRasterLayer <qgis.core.QgsProcessingParameterRasterLayer>`
     - ``alg.RASTER_LAYER``
     - A raster layer
   * -
     - :class:`QgsProcessingParameterRasterDestination <qgis.core.QgsProcessingParameterRasterDestination>`
     - ``alg.RASTER_LAYER_DEST``
     - A raster layer destination parameter, for specifying the destination path
       for a raster layer created by the algorithm
   * - Scale
     - :class:`QgsProcessingParameterScale <qgis.core.QgsProcessingParameterScale>`
     - ``alg.SCALE``
     - A map scale
   * -
     - :class:`QgsProcessingParameterFeatureSink <qgis.core.QgsProcessingParameterFeatureSink>`
     - ``alg.SINK``
     - A feature sink
   * - String
     - :class:`QgsProcessingParameterString <qgis.core.QgsProcessingParameterString>`
     - ``alg.STRING``
     - A text string
   * - TIN Creation Layers
     - :class:`QgsProcessingParameterTinInputLayers <qgis.core.QgsProcessingParameterTinInputLayers>`
     -
     - Selection of multiple layers to create a TIN with vertices
       and/or break lines
   * - Time
     - :class:`ProcessingDateTimeParameterDataType.Time <qgis.core.Qgis.ProcessingDateTimeParameterDataType>`
     - ``alg.TIME``
     - A pure time
   * - Vector Features
     - :class:`QgsProcessingParameterFeatureSource <qgis.core.QgsProcessingParameterFeatureSource>`
     - ``alg.SOURCE``
     - A feature source
   * - Vector Layer
     - :class:`QgsProcessingParameterVectorLayer <qgis.core.QgsProcessingParameterVectorLayer>`
     - ``alg.VECTOR_LAYER``
     - A vector layer
   * -
     - :class:`QgsProcessingParameterVectorDestination <qgis.core.QgsProcessingParameterVectorDestination>`
     - ``alg.VECTOR_LAYER_DEST``
     - A vector layer destination parameter, for specifying the destination path
       for a vector layer created by the algorithm
   * - Vector Tile Writer Layers
     - :class:`QgsProcessingParameterVectorTileDestination <qgis.core.QgsProcessingParameterVectorTileDestination>`
     -
     - A vector tile layer destination parameter, for specifying the destination path
       for a vector tile layer created by the algorithm


Output types
============

.. list-table::
   :widths: 47 24 29
   :header-rows: 1
   :class: longtable

   * - Class
     - Alg constant
     - Description
   * - :class:`QgsProcessingOutputBoolean <qgis.core.QgsProcessingOutputBoolean>`
     - ``alg.BOOL``
     - A boolean value
   * - :class:`QgsProcessingOutputNumber <qgis.core.QgsProcessingOutputNumber>`
     - ``alg.DISTANCE``
     - A double numeric parameter for distance values
   * - :class:`QgsProcessingOutputFile <qgis.core.QgsProcessingOutputFile>`
     - ``alg.FILE``
     - A filename of an existing file
   * - :class:`QgsProcessingOutputFolder <qgis.core.QgsProcessingOutputFolder>`
     - ``alg.FOLDER``
     - A folder
   * - :class:`QgsProcessingOutputHtml <qgis.core.QgsProcessingOutputHtml>`
     - ``alg.HTML``
     - HTML
   * - :class:`QgsProcessingOutputNumber <qgis.core.QgsProcessingOutputNumber>`
     - ``alg.INT``
     - A integer
   * - :class:`QgsProcessingOutputLayerDefinition <qgis.core.QgsProcessingOutputLayerDefinition>`
     - ``alg.LAYERDEF``
     - A layer definition
   * - :class:`QgsProcessingOutputMapLayer <qgis.core.QgsProcessingOutputMapLayer>`
     - ``alg.MAPLAYER``
     - A map layer
   * - :class:`QgsProcessingOutputMultipleLayers <qgis.core.QgsProcessingOutputMultipleLayers>`
     - ``alg.MULTILAYER``
     - A set of layers
   * - :class:`QgsProcessingOutputNumber <qgis.core.QgsProcessingOutputNumber>`
     - ``alg.NUMBER``
     - A numerical value
   * - :class:`QgsProcessingOutputPointCloudLayer <qgis.core.QgsProcessingOutputPointCloudLayer>`
     - ``alg.POINTCLOUD_LAYER``
     - A point cloud layer
   * - :class:`QgsProcessingOutputRasterLayer <qgis.core.QgsProcessingOutputRasterLayer>`
     - ``alg.RASTER_LAYER``
     - A raster layer
   * - :class:`QgsProcessingOutputString <qgis.core.QgsProcessingOutputString>`
     - ``alg.STRING``
     - A text string
   * - :class:`QgsProcessingOutputVectorLayer <qgis.core.QgsProcessingOutputVectorLayer>`
     - ``alg.VECTOR_LAYER``
     - A vector layer
   * - :class:`QgsProcessingOutputVectorTileLayer <qgis.core.QgsProcessingOutputVectorTileLayer>`
     -
     - A vector tile layer

