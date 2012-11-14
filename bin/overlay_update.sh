#!/bin/sh

OVERLAY_ROOT=/home/overlay
RSYNC_EXPORT=rsync_export
RSYNC_EXPORT_TMP=rsync_export_tmp

echo -e "\n>>> Updating overlay content"

cd ${OVERLAY_ROOT}
echo -n "Exporting git content... "
rm -rf ${RSYNC_EXPORT_TMP}
git clone git ${RSYNC_EXPORT_TMP} > /dev/null
rm -rf ${RSYNC_EXPORT_TMP}/.git*
chmod -R g+w ${RSYNC_EXPORT_TMP}
echo "Done."

echo -n "Generating Manifest files "
for mnfst in $(find ${OVERLAY_ROOT}/${RSYNC_EXPORT} -name 'Manifest');
do
	real=${mnfst#${OVERLAY_ROOT}/${RSYNC_EXPORT}/}
	cp ${OVERLAY_ROOT}/${RSYNC_EXPORT}/${real} ${OVERLAY_ROOT}/${RSYNC_EXPORT_TMP}/${real}
done
for ebld in $(find ${OVERLAY_ROOT}/${RSYNC_EXPORT_TMP} -name '*.ebuild');
do
	atom=${ebld#${OVERLAY_ROOT}/${RSYNC_EXPORT_TMP}/}
	if diff -q ${OVERLAY_ROOT}/${RSYNC_EXPORT}/${atom} ${OVERLAY_ROOT}/${RSYNC_EXPORT_TMP}/${atom} > /dev/null 2>&1; then
		# Files didn't change
		echo -n "."
	else
		echo -n "#"
		ebuild $ebld manifest > /dev/null 2>&1 /dev/null
	fi
done
echo " Done."

echo -n "Moving new files to ${RSYNC_EXPORT}... "
rm -rf ${RSYNC_EXPORT}
mv ${RSYNC_EXPORT_TMP} ${RSYNC_EXPORT}
echo "Done."

echo -n "Generating metadata/cache... "
egencache --repo=binet_reseau --update
echo "Done."
