# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="mxnet : a simple CLI xNet client"
HOMEPAGE="http://www.polytechnique.fr/eleves/binets/reseau/"
SRC_URI="ftp://miroir.eleves.polytechnique.fr/xshare/mxnet-0.9.4.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-libs/readline
	sys-libs/ncurses"
RDEPEND="sys-libs/readline
	sys-libs/ncurses"

src_unpack() {
	unpack ${A}
	cd "${S}"

	einfo "Regenerating autotools files..."
	./bootstrap
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
