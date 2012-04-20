EAPI=3
inherit eutils autotools git-2

DESCRIPTION="Yubico C client library"
HOMEPAGE="http://code.google.com/p/yubico-c-client/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/Yubico/yubico-c-client.git"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}"

# Tests require an active network connection, we don't want to run them
RESTRICT="test"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS COPYING NEWS README || die
	find "${D}" -name '*.la' -delete || die
}
