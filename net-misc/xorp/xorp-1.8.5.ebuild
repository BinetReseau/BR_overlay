# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils scons-utils toolchain-funcs

EAPI=4

DESCRIPTION="The eXtensible Open Router Platform"
HOMEPAGE="http://www.xorp.org/"
SRC_URI="http://www.xorp.org/releases/${PV}/${P}-src.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="ipv6 -debug logrotate"

DEPEND="dev-libs/openssl
	sys-libs/ncurses
	net-analyzer/net-snmp
	logrotate? ( app-admin/logrotate )"
RDEPEND="${DEPEND}
	net-analyzer/traceroute"

pkg_setup() {
	enewgroup xorp
}

S="${WORKDIR}/xorp"

src_prepare() {
        epatch "${FILESDIR}/${PV}-fix_compilation.patch"
}

src_configure() {
	myesconsargs=(
		prefix="/usr/xorp"
		$(use_scons debug debug yes no)
		$(use_scons ipv6 disable_ipv6 no yes)
		CC="$(tc-getCC)"
		CFLAGS="${CFLAGS:--O1 -pipe} -Wno-unused-result"
		CXXFLAGS="${CXXFLAGS:--O1 -pipe} -Wno-unused-result"
		LINKFLAGS="${LDFLAGS}"
	)

}

src_compile() {
	escons
}

src_install() {
	escons install prefix="${D}/usr"

	insinto /etc/xorp
	newins "${FILESDIR}/config.boot.sample" config.boot.dist
	insinto /etc/xorp/dist
	doins rtrmgr/config/*.boot
	doins rtrmgr/config/*.conf

	newconfd "${FILESDIR}/xorp-confd" xorp
	newinitd "${FILESDIR}/initd-1.8" xorp

	if use logrotate; then
		insinto /etc/logrotate.d
		newins package_files/xorp.logrotate xorp
	fi

	dodoc BUGS ERRATA LICENSE RELEASE_NOTES VERSION
}

pkg_postinst() {
	elog "Only users who belong to the xorp group"
	elog "can run xorpsh in configurational mode."
	elog "You must create /etc/xorp/config.boot,"
	elog "you can use the sample /etc/xorp/config.boot.dist,"
	elog "Or the other samples that are in /etc/xorp/dist"
}
