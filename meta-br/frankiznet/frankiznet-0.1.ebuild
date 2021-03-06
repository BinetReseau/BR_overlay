# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Pulls in all packages required for frankiz.net installation."
HOMEPAGE="http://br.frankiz.net"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="meta-br/core
        www-servers/apache
        dev-db/mysql
        dev-lang/php[apache2,cli,crypt,ctype,curl,json,mysqli,-phar,posix,session,simplexml,ssl,unicode,xml,zlib]
        net-libs/nodejs
        net-misc/memcached
        dev-lang/lesscss
        dev-php/pecl-apc
        dev-php/pecl-imagick
        dev-php/pecl-memcache
        dev-php/smarty
        "
RDEPEND="${DEPEND}"

