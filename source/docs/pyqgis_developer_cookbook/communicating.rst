***************************
Communicating with the user
***************************

This section shows some methods and elements that should be used to communicate
with the user, in order to keep consistency in the User Interface.

Showing messages. The :class:`QgsMessageBar` class
==================================================

Using message boxes can be a bad idea from a user experience point of view. For
showing a small info line or a warning/error messages, the QGIS message bar is
usually a better option.

Using the reference to the QGIS interface object, you can show a message in the
message bar with the following code

::

  iface.messageBar().pushMessage("Error", "I'm sorry Dave, I'm afraid I can't do that", level=QgsMessageBar.CRITICAL)


.. figure:: /static/pyqgis_developer_cookbook/errorbar.png
   :align: center
   :width: 40em

   QGIS Message bar

You can set a duration to show it for a limited time

::

    iface.messageBar().pushMessage("Error", ""Ooops, the plugin is not working as it should", level=QgsMessageBar.CRITICAL, duration=3)


.. figure:: /static/pyqgis_developer_cookbook/errorbar-timed.png
   :align: center
   :width: 40em

   QGIS Message bar with timer

The examples above show an error bar, but the ``level`` parameter can be used
to creating warning messages or info messages, using the
``QgsMessageBar.WARNING`` and ``QgsMessageBar.INFO`` constants respectively.

.. figure:: /static/pyqgis_developer_cookbook/infobar.png
   :align: center
   :width: 40em

   QGIS Message bar (info)

Widgets can be added to the message bar, like for instance a button to show
more info

::

    def showError():
        pass

    widget = iface.messageBar().createMessage("Missing Layers", "Show Me")
    button = QPushButton(widget)
    button.setText("Show Me")
    button.pressed.connect(showError)
    widget.layout().addWidget(button)
    iface.messageBar().pushWidget(widget, QgsMessageBar.WARNING)


.. figure:: /static/pyqgis_developer_cookbook/bar-button.png
   :align: center
   :width: 40em

   QGIS Message bar with a button

You can even use a message bar in your own dialog so you don't have to show a
message box, or if it doesn't make sense to show it in the main QGIS window

::

    class MyDialog(QDialog):
        def __init__(self):
            QDialog.__init__(self)
            self.bar = QgsMessageBar()
            self.bar.setSizePolicy( QSizePolicy.Minimum, QSizePolicy.Fixed )
            self.setLayout(QGridLayout())
            self.layout().setContentsMargins(0, 0, 0, 0)
            self.buttonbox = QDialogButtonBox(QDialogButtonBox.Ok)
            self.buttonbox.accepted.connect(self.run)
            self.layout().addWidget(self.buttonbox, 0, 0, 2, 1)
            self.layout().addWidget(self.bar, 0, 0, 1, 1)

        def run(self):
            self.bar.pushMessage("Hello", "World", level=QgsMessageBar.INFO)

.. figure:: /static/pyqgis_developer_cookbook/dialog-with-bar.png
   :align: center
   :width: 40em

   QGIS Message bar in custom dialog


Showing progress
================

Progress bars can also be put in the QGIS message bar, since, as we have seen,
it accepts widgets. Here is an example that you can try in the console.

::

    import time
    from PyQt4.QtGui import QProgressBar
    from PyQt4.QtCore import *
    progressMessageBar = iface.messageBar().createMessage("Doing something boring...")
    progress = QProgressBar()
    progress.setMaximum(10)
    progress.setAlignment(Qt.AlignLeft|Qt.AlignVCenter)
    progressMessageBar.layout().addWidget(progress)
    iface.messageBar().pushWidget(progressMessageBar, iface.messageBar().INFO)
    for i in range(10):
        time.sleep(1)
        progress.setValue(i + 1)
    iface.messageBar().clearWidgets()

Also, you can use the built-in status bar to report progress, as in the next
example

::

    count = layers.featureCount()
    for i, feature in enumerate(features):
        #do something time-consuming here
        ...
        percent = i / float(count) * 100
        iface.mainWindow().statusBar().showMessage("Processed {} %".format(int(percent)))
    iface.mainWindow().statusBar().clearMessage()

Logging
=======

You can use the QGIS logging system to log all the information that you want to
save about the execution of your code.

::

    QgsMessageLog.logMessage("Your plugin code has been executed correctly", QgsMessageLog.INFO)
    QgsMessageLog.logMessage("Your plugin code might have some problems", QgsMessageLog.WARNING)
    QgsMessageLog.logMessage("Your plugin code has crashed!", QgsMessageLog.CRITICAL)
