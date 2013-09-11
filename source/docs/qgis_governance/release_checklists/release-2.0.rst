Checklist for QGIS Release 2.0
------------------------------

.. This is a comment and will not be rendered. Please update the items marked
   as |checkbox_unchecked| to |checkbox_checked| when they are completed.


Key Dates:
----------

* **1 April 2013** - Feature freeze - no new features in master.
* **15 April 2013** - API Freeze - no changes to API except where it is in
  direct response to broken functionality. 
* **30 April** - GUI Freeze and String freeze - no changes to ui or strings
  except where required for critical bug fixes. Call for translations.
* **1 June 2013** - Branch 2.0, code freeze (except for packaging related
  changes), call for packaging.
* **7 June 2013** - Public release of 2.0


Blocking Features
-----------------

 * Symbology overhaul
 * Labelling overhaul
 * New web site and docs
 * SEXTANTE integration
 * Interface cleanup and consistency
 * Plugins migration
 * Merge new_vector_api branch

Release Timeline
................

* |checkbox_unchecked| Small enhancements and bug fixes can continue in trunk
* |checkbox_unchecked| Set date for next release about two months into the
  future.
* |checkbox_unchecked| Discuss with PSC & Developers which features should be merged into release
  (in future this will be trunk).
* |checkbox_unchecked| Update the splash screen (minor and major releases!)
* |checkbox_unchecked| Update top level CMakeLists.txt with release name and version
* |checkbox_unchecked| Update the About -> authors panel with a more recent hackfest image
* |checkbox_unchecked| Check that the QGIS icon 64x64 has master text removed.

Three weeks before - feature freeze Date here
..............................................

* |checkbox_unchecked| Only bug fixes go into trunk from here forward, *no new features*.
* |checkbox_unchecked| Complete merge of new features.
* |checkbox_unchecked| Call for document managers to update docs based on new features in Git.
* |checkbox_unchecked| Check for changes in project file structure that needs to be handled.
* |checkbox_unchecked| Release team start writing press releases, making screenshots etc.
* |checkbox_unchecked| Add link to visual changelog here.

Two weeks before - string freeze - Date here 
.............................................

* Bug fixes can continue in trunk but no more strings can be changed.
  **Note:** the intent here is not for translators to *start* translating now,
  but to finalise their work.
* |checkbox_unchecked| Ensure any new contributors have been added to AUTHORS
  along with their mugshot if available (reserved for SVN
  committers)
* |checkbox_unchecked| Ensure any new contributors have been added to
  CONTRIBUTORS (reserved for non GIT committers)
* |checkbox_unchecked| Ensure any new sponsors have been added to SPONSORS
* |checkbox_unchecked| Update the ChangeLog with a list of changes implemented
  in this release (complete changelog section below)
* |checkbox_unchecked| Update index.html to reflect *what's new*,
  *requirements*, and *documentation* (see current index.html in ./doc of the
  source tree)
* |checkbox_unchecked| Update the *whatsNew* string in qgisapp.cpp to reflect
  changes (used to display in about box) 
* |checkbox_unchecked| Check that INSTALL.t2t install docs are up to date
* |checkbox_unchecked| Update index.html to reflect GRASS and related lib
  versions in the win build (see current index.html in ./doc of the source
  tree)
* |checkbox_unchecked| Check that cmake is deploying all headers required to
  build apps using libqgis_* 
* |checkbox_unchecked| Apply any pending patches or mark them for a future
  release in the tracker (see bug tracker section below)
* |checkbox_unchecked| Apply fixes for any pending bugs or mark them against a
  future milestone (see bug tracker section below)
* |checkbox_unchecked| String freeze announcement for UI
* |checkbox_unchecked| Update and commit ts files using
  scripts/update_ts_files.sh (GUI Translation Team Lead) after announcement
  above
* |checkbox_unchecked| *Call for translators* to update translations and submit
  their ts files (see pro-forma email below) GUI Translation Team Lead

One week before - branch & call for packaging Date here
........................................................

* |checkbox_unchecked| No bug fixes, string changes etc. allowed in branch,
  only packaging related changes.
* |checkbox_unchecked| Ensure all submitted translation updates have been
  applied (GUI Translation Team Lead).
* |checkbox_unchecked| Make source tarball before *call for packaging* (see
  notes below).
* |checkbox_unchecked| Branch GIT and *call for packaging* (see branching notes
  below) and record revision here: XXXXXX
* |checkbox_unchecked| Edit build_debian_package.sh and set @dch -v 2.0.0@ to
  the apropriate version number.
* |checkbox_unchecked| Update the NSIS installer (win_build/qgis.nsis) to
  reflect the correct version.
* |checkbox_unchecked| Release team prepare press releases in various formats
  in anticipation of release (don't publish yet).

Day of release - Date
.....................

* |checkbox_unchecked| Close off release branch and announce release to the
  world. Date is dependent on package readiness.
* |checkbox_unchecked| Tag the branch as final release (see tag section below).
* |checkbox_unchecked| Make tag and branch read only (see notes below).
* |checkbox_unchecked| Note the GIT revision hash for the tagged release here:
   XXXXXXX.
* |checkbox_unchecked| Generate API documentation and upload to download area
  (using doxygen).
* |checkbox_unchecked| Upload release packages to download area (see checklist
  at the top of this page).
* |checkbox_unchecked| *Release team announce to press* and make packages available.

Packaging Team 
...............

+------------------------------+---------------------------------------+----------------------------------------------+
|Tim Sutton                    |tim at linfiniti.com                   |Release Manager                               |
+------------------------------+---------------------------------------+----------------------------------------------+
|Jürgen E. Fischer             |jef at norbit.de                       |Ubuntu Packages                               |
+------------------------------+---------------------------------------+----------------------------------------------+
|Jürgen E. Fischer / Tim Sutton|jef at norbit.de / tim at linfiniti.com|Windows packaging                             |
+------------------------------+---------------------------------------+----------------------------------------------+
|Otto Dassau                   |otto.dassau at gmx.de                  |openSUSE Packaging                            |
+------------------------------+---------------------------------------+----------------------------------------------+
|William                       |kyngchaos at kyngchaos.com             |OSX Frameworks Build and OSX all in one bundle|
+------------------------------+---------------------------------------+----------------------------------------------+
|Niccolo Rigacci               |qgis at rigacci.org                    |Debian Lenny                                  |
+------------------------------+---------------------------------------+----------------------------------------------+
|Volker Fröhlich               |volker27 at gmx.at                     |Fedora packaging                              |
+------------------------------+---------------------------------------+----------------------------------------------+
|BABA Yoshihiko                |babayoshihiko at mac.com               |OSX via Fink                                  |
+------------------------------+---------------------------------------+----------------------------------------------+
|Antonio Chay                  |antonio.chay at gmail.com              |CentOS 5.x                                    |
+------------------------------+---------------------------------------+----------------------------------------------+
|Jeremy Spykerman              |jeremy.spykerman at gmail.com          |                                              |
+------------------------------+---------------------------------------+----------------------------------------------+
|Jim Hammack                   |hammack AT gotslack.org                |Slackware 13.0                                |
+------------------------------+---------------------------------------+----------------------------------------------+
|Tim Sutton                    |tim at linfiniti.com                   |Source @ qgis.org/dowloads/                   |
+------------------------------+---------------------------------------+----------------------------------------------+

Packages should be uploaded to qgis.org into the appropriate subdirs under
:file:`/var/www/downloads`

After each package is uploaded, an entry should be created for it on the wiki
page at http://download.qgis.org


Post Release 
.............

* |checkbox_unchecked| *qgis.org  Updates*
* |checkbox_unchecked| Update the 'Current Release' link on the main menu
* |checkbox_unchecked| Update the 'Download' link on the top menu bar
* |checkbox_unchecked| Add release newsflash
* |checkbox_unchecked| Current version page to be updated
* |checkbox_unchecked| svn download of tagged release updated
* |checkbox_unchecked| download page updated
* |checkbox_unchecked| screenshots updated

* |checkbox_unchecked| *Publicising (see announcing the release section below)* 
* |checkbox_unchecked| http://freshmeat.net
* |checkbox_unchecked| http://kde-apps.org
* |checkbox_unchecked| http://qt-apps.org
* |checkbox_unchecked| http://freegis.org
* |checkbox_unchecked| http://apple.com
* |checkbox_unchecked| http://slashgeo.org/submit.pl
* |checkbox_unchecked| http://lxer.com/module/newswire/stories/add.php
* |checkbox_unchecked| http://www.freemacware.com/let-us-know
* |checkbox_unchecked| http://www.osnews.com/submit.php
* |checkbox_unchecked| http://directory.fsf.org/project/QGIS/

* |checkbox_unchecked| *Announcements on mailing lists*
* |checkbox_unchecked| freegis-list: http://intevation.de/mailman/listinfo/freegis-list
* |checkbox_unchecked| grassuser: http://grass.itc.it/mailman/listinfo/grassuser
* |checkbox_unchecked| qgis-user: http://lists.osgeo.org/mailman/listinfo/qgis-user
* |checkbox_unchecked| qgis-developer: https://lists.sourceforge.net/lists/listinfo/qgis-developer
* |checkbox_unchecked| pkg-grass-general: http://lists.alioth.debian.org/mailman/listinfo/pkg-grass-general 
* |checkbox_unchecked| osgeo-announce: news_item@osgeo.org
* |checkbox_unchecked| osgeo-discuss: http://lists.osgeo.org/mailman/listinfo/discuss
* |checkbox_unchecked| osgeo-africa: http://lists.osgeo.org/mailman/listinfo/africa
* |checkbox_unchecked| ppgis: ppgis@dgroups.org
* |checkbox_unchecked| gav-talk: http://www.grass-verein.de/ml_irc.html (german)
* |checkbox_unchecked| grass-de: http://www.grass-verein.de/ml_irc.html (german)
* |checkbox_unchecked| viscom-de: http://lists.osgeo.org/mailman/listinfo/viscom-discuss-de (german)
* |checkbox_unchecked| gfoss.it: http://www.faunalia.com/cgi-bin/mailman/listinfo/gfoss (italian)
* |checkbox_unchecked| info@aet.org.es (spanish)
* |checkbox_unchecked| TELEDETECCION@LISTSERV.REDIRIS.ES (spanish)
* |checkbox_unchecked| telenet@latuv.uva.es (spanish)
* |checkbox_unchecked| SIG@LISTSERV.REDIRIS.ES (spanish)
* |checkbox_unchecked| ecespa@ecologiaespacial.es (spanish)
* |checkbox_unchecked| infogeo@eListas.net (spanish)
* |checkbox_unchecked| map-mac@avenza.com (spanish)
* |checkbox_unchecked| ppgis-scope@igc.org (spanish)


Call for translators email 
...........................

When translations call is made, an email based on the template below should
be sent out to encourage translators to get there work submitted.::
   
   
   Hi All (and especially translators)
   
   As of today please note that we are entering string freeze for the run up to
   the next release. If you are committing bug fixes please avoid changing any
   strings. Translation .ts files have been updated in SVN so please update your
   local svn checkouts. The period for translations will close MMMM-DD-YYYY (i.e.
   about one week from now) and then we will be branching for release. Any
   translations submitted to us after that time will only be included in the next
   release, so please submit what you have by then even if it is not complete.
   
   As always you can track the release plans via the checklist at:
   http://www.qgis.org/wiki/Release_Checklist_2.0.0

   If you have any questions about the translation process, please see the
   following page which includes instructions on how to generate a .ts file for a
   new locale.
   http://www.qgis.org/wiki/Gui_Translation

   Many thanks to all the translators out there for the great work you do!
   Regards,

   P.S.: The list of Translation Progress is here 
   http://www.qgis.org/wiki/GUI_Translation_Progress#QGIS_Current_trunk_Version_Progress


Branching and Tagging Details 
.............................
Branch the release using syntax below (update this with the actual commands you
used to branch).::
   
   git branch release-2_0
   git push origin release-2_0

Tag the release using a signed tag::
   
   git tag -s final-2_0_0 -m "Version 2.0.0"
   git push origin final-2.0.0


Bug Tracker System 
...................

All bugs that are intended to have been fixed in this release should have been
marked as closed. All other bugs on the release branch should be marked for a
future release. To do this:

* create a new milestone and version e.g. we are releasing 2.0.0 now so create
  a new milestone in redmine for 2.0.0. Create the milestone here:

* Now you need to update each open bug on the branch and reset its milestone for
  the next release in the future. This can be done easily doing a batch update in redmine.


Create the source tarball 
.........................

This is best achieved by running this little script::

  cd ~/Quantum-GIS
  git archive --format=tar --prefix=qgis-2.0.0/ final-2_0_0 | \
  bzip2 > /var/www/downloads/qgis-2.0.0.tar.bz2
  md5sum /var/www/downloads/qgis-2.0.0.tar.bz2 > \
  /var/www/downloads/qgis-2.0.0.tar.bz2.md5


Generate the changelog 
......................

TODO: Add details here on how to generate the changelog.

Pro-forma call for packaging announcement 
.........................................

mail::

 Hi All
 
 Dear QGIS devs & packagers
 
 --- Note to casual readers ---
 
 Please do not pre-announce this release - give the packagers and release team 
 a chance to do their thing so that people hearing about the release have a fair 
 chance of finding a package, reading all our press material etc. 
 
 --- End note ---
 
 I have branched QGIS 2.0.0 for release. The branch can be checked out like 
 this (as a tracking branch)
 
 git clone git://github.com/qgis/Quantum-GIS.git
 git branch --track release-2_0 origin/release-2_0
 git checkout release-2_0
 
 Or (to check out the tag made immediately before branching)
 
 git fetch
 git checkout final-2.0.0
 
 
 Source tarballs can be obtained from here:
 
 http://qgis.org/downloads/qgis-2.0.0.tar.bz2
 http://qgis.org/downloads/qgis-2.0.0.tar.bz2.md5
 
 Some notes:
 
 - Please do not commit anything to the release branch except packaging related
   tweaks.
 - If you make a package please be so kind as to update the download wiki page at 
   http://www.qgis.org/wiki/Download with the details of your package.
 - If you are able to make packages for unlisted platforms / distros please
   discuss your plans on this thread so that we can avoid duplication of effort.
 - I would like to make the release announcement next week, so it will be great
   to have as many packages as possible ready by then.
 - GIT master is open again for general commits - please seek guidance from
   Marco Hugentobler (PSC Code Manager) if you are planning any major code
   changes.
 - Please accompany any updates to core with unit tests!
 
 Many thanks to all the developers, testers, bug fixers, bug reporters, document
 writers, translators and users that help to make QGIS a reality!
 
 Lastly can I call on the release team (or any interested people) to help to put
 together visual changelog (link below), press announcements etc. ready for the
 release date? I will send you an email when the packages are ready and you can
 start broadcasting announcements.
  
 Visual Changelog Wiki Page: http://changelog.linfiniti.com/version/1/ (this is
 the site for drafting the release, the final release content will be on the
 official QGIS web site).
 
 Best regards


Windows Binary upload 
.....................

Put the binary onto the server::

 cd /osgeo/download/qgis/win32/
 wget http://linfiniti.com/downloads/QGIS-2.0.0-0-No-GrassSetup.exe
 md5sum QGIS-2.0.0-0-No-GrassSetup.exe > QGIS-2.0.0-0-No-GrassSetup.exe.md5

Now do a virus check on it. First make a note of the url:
  
  http://download.osgeo.org/qgis/win32/QGIS-2.0.0-0-No-GrassSetup.exe

Now go to GarysHood online virus checker or similar to double check the binary
is virus free:

`Gary Shood Virus Checker <http://www.garyshood.com/virus/>`_


Announcing the release
----------------------

Note you can get stats for the previous release like with "awstats": 
  http://www.qgis.org/cgi-bin/awstats.pl?urlfilter=%2Fdownloads%2FQGIS-OSGeo4W-2.0.0-.*-Setup.exe&urlfilterex=&output=urldetail&config=qgis&framename=mainright&month=all&year=2011

IRC TOPIC update
................

Tim or Gary can update the IRC topic using this procedure:

::

  /msg chanserv op #qgis
  /topic #qgis to: !!Quantum GIS "Wroclaw" 1.8.2 released Nov 2011! - http://download.qgis.org || Logs: http://irclogs.geoapt.com/qgis || All activity on this channel is logged !!

Update Version Text File
........................

The file accessed from the :menuselection:`Help --> Check QGIS Version` menu is located at http://qgis.org/version.txt. This should be updated to reflect the current release.

Create an announcement template 
...............................

An announcement template will save you retypping the same text at the various places of announcement. The following text can be used as a basis:


A Generic release subject 
+++++++++++++++++++++++++

Announcing the release of QGIS 2.0.0 (unstable release).


A generic 20 word summary 
+++++++++++++++++++++++++

Quantum GIS is a user friendly Open Source Geographic Information System that runs on Linux, Unix, Mac OSX, and Windows.


A mailing list announcement 
+++++++++++++++++++++++++++

We are very pleased to announce the release of QGIS 2.0.0 'Lisboa'. This release contains new features and extends the programmatic interface over QGIS 1.0.x and QGIS 1.7.x

Binary and source code packages are available at:

http://download.qgis.org

If there is not yet a package for your platform on the above page, please check back regularly as packagers are still pushing out their work and they will update the download page to reflect the new packages. Along with the release of QGIS 2.0.0, the QGIS Community Team is hard at work on an updated QGIS Users' Guide version 2.0.0. The guide will be available in the near future - we will post announcements when it is available.

A word of thanks to our contributors, donors and sponsors
.........................................................

QGIS is a largely volunteer driven project, and is the work of a dedicated team of developers, documenters and supporters. We extend our thanks and gratitude for the many, many hours people have contributed to make this release happen. Many companies and organisations contribute back improvements to QGIS when they use it as their platform, and we are grateful for this and encourage others to do the same! We would also like to thank our sponsors and donors for helping to promote our work through their financial contributions. Our current* sponsors are:

Silver Sponsor

- State of Vorarlberg (http://www.vorarlberg.at - Austria, November 2011)

Bronze Sponsors

- Argusoft (http://www.argusoft.de - Germany, June 2012)
- GeoSynergy (http://www.geosynergy.com.au - Australia May, 2012)
- ibW Bildungszentrum Wald (http://www.bzwmaienfeld.ch - Switzerland, March 2012)
- City of Uster (http://gis.uster.ch - Switzerland - November 2011)

*QGIS Sponsorship is valid for one year.*

A current list of donors who have made contributions large and small to the project can be seen here:

http://qgis.org/en/sponsorship/donors.html

If you would like to make a donation or sponsor our project, please visit http://www.qgis.org/en/sponsorship.html . QGIS is Free software and you are under no obligation to do so.


Visual tour of the new release:
............................................

You can find a list of highlighted changes and new features listed on the detailed release announcement available here:

http://qgis.org/index.php?option=com_content&view=article&id=149

New features with this release:
...............................................


Happy QGIS'ing!

Regards,

The QGIS Team!



A generic product description 
.............................

Quantum GIS (QGIS) is a user friendly Open Source Geographic Information System
(GIS) that runs on Linux, Unix, Mac OSX, and Windows. QGIS supports vector,
raster, and database formats. QGIS is licensed under the GNU General Public
License. QGIS lets you browse and create map data on your computer. It supports
many common spatial data formats (e.g. ESRI ShapeFile, geotiff). QGIS supports
plugins to do things like display tracks from your GPS. QGIS is Open Source
software and its free of cost.


A generic features list 
.......................

