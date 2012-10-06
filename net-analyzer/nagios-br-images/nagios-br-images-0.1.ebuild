# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="More images for Nagios, from BR"
HOMEPAGE="http://br.binets.fr/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="net-analyzer/nagios"
RDEPEND="${DEPEND}"

src_unpack() {
	cp -R "${FILESDIR}/" "${S}/"
}

src_install() {
	insinto /usr/share/nagios/htdocs/images/logos
	doins *
}
