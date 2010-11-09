# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Core tools for BR servers"
HOMEPAGE="http://br.frankiz.net/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="app-admin/logrotate
        app-admin/syslog-ng
	app-portage/layman[git,-subversion]
        dev-vcs/subversion[-webdav-neon]
        sys-process/vixie-cron"
RDEPEND="${DEPEND}"

ELOG="BR-Core : Please configure installed versions of logrotate, syslog-ng and vixie-cron.
BR-Core : Please import SVN standard configuration"

