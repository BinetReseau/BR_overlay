# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=(python2_6 python2_7)

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Free notifier for IRC."
HOMEPAGE="https://github.com/BinetReseau/kaoz"
SRC_URI="https://github.com/BinetReseau/kaoz/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT-like"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-python/irc-5.0.1"

python_install_all() {
	distutils-r1_python_install_all

	exeinto /etc/init.d
	doexe initd/kaoz

	insinto /etc
	newins kaoz.example.conf kaoz.conf
}
