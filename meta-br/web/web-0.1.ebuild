# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Pulls in all packages required for BR web servers."
HOMEPAGE="http://br.frankiz.net"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="meta-br/core
        meta-br/svn_verify
        www-server/apache
        dev-lang/php
        "
RDEPEND="${DEPEND}"

