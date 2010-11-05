# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

DESCRIPTION="Hardware related tools"
HOMEPAGE="http://br.frankiz.net/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="meta-br/core
	meta-br/svn-verify
        sys-apps/sdparm
        sys-apps/hdparm
        sys-apps/smartmontools
        sys-apps/pciutils
        sys-apps/module-init-tools
        sys-apps/iproute2
        sys-apps/ethtool"
RDEPEND="${DEPEND}"

