# Copyright 1999-2005 Binet Réseau
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit subversion

DESCRIPTION="qRezix : a xNet client made in Qt"
HOMEPAGE="http://frankiz/"

# Point to any required sources; these will be automatically downloaded by
# Portage.
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="-*"
IUSE="chat mainui tray notifier xnet doc"

RDEPEND=">=x11-libs/qt-4.3.4"
DEPEND="doc? ( app-doc/doxygen )
	>=x11-libs/qt-4.3.4"
		
ESVN_REPO_URI="svn://skinwel/qrezix/trunk/"

DEFINES="NO_JABBER"

pkg_setup() {
    if ! built_with_use x11-libs/qt debug; then
	   eerror "This is a development package,"
       eerror "so it requires x11-libs/qt compiled with debug support."
       eerror "Please reemerge x11-libs/qt	with USE=\"debug\"."
       die "Please reemerge	x11-libs/qt with USE=\"debug\"."
    fi
}

																

use_module() {
	if ! use $1; then
		DEFINES="${DEFINES} NO_$2"
	fi
	return 0; 
}

src_compile() {
	ebegin "Cleaning sources"
	find -type d -name '.svn' -exec rm -rf {} ";" 2>> /dev/null >> /dev/null
	eend 0
	use_module chat CHAT
	use_module mainui MAINUI
	use_module tray TRAYICON
	use_module notifier NOTIFIER
	use_module xnet XNET
	qmake "DEFINES=${DEFINES}" "PREFIX=/usr" "DEST=${D}" qrezix.pro || die
	make || die
	if use doc; then
		doxygen Doxyfile
	fi
}

src_install() {
    qmake "DEFINES=${DEFINES}" "PREFIX=/usr" "DEST=${D}" qrezix.pro || die
	make install || die
    if use doc; then
        insinto /usr/share/doc/${PF}
		dohtml -r doc/html/*
    fi
	insinto /usr/include/qrezix/
	doins *.pri
	insinto /usr/include/qrezix/core
	doins core/*.h
	doins core/Rzx*
	doins core/defaults.h
	if use mainui; then
		insinto /usr/include/qrezix/modules/mainui
		doins modules/mainui/*.h
		doins modules/mainui/Rzx*
	fi
}
