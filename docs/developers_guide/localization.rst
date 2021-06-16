**********************************
 Localization
**********************************

QGIS user interface is available in multiple languages.

A global option in the settings allows to override the
user interface language which was automatically detected
from the operating system.

The representation of numbers, currency and dates varies
according to the country and it is also overrideable in
the settings.

Another option in the settings allows to determine if the
numeric tousands separator has to be used.

All these features are implemented through the
`QLocale <https://doc.qt.io/qt-5/qlocale.htm>`_
QT class which provides a very complete support for numeric
and date types representation.

In order to make this system work a few rules need to be
carefully followed when displaying numeric values in the
QGIS user interface.

Always use QLocale to display numbers
========================================

Do not use ``QVariant::toDouble()``, ``QString::toDouble()`` or other
``::toDouble()`` methods available in QT classes because they don't take
locale options into consideration.

Also do not use string interpolation unless you use the ``L`` suffix as explained in
`QString documentation <https://doc.qt.io/qt-5/qstring.html#arg-5>`_.


Example:

.. code-block:: cpp

    const QString localizedNumber = QLocale().toString( 1234.56 );
    // localizedNumber will be:  1,234.56 using english or "C" locale
    //                           1.234,56 using italian locale
    //                            1234.56 using english or "C" locale without thousands separator
    //                            1234,56 using italian locale without thousands separator


.. warning::

    A notable exception to this rule is the generation of strings that will be passed to
    external applications or scripts that expect ``C`` number representation (dot
    as decimal separator and no thousands separator).


Always use QgsDoubleValidator to parse numeric user input
=========================================================

QGIS API provides a few classes that must be used for floating point
numeric user input:

+ :class:`QgsDoubleSpinBox <qgis.gui.QgsDoubleSpinBox>`
+ :class:`QgsDoubleValidator <qgis.gui.QgsDoubleValidator>`


:class:`QgsDoubleSpinBox <qgis.gui.QgsDoubleSpinBox>` displays the
number according to user locale and settings and validates the user
input using :class:`QgsDoubleValidator <qgis.gui.QgsDoubleValidator>`.

The class is tolerant and will try to interpret the input checking
first for the user locales and falling back to ``C`` locale if there
is no match.

The general recommendation is to use :class:`QgsDoubleSpinBox <qgis.gui.QgsDoubleSpinBox>`
for all floating point types I/O whenever it is possible because it is very well tested and
it validates the input correctly, as an alternative it is possible
to use the :class:`QgsDoubleValidator <qgis.gui.QgsDoubleValidator>` class
intedependently on a string value obtained from another widget (e.g. a simple
``QLineEdit`` widget).

For integer types input checking is usually less problematic because there
is no decimal separator.

