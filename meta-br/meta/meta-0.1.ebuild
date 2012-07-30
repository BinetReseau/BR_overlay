# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Meta package pulling in all br-used packages."
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="-tv -frankiz"

DEPEND="meta-br/core
        meta-br/common
        tv? ( meta-br/tv )
        frankiz? ( meta-br/frankiz )
        "
RDEPEND="${DEPEND}"

