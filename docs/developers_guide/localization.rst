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

Another option in the settings allows to define if the
numeric thousands separator has to be used.

All these features are implemented through the
`QLocale <https://doc.qt.io/qt-5/qlocale.htm>`_
QT class which provides a very complete support for numeric
and date types representation.

In order to make this system work a few rules need to be
carefully followed when displaying numeric values in the
QGIS user interface and when converting user input to
integral or floating point variables.

Converting numbers to strings
========================================

For strings that are printed on the screen and visible to the users
do not use ``QString::number()`` because it does not take locale
options into consideration and it always uses ``C`` locale.

Also do not use string interpolation unless you use the ``L`` suffix as explained in
`QString documentation <https://doc.qt.io/qt-5/qstring.html#arg-5>`_.

Use ``QLocale().toString()`` instead.

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
    as decimal separator and no thousands separator). ``QString::number()`` must be
    used in this situation.


Converting user input strings to numbers
=========================================================

When converting strings from user input to numbers do not use
``QVariant::toDouble()``, ``QString::toDouble()`` or other ``::toDouble()``
methods available in QT classes because these methods ignore locale settings.
The same consideration applies to integral types and ``::toInt()`` or
``::toLongLong()`` methods.

``QLocale().toDouble()`` or ``QLocale().toInt()`` and the others ``QLocale()``
conversion methods can be used in this situation.

As a better alternative, QGIS API provides a few classes that
should be used for floating point numeric user input:

+ :class:`QgsDoubleSpinBox <qgis.gui.QgsDoubleSpinBox>`
+ :class:`QgsDoubleValidator <qgis.gui.QgsDoubleValidator>`


:class:`QgsDoubleSpinBox <qgis.gui.QgsDoubleSpinBox>` displays the
number according to user locale and settings and it validates the user
input using :class:`QgsDoubleValidator <qgis.gui.QgsDoubleValidator>`.

The validator class is tolerant and it will try to interpret the input
checking first for the user locale and falling back to ``C`` locale if
there is no match.

The general recommendation is to use :class:`QgsDoubleSpinBox <qgis.gui.QgsDoubleSpinBox>`
for all floating point types I/O whenever it is possible because it is very well tested and
it validates the input correctly. As an alternative it is possible
to use the :class:`QgsDoubleValidator <qgis.gui.QgsDoubleValidator>` class
independently on a string obtained from another widget (e.g. a simple
``QLineEdit`` widget).


