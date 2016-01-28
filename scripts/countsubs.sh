while read SUBSTITUTION; do
  COUNT=`grep -ir -m1 $SUBSTITUTION --include="*.rst" docs/ | wc -l`;echo $SUBSTITUTION $COUNT
  done <subst.py
