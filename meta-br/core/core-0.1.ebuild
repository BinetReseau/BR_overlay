# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Core tools for BR servers"
HOMEPAGE="http://br.frankiz.net/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="layman"

DEPEND="app-admin/logrotate
        app-admin/syslog-ng
        app-misc/screen[multiuser]
        layman? ( app-portage/layman[git,-subversion] )
        dev-vcs/subversion[-apache2,-webdav-neon,-dso]
        dev-vcs/git[-webdav]
        sys-apps/portage
        sys-boot/grub
        sys-kernel/hardened-sources
        sys-libs/gdbm[berkdb]
        sys-process/vixie-cron
        "
RDEPEND="${DEPEND}"
# sys-libs/gdbm[berkdb] required by dev-lang/python[gdbm]

ELOG="BR-Core : Please configure installed versions of logrotate, syslog-ng and vixie-cron.
BR-Core : Please import Git standard configuration"

