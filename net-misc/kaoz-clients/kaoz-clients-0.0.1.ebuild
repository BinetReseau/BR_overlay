# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit vcs-snapshot

DESCRIPTION="Client scripts for Kaoz, a free notifier for IRC."
HOMEPAGE="https://github.com/BinetReseau/kaoz-clients"
SRC_URI="https://github.com/BinetReseau/kaoz-clients/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT-like"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="git nagios nut-ups pam"

DEPEND="net-misc/socat"
RDEPEND="${RDEPEND}"

src_install() {
	insinto /usr/share/${PN}/style
	doins style/*

	exeinto /usr/share/${PN}/pipes
	doexe pipes/*

	dodoc README.md

	if use git ; then
		exeinto /usr/share/${PN}/git
		doexe git/format-message git/hook-post-receive
	fi

	if use nagios ; then
		exeinto /usr/share/${PN}/nagios
		doexe nagios/format-message
		insinto /usr/share/${PN}/nagios
		doins nagios/commands.cfg nagios/contacts.cfg
	fi

	if use nut-ups ; then
		exeinto /usr/share/${PN}/nut-ups
		doexe nut-ups/format-message
	fi

	if use pam ; then
		exeinto /usr/share/${PN}/pam
		doexe pam/format-message pam/notify-message
		insinto /usr/share/${PN}/pam
		doins pam/sudo pam/su pam/system-login
	fi
}
