set -e

cd ${REPO}/sources/gash-assets

echo "Substituting sort"
cp.in sort.in sort
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" sort
echo "Substituting tar"
cp.in tar.in tar
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" tar
echo "Substituting test"
cp.in test.in test
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" test
echo "Substituting touch"
cp.in touch.in touch
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" touch
echo "Substituting tr"
cp.in tr.in tr
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" tr
echo "Substituting true"
cp.in true.in true
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" true
echo "Substituting uname"
cp.in uname.in uname
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" uname
echo "Substituting uniq"
cp.in uniq.in uniq
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" uniq
echo "Substituting wc"
cp.in wc.in wc
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" wc
echo "Substituting which"
cp.in which.in which
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" which

echo "Substituting echo"
cp.in echo.in echo
sed.in -i "s:\#\!kaem:\#\!${REPO}/staging/bin/kaem:" echo 

cd ${REPO}/staging/bin
echo "Linking gash -> gash"
ln -s ../../sources/gash-assets/gash .
echo "Linking gash -> sh"
ln -s ../../sources/gash-assets/gash ./sh

