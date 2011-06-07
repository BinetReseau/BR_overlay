# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="An irc bot that alerts you to nagios changes"
HOMEPAGE="http://www.vanheusden.com/nagircbot"
SRC_URI="http://www.vanheusden.com/nagircbot/${P}.tgz"

EAPI=1
inherit eutils

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="net-analyzer/nagios-core"

src_unpack() {
        unpack ${A}
        cd "${S}"

        epatch "${FILESDIR}"/${P}-flapping.patch
}


src_install() {
	dodir /usr/bin
	cp "${S}"/nagircbot "${D}"/usr/bin

	dodir /etc/init.d
	dodir /etc/conf.d
	cp "${FILESDIR}"/conf "${D}"/etc/conf.d/nagircbot
	cp "${FILESDIR}"/init "${D}"/etc/init.d/nagircbot
}
