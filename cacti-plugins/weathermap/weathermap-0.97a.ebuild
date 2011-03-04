# Copyright 2008-2010 Chris Gianelloni
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit eutils cacti-plugins

SRC_URI="http://www.network-weathermap.com/files/php-${P}.zip"

LICENSE="GPL-2"
# /var/www/localhost/htdocs/cacti/plugins/weathermap/output needs to be +w
KEYWORDS="~amd64 ~x86"
S=${WORKDIR}/${PN}
