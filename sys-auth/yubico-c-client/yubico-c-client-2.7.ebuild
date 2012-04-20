EAPI=3
inherit eutils autotools

DESCRIPTION="Yubico C client library"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="https://${PN}.googlecode.com/files/ykclient-${PV}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}"

# Tests require an active network connection, we don't want to run them
RESTRICT="test"

S="${WORKDIR}/ykclient-${PV}"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS COPYING NEWS README || die
	find "${D}" -name '*.la' -delete || die
}
