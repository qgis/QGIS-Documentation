# Root installation forder
QGIS_PREFIX_PATH = /home/richard/bin/qgis310/master/debug/

# Or build output folder
#QGIS_PREFIX_PATH = /home/user/dev/QGIS-build-master/output

include venv.mk

# make -f user.mk tx_force_translations
# DANGER !!! THIS WILL OVERWRITE ALL TRANSIFEX TRANSLATIONS WITH THE PO FILES IN YOUR FOLDER
LANGUAGES = ar az bg bn ca cs da de el es eu fa fi fr gl he hi hr hu id ig it ja ka kab ko lt mk ml mn mr ms my nb nl nqo pl pt_BR pt_PT ro ru sl sq sr sv ta te th tl tr ug uk ur vi zh-Hans zh-Hant
tx_force_translations:
	@for LANG in $(LANGUAGES) ; do \
		tx push -f -t -l $$LANG --no-interactive --skip --parallel; \
	done
