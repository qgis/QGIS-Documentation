from qgis.core import Qgis
from qgis.utils import iface


def openProject():
    pass


def saveProject():
    msgbar = iface.messageBar()
    msgbar.pushMessage(
        "WARNING",
        "Project contains sensitive data. Do not publish.",
        Qgis.Warning,
        10,
    )
    pass


def closeProject():
    pass
