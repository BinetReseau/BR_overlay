# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils vcs-snapshot

SRC_URI="https://github.com/BinetReseau/less.js/tarball/${PV} -> ${P}.tar.gz"

DESCRIPTION="Leaner CSS"
HOMEPAGE="http://lesscss.org"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=">=net-libs/nodejs-0.4.0"
RDEPEND="${RDEPEND}"

src_install() {
        dodir /usr/bin
        dobin bin/lessc

        dodir /usr/lib/less
        cp -R "${S}/lib/less/" "${D}/usr/lib/" || die "Install failed!"
}
