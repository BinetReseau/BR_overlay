# Copyright 1999-2006 Binet Réseau
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

#"S=${WORKDIR}/${PN}


DESCRIPTION="qRezix : a xNet client made in Qt"
HOMEPAGE="http://frankiz/"

# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="ftp://miroir.eleves.polytechnique.fr/xshare/qrezix-2.0.0.tar.bz2"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="x86 amd64"
IUSE="chat mainui tray notifier xnet doc"

RDEPEND=">=x11-libs/qt-4.1.0"
DEPEND="doc? ( app-doc/doxygen )
	>=x11-libs/qt-4.1.0"
		
DEFINES="NO_JABBER"

use_module() {
	if ! use $1; then
		DEFINES="${DEFINES} NO_$2"
	fi
	return 0; 
}

src_compile() {
	ebegin "Cleaning sources"
	eend 0
	cd work/qrezix
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
	cd work/qrezix
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

