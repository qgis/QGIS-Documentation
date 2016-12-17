
HIG (Human Interface Guidelines)
=================================

In order for all graphical user interface elements to appear consistant and to
all the user to instinctively use dialogs, it is important that the following
guidelines are followed in layout and design of GUIs.

1.  Group related elements using group boxes:
    Try to identify elements that can be grouped together and then use group
    boxes with a label to identify the topic of that group. Avoid using group
    boxes with only a single widget / item inside.
2.  Capitalise first letter only in labels:
    Labels (and group box labels) should be written as a phrase with leading
    capital letter, and all remaining words written with lower case first letters
3.  Do not end labels for widgets or group boxes with a colon:
    Adding a colon causes visual noise and does not impart additional meaning,
    so don't use them. An exception to this rule is when you have two labels next
    to each other e.g.: Label1 Plugin (Path:) Label2 [/path/to/plugins]
4.  Keep harmful actions away from harmless ones:
    If you have actions for 'delete', 'remove' etc, try to impose adequate space
    between the harmful action and innocuous actions so that the users is less
    likely to inadvertantly click on the harmful action.
5.  Always use a QButtonBox for 'OK', 'Cancel' etc buttons:
    Using a button box will ensure that the order of 'OK' and 'Cancel' etc,
    buttons is consistent with the operating system / locale / desktop
    environment that the user is using.
6.  Tabs should not be nested. If you use tabs, follow the style of the
    tabs used in QgsVectorLayerProperties / QgsProjectProperties etc.
    i.e. tabs at top with icons at 22x22.
7.  Widget stacks should be avoided if at all possible. They cause problems with
    layouts and inexplicable (to the user) resizing of dialogs to accommodate
    widgets that are not visible.
8.  Try to avoid technical terms and rather use a laymans equivalent e.g. use
    the word 'Transparency' rather than 'Alpha Channel' (contrived example),
    'Text' instead of 'String' and so on.
9.  Use consistent iconography. If you need an icon or icon elements, please
    contact Robert Szczepanek on the mailing list for assistance.
10. Place long lists of widgets into scroll boxes. No dialog should exceed 580
    pixels in height and 1000 pixels in width.
11. Separate advanced options from basic ones. Novice users should be able to
    quickly access the items needed for basic activities without needing to
    concern themselves with complexity of advanced features. Advanced features
    should either be located below a dividing line, or placed onto a separate tab.
12. Don't add options for the sake of having lots of options. Strive to keep the
    user interface minimalistic and use sensible defaults.
13. If clicking a button will spawn a new dialog, an ellipsis (...) should be
    suffixed to the button text.


Authors
-------

- Tim Sutton (author and editor)
- Gary Sherman
- Marco Hugentobler
- Matthias Kuhn

