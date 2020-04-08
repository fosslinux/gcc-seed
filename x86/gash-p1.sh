set -e

cd ${REPO}/sources/gash-assets
echo "Substituting awk"
cp.in awk.in awk
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" awk
echo "Substituting basename"
cp.in basename.in basename
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" basename
echo "Substituting cat"
cp.in cat.in cat
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" cat
echo "Substituting chmod"
cp.in chmod.in chmod
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" chmod
echo "Substituting cmp"
cp.in cmp.in cmp
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" cmp
echo "Substituting compress"
cp.in compress.in compress
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" compress
echo "Substituting cp"
cp.in cp.in cp
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" cp
echo "Substituting cut"
cp.in cut.in cut
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" cut
echo "Substituting diff"
cp.in diff.in diff
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" diff
echo "Substituting dirname"
cp.in dirname.in dirname
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" dirname
echo "Substituting egrep"
cp.in egrep.in egrep
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" egrep
echo "Substituting expr"
cp.in expr.in expr
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" expr
echo "Substituting false"
cp.in false.in false
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" false
echo "Substituting find"
cp.in find.in find
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" find
echo "Substituting fgrep"
cp.in fgrep.in fgrep
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" fgrep
echo "Substituting gash"
cp.in gash.in gash
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" gash
echo "Substituting grep"
cp.in grep.in grep
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" grep
echo "Substituting gzip"
cp.in gzip.in gzip
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" gzip
echo "Substituting head"
cp.in head.in head
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" head
echo "Substituting ln"
cp.in ln.in ln
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" ln
echo "Substituting ls"
cp.in ls.in ls
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" ls
echo "Substituting mkdir"
cp.in mkdir.in mkdir
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" mkdir
echo "Substituting mv"
cp.in mv.in mv
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" mv
echo "Substituting pwd"
cp.in pwd.in pwd
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" pwd
echo "Substituting reboot"
cp.in reboot.in reboot
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" reboot
echo "Substituting rmdir"
cp.in rmdir.in rmdir
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" rmdir
echo "Substituting rm"
cp.in rm.in rm
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" rm
echo "Substituting sed"
cp.in sed.in sed
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" sed
echo "Substituting sleep"
cp.in sleep.in sleep
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" sleep
