# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2
inherit eutils

DESCRIPTION="The eXtensible Open Router Platform"
HOMEPAGE="http://www.xorp.org/"
SRC_URI="http://www.xorp.org/releases/old/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="x86"
IUSE="static debug ipv6 snmp"

DEPEND=">=dev-lang/python-2.0
	dev-libs/openssl
	sys-libs/ncurses
	net-analyzer/net-snmp"
RDEPEND="${DEPEND}
	net-analyzer/traceroute"

pkg_setup() {
	enewgroup xorp
}

src_prepare() {
        epatch "${FILESDIR}/${PV}-fix_compilation.patch"
}


src_configure() {
	econf \
		$(use_enable static) \
		$(use_enable debug) \
		$(use_enable ipv6) \
		$(use_with snmp) \
		--enable-optimize \
		--prefix="/usr/xorp" \
		|| die "econf failed"

	# -Werror prevents building snmp agent...
	find "${S}" -name Makefile -exec sed -i -e '/^C.*FLAGS/s/-Werror//g' '{}' \;
}

src_test() {
	emake check || die "emake check failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	insinto /etc/xorp
	newins rtrmgr/config.boot.sample config.boot.dist

	newconfd "${FILESDIR}/xorp-confd" xorp
	newinitd "${FILESDIR}/xorp-initd" xorp

	dodoc BUGS ERRATA README RELEASE_NOTES TODO VERSION
}

pkg_postinst() {
	elog "Only users who belong to the xorp group"
	elog "can run xorpsh in configurational mode."
	elog "You must create /etc/xorp/config.boot,"
	elog "you can use the sample /etc/xorp/config.boot.dist"
}
