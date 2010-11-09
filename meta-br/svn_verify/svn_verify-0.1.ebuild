# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Verification of SVN installation on BR servers"
HOMEPAGE="http://br.frankiz.net/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="meta-br/core"
RDEPEND="${DEPEND}"

src_install () {
        if ! [ -e /root/.svn/ ]; then
                die "Les binaires SVN-root (/root/bin) ne sont pas installés, merci de les installer avant de continuer l'installation";
        fi;
        if ! [ -e /etc/.svn/ ]; then
                die "Les fichiers de configuration standard du BR ne sont pas installés, merci de faire un svn_fetch avant de continuer l'installation";
        fi;
}

