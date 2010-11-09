# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="All packages required for tvbr"
HOMEPAGE="http://tv.eleves.polytechnique.fr/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="meta-br/core
        meta-br/svn_verify
        net-misc/xorp"
RDEPEND="${DEPEND}"

