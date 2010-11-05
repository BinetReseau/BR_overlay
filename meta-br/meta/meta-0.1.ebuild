# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Meta package pulling in all br-used packages."
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="-tv -web"

DEPEND="meta-br/core
        meta-br/common
	meta-br/svn-verify
        tv? ( meta-br/tv )
        web? ( meta-br/web )
        "
RDEPEND="${DEPEND}"

