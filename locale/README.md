
Notes about chinese language codes:

Transifex defines zh-Hans and zh-Hant, but the gettext tools appear to only handle zh_Hans and zh_Hant (with underscores) at this moment.
So to build these you have to add symbolic links to the locale dir:
```
ln -s zh_Hans zh-Hans
ln -s zh_Hant zh-Hant

```
In this way, you can BUILD with an underscore ('_'), but pull from transifex with a hyphen ('-')


