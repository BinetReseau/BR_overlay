# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Common tools for BR servers"
HOMEPAGE="http://br.frankiz.net/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="meta-br/core
        meta-br/svn_verify
        app-admin/sudo
        app-admin/syslog-ng
        app-backup/hdup
        app-editors/vim[vim-pager]
        app-misc/screen
        app-portage/eix
        app-portage/euses
        app-portage/genlop
        app-portage/gentoolkit
        app-portage/portage-utils
        app-shells/bash-completion
        app-shells/zsh
        app-shells/zsh-completion
        net-analyzer/net-snmp
        net-analyzer/netcat
        net-firewall/iptables
        sys-process/htop
        sys-process/iotop
        sys-process/lsof"
RDEPEND="${DEPEND}"

ELOG="BR-Common : Please configure installed versions of iptables and net-snmp"
