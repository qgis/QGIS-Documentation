def openProject():
    pass

def saveProject():
    msgbar = iface.messageBar()
    msgbar.PushMessage("WARNING","Project contains sensitive data."
                       " Do not publish.",
                       QgsMessageBar.WARNING, 10)
    pass

def closeProject():
    pass

