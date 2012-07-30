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
IUSE="-yubico -nut"

DEPEND="meta-br/core
        app-admin/sudo
        app-admin/syslog-ng
        app-backup/hdup
        app-editors/nano
        app-editors/vim[vim-pager]
        app-misc/colordiff
        app-portage/eix
        app-portage/euses
        app-portage/genlop
        app-portage/gentoolkit
        app-portage/portage-utils
        app-shells/bash-completion
        app-shells/zsh
        app-shells/zsh-completion
        mail-mta/postfix[-ldap,berkdb]
        net-analyzer/gnu-netcat
        net-analyzer/net-snmp
        net-analyzer/netcat
        net-dns/bind-tools
        net-firewall/iptables
        net-misc/ntp
        net-misc/socat
        sys-apps/ethtool
        sys-apps/hdparm
        sys-apps/iproute2
        sys-apps/less
        sys-apps/lm_sensors
        sys-apps/lshw
        sys-apps/mlocate
        sys-apps/module-init-tools
        sys-apps/most
        sys-apps/pciutils
        sys-apps/sdparm
        sys-apps/smartmontools
        sys-process/htop
        sys-process/iotop
        dev-util/strace
        yubico? ( sys-auth/yubico-pam[-ldap] )
        nut? ( sys-power/nut[usb] )
        sys-process/htop
        sys-process/lsof"
RDEPEND="${DEPEND}"

ELOG="BR-Common : Please configure installed versions of iptables and net-snmp"
