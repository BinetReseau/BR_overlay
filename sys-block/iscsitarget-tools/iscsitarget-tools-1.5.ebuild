# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Tools for iscsitarget management"
HOMEPAGE="http://www3.amherst.edu/~swplotner/iscsitarget/"
SRC_URI="http://www3.amherst.edu/~swplotner/iscsitarget/download/${PN}/${PN}-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-block/iscsitarget"
RDEPEND="${DEPEND}"

src_install() {
	dodir /etc/iscsi-target/ || die
	insinto /etc/iscsi-target/ || die
	dodoc README
	insopts -m0640
	doins common.conf || die
	doins iet-tools.conf || die
	doins target.conf || die
	insopts -m0550
	doins iet-tools.plx || die
	doins iostat-top.sh || die
	doins status.sh || die
	doins update.sh || die
	doins update-cluster.sh || die
}
