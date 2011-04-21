# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils

DESCRIPTION="Rezosup ircd"
HOMEPAGE="http://www.rezosup.org http://irc"
SRC_URI="http://rezosup.org/download/ircd/rzv2/rz2e-cho7.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE="ssl"

DEPEND="ssl? ( dev-libs/openssl )"
RDEPEND="${RDEPEND}"

EXPANDED_DIR="rz2e-cho7/solidircd-stable"

src_unpack() {
	unpack ${A}
	cd "rz2e-cho7"
	unpack ./solidircd-stable3.4.8.tar.gz
	cd "solidircd-stable"
	epatch ../patch-rz-2e-cho7.patch || die "Patch failed"
	epatch ${FILESDIR}/00-rezosup-ircd-gentoo_make.patch || die "Patch failed"
	epatch ${FILESDIR}/10-rezosup-ircd-paths.patch || die "Patch failed"
	epatch ${FILESDIR}/20-rezosup-ircd-fclose.patch || die "Patch failed"
	epatch ${FILESDIR}/30-rezosup-ircd-3.4.8.2e-maxconnections.patch || die "Patch failed"
	epatch ${FILESDIR}/40-rezosup-ircd-64bits.patch || die "Patch failed"
	epatch ${FILESDIR}/50-rezosup-ircd-3.4.8.2e-ircd.conf.patch || die "Patch failed"
	epatch ${FILESDIR}/60-rezosup-ircd-memset.patch || die "Patch failed"
}

src_compile() {
	local myconf
	cd "${EXPANDED_DIR}"
	if use ssl ; then
		myconf="${myconf} --enable-openssl"
	else
		myconf="${myconf} --disable-openssl"
	fi
	econf ${myconf} || die "configure failed"

	emake || die "make failed"
}

pkg_setup() {
	enewgroup ircd
	enewuser ircd -1 -1 /var/run/ircd ircd
}

src_install() {
	cd "${EXPANDED_DIR}"
	dodoc doc/*.txt

	emake INSTALL_DIR="${WORKDIR}/${EXPANDED_DIR}/built/" install || die "emake failed"

	dodir /var/run/ircd
	fowners ircd:ircd /var/run/ircd

	cd "${WORKDIR}/${EXPANDED_DIR}/built"

	doinitd ${FILESDIR}/ircd

	# Binaries
	dobin ircd
	newbin mkpasswd mkpasswd-ircd

	# Config
	keepdir etc/ircd
	insinto etc/ircd
	doins ircd.motd
	doins opers.txt
	newins reference.conf ircd.conf.default
	newins template.conf ircd.conf
}
