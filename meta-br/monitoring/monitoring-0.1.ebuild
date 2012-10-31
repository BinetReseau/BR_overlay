# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Pulls in all packages required for monitoring installation."
HOMEPAGE="http://br.frankiz.net"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="meta-br/core
        cacti-plugins/weathermap
        dev-db/mysql
        dev-lang/php[gd,-phar,truetype]
        dev-perl/SNMP-Extension-PassPersist
        dev-php/PEAR-Console_Getopt
        net-analyzer/cacti[snmp]
        net-analyzer/cacti-spine
        net-analyzer/hping
        net-analyzer/nagios
        net-analyzer/nagios-br-images
        net-analyzer/nagios-plugins[jabber,ldap,nagios-dns,nagios-ntp,nagios-ping,nagios-ssh,snmp,ssl,ups]
        net-analyzer/nagios-plugins-snmp
        net-analyzer/smokeping[speedy]
        net-analyzer/snmp-services[nagios]
        www-apache/mod_proxy_html
        www-servers/apache
        "
RDEPEND="${DEPEND}"

