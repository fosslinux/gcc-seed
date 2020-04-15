set -e

cd ${REPO}/staging/bin

echo "Linking mkdir"
ln -s ../../sources/gash-assets/mkdir .
echo "Linking mv"
ln -s ../../sources/gash-assets/mv .
echo "Linking pwd"
ln -s ../../sources/gash-assets/pwd .
echo "Linking reboot"
ln -s ../../sources/gash-assets/reboot .
echo "Linking rm"
ln -s ../../sources/gash-assets/rm .
echo "Linking rmdir"
ln -s ../../sources/gash-assets/rmdir .
echo "Linking sed"
ln -s ../../sources/gash-assets/sed .
echo "Linking sleep"
ln -s ../../sources/gash-assets/sleep .
echo "Linking sort"
ln -s ../../sources/gash-assets/sort .
echo "Linking tar"
ln -s ../../sources/gash-assets/tar .
echo "Linking test"
ln -s ../../sources/gash-assets/test .
echo "Linking touch"
ln -s ../../sources/gash-assets/touch .
echo "Linking tr"
ln -s ../../sources/gash-assets/tr .
echo "Linking true"
ln -s ../../sources/gash-assets/true .
echo "Linking uname"
ln -s ../../sources/gash-assets/uname .
echo "Linking uniq"
ln -s ../../sources/gash-assets/uniq .
echo "Linking wc"
ln -s ../../sources/gash-assets/wc .
echo "Linking which"
ln -s ../../sources/gash-assets/which .
