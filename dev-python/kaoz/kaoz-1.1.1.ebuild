# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=(python2_6 python2_7)

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Free notifier for IRC."
HOMEPAGE="https://github.com/BinetReseau/kaoz"
SRC_URI="https://github.com/BinetReseau/kaoz/tarball/${PV} -> ${P}.tar.gz"
PYTHON_MODNAME="kaoz"

LICENSE="MIT-like"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="dev-python/irc"

python_install_all() {
	distutils-r1_python_install_all

	exeinto /etc/init.d
	doexe initd/kaoz

	insinto /etc
	newins kaoz.example.conf kaoz.conf

	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		insinto "/usr/share/doc/${PF}/examples"
		doins -r clients/*
	fi
}
