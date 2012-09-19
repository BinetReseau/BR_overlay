# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Pulls in all packages required for dev.frankiz.net installation."
HOMEPAGE="http://br.frankiz.net"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="meta-br/frankiznet
        app-doc/doxygen
        dev-db/phpmyadmin
        dev-vcs/git[cgi]
        www-apache/mod_wsgi
        www-apps/trac
        www-servers/apache
        net-libs/nodejs
        net-misc/memcached
        dev-lang/lesscss
        dev-php/pecl-apc
        dev-php/pecl-imagick
        dev-php/pecl-memcache
        dev-php/smarty
        "
RDEPEND="${DEPEND}"

