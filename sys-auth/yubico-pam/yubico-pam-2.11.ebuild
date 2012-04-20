# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils autotools

DESCRIPTION="YubiPAM: PAM module for Yubikeys"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="https://${PN}.googlecode.com/files/pam_yubico-${PV}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="amd64 ~mips x86"
IUSE="-ldap -challenge-response"

DEPEND="virtual/pam
	>=sys-auth/yubico-c-client-2.4
	>=sys-auth/libyubikey-1.5
	challenge-response? ( >=sys-auth/ykpers-1 )
	ldap? ( net-nds/openldap )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/pam_yubico-${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	#mv build-aux/config.rpath .
	#rm -r build-aux m4/lt* m4/libtool.m4 configure Makefile.in aclocal.m4
	#mkdir build-aux
	#mv config.rpath build-aux
}

src_prepare() {
	epatch "${FILESDIR}/${PV}-configurefix.patch"
	epatch "${FILESDIR}/${PV}-AddOtpValidation.patch"
	eautoreconf
}

src_configure() {
	econf \
		$(use_with challenge-response cr) \
		$(use_with ldap)
}

src_install() {
	cd "${S}"
	emake install DESTDIR="${D}" PAMDIR="$(get_libdir)/security" || die
	dodoc AUTHORS ChangeLog NEWS README doc/* || die
	find "${D}" -type f -name \*.a -delete
	find "${D}" -type f -name \*.la -delete
}

