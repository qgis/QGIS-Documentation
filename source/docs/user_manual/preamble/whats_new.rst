|updatedisclaimer|

.. _qgis.documentation.whatsnew:

****************************
What's new in |qg| |CURRENT|
****************************

This release contains new features and extends the programmatic
interface over previous versions. We recommend that you use this version over
previous releases.

This release includes hundreds of bug fixes and many new features and
enhancements that will be described in this manual. You may also
review the visual changelog at
http://changelog.linfiniti.com/qgis/version/2.6.0/.

Application and Project Options 
-------------------------------

* **Project filename in properties**: You can now see the full path
  for the QGIS project file in the project properties dialog.


Data Providers 
--------------

* **DXF Export tool improvements**: 

  * Tree view and attribute selection for layer assigment in dialog 
  * support fill polygons/HATCH
  * represent texts as MTEXT instead of TEXT (including font, slant and weight)
  * support for RGB colors when there's no exact color match
  * use AutoCAD 2000 DXF (R15) instead of R12 


Map Composer 
------------
  
* **Update map canvas extent from map composer extent**:  On the Item 
   properties of a Map element there are now two extra buttons which allow you
   to (1) set the Map canvas extent according with the extent of your Map element
   and (2) view in Map canvas the extent currently set on your Map element.
   
* **Multiple grid support**: It is now possible to have more than 
  one grid in your Map element. Each grid is fully customizable and  
  can be assigned to a different CRS. This means, for example, you 
  can now have a map layout with both geographic and projected grids.
  
* **Selective export**: To every item of your map composer layout, under
  Rendering options, you may exclude that object from map exports.
   

QGIS Server 
-----------


Symbology 
---------


User Interface 
--------------



