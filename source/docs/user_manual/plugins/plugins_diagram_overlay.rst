.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _diagram_overlay:

Diagram Overlay Plugin
=======================

|diagram| The :guilabel:`Diagram Overlay` Plugin allows you to add a graphic overlay to a vector layer 
(see figure_overlay_1_). It provides additional and not yet implemented features to the 
``Diagrams`` tab, described in secion :ref:`sec_diagram`. 

Before starting, the :guilabel:`Diagram Overlay` Plugin needs to be activated using 
the Plugin Manager (see Section :ref:`load_core_plugin`). It will then appear as 
:guilabel:`Overlay` tab in the :guilabel:`Layer Properties` dialog next to the 
:guilabel:`Diagrams` tab. 

.. _figure_overlay_1:

.. only:: html

   **Figure Overlay 1:** 

.. figure:: /static/user_manual/plugins/overlay_tab1.png
   :width: 25em
   :align: center

   Vector properties dialog with overlay tab |nix|

The :guilabel:`Overlay` tab provides support for Pie charts, Bar charts and 
proportional SVG symbols.

Similar to the :guilabel:`Diagrams` tab, we will demonstrate an example and 
overlay the alaska boundary layer a piechart diagram showing some temperature 
data from a climate vector layer. Both vector layers are part of the |qg| 
sample dataset (see Section :ref:`label_sampledata`).

#.  First click on the |mActionAddOgrLayer| :sup:`Load Vector` icon, browse 
    to the |qg| sample dataset folder and load the two vector shape layers 
    :file:`alaska.shp` and :file:`climate.shp`.
#.  Double click the ``climate`` layer in the map legend to open the 
    :guilabel:`Layer Properties` dialog.
#.  Click on the :guilabel:`Overlay` tab, activate |checkbox| :guilabel:`Display diagrams` and select 
    :guilabel:`Pie Chart` |selectstring| as Diagram type.
#.  In the Pie chart we want to display the values of the three columns 
    ``T_F_JAN``, ``T_F_JUL`` and ``T_F_MEAN``. First select ``T_F_JAN`` as 
    Attributes and click the green **[\+]** button, then ``T_F_JUL`` and 
    finally ``T_F_MEAN``.
#.  Diagram size is based on linear scaling of a classification attribute. We 
    choose ``T_F_JUL``, click on ``Find maximum value and set size to `20` and 
    Size unit to ``Millimeter``.
#.  Now click **[Apply]** to display the diagram in the |qg| main window.
#.  You can now adapt the chart size, or change the attribute colors double 
    clicking on the color values in the attribute field. Figure_overlay_2_ 
    gives an impression.
#.  Finally click **[Ok]**.

.. _figure_overlay_2:

.. only:: html

   **Figure Overlay 2:**

.. figure:: /static/user_manual/plugins/overlay_tab2.png
   :width: 25em
   :align: center

   Pie chart diagram from temperature data overlayed on a map |nix|

Additionally in the :menuselection:`Settings --> Options` dialog, there is a 
``Overlay`` tab where it is possible to select the placement algorithm of the diagrams. 
The central point method is a generic one, the others use algorithms of the PAL library. 
They also consider diagram objects and labels in different layers.

 
