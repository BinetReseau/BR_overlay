# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils autotools git-2

DESCRIPTION="YubiPAM: PAM module for Yubikeys - Patched Version"
HOMEPAGE="https://github.com/Feandil/yubico-pam"
SRC_URI=""
EGIT_REPO_URI="git://github.com/Feandil/yubico-pam.git"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~mips ~x86"
IUSE="-ldap -challenge-response"

DEPEND="virtual/pam
	>=sys-auth/yubico-c-client-999
	challenge-response? ( >=sys-auth/ykpers-999 )
	ldap? ( net-nds/openldap )"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${S}"
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

