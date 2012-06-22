.. %  !TeX  root  =  user_guide.tex 

.. _`dxf2shape`:

Dxf2Shp Converter Plugin
=========================================


.. % when the revision of a section has been finalized, 
   % comment out the following line:
   % \updatedisclaimer

The dxf2shape converter plugin can be used to convert vector data from DXF to Shapefile 
format. It requires the following parameters to be specified before running:



*  **Input DXF file**: Enter path to the DXF file to be converted
*  **Output Shp file**: Enter desired name of the Shapefile to be created
*  **Output file type**: Specify the geometry type of the output Shapefile. 
Currently supported types are polyline, polygon, and point.
*  **Export text labels**: When this checkbox is enabled, an additional Shapefile point layer will be created, and the associated dbf table will contain information about the "TEXT" fields found in the dxf file, and the text strings themselves.



\begin{figure}[ht]
   \centering
   \includegraphics[clip=true, width=12cm]{dxf2shape_dialog}   
   \caption{Dxf2Shape Converter Plugin \nixcaption}\label{fig:dxf2shape_dialog}
\end{figure}

Using the Plugin
~~~~~~~~~~~~~~~~

  #.  Start QGIS, load the Dxf2Shape plugin in the Plugin Manager (see Section 
  :ref:`load_core_plugin`) and click on the |dxf2shp_converter| :guilabel:`Dxf2Shape Converter` 
  icon which appears in the QGIS toolbar menu. The Dxf2Shape plugin dialog appears as shown in Figure \ref{fig:dxf2shape_dialog}.
  #.  Enter input DXF file, a name for the output Shapefile and the Shapefile type.
  #.  Enable the |checkbox| :guilabel:`Export text labels` checkbox if you want to create an extra point layer with labels.
  #.  Click :guilabel:`OK`. 




