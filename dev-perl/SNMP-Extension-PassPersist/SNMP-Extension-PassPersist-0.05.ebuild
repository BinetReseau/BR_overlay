# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Net-SNMP/Net-SNMP-5.2.0.ebuild,v 1.16 2008/05/13 13:57:46 jer Exp $

inherit perl-module

DESCRIPTION="A SNMP Perl Module"
SRC_URI="http://search.cpan.org/CPAN/authors/id/S/SA/SAPER/${P}.tar.gz"
HOMEPAGE="http://cpansearch.perl.org/src/SAPER/${P}/README"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/perl
        dev-perl/Class-Accessor"

