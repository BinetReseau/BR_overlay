# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools eutils vcs-snapshot
SRC_URI="https://github.com/rezosup/solidircd/tarball/${PV} -> ${P}.tar.gz"

DESCRIPTION="Rezosup ircd"
HOMEPAGE="http://www.rezosup.org"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ssl"

DEPEND="ssl? ( dev-libs/openssl )"
RDEPEND="${RDEPEND}"

src_configure() {
	local myconf
	if use ssl ; then
		myconf="${myconf} --enable-openssl"
	else
		myconf="${myconf} --disable-openssl"
	fi
	econf ${myconf} || die "configure failed"
}

pkg_setup() {
	enewgroup ircd
	enewuser ircd -1 -1 /var/run/ircd ircd
}

src_install() {
	dodoc doc/*.txt

	emake DESTDIR="${D}" PACKAGE=${P} sysconfdir=/etc prefix=/usr exec_prefix=/usr install || die

	dodir /var/run/ircd
	fowners ircd:ircd /var/run/ircd
}
