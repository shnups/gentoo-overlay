# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="09957bdff9f2e2680d58afb1a72d470d1fd20879"
EGO_PN="github.com/doronbehar/${PN}"
EGO_VENDOR=(
	'github.com/adrg/xdg v0.2.1'
	'github.com/alecthomas/chroma v0.7.3'
	'github.com/alecthomas/repr d37bc2a10ba1' # indirect
	'github.com/alessio/shellescape v1.2.2' # indirect
	'github.com/andybalholm/brotli v1.0.0' # indirect
	'github.com/dustin/go-humanize v1.0.0'
	'github.com/frankban/quicktest v1.9.0' # indirect
	'github.com/galdor/go-cmdline v1.1.0'
	'github.com/klauspost/compress v1.10.8' # indirect
	'github.com/klauspost/pgzip v1.2.4' # indirect
	'github.com/mholt/archiver 33320f6f7306'
	'github.com/nwaples/rardecode v1.1.0'
	'github.com/pierrec/lz4 v2.5.2' # indirect
	'github.com/rakyll/magicmime v0.1.0'
	'github.com/sirupsen/logrus v1.6.0'
	'github.com/stretchr/testify v1.4.0' # indirect
	'github.com/ulikunitz/xz v0.5.7' # indirect
	'golang.org/x/sys 6fdc65e7d980 github.com/golang/sys' # indirect
	'gopkg.in/alessio/shellescape.v1 52074bc9df61 github.com/alessio/shellescape'
	'gopkg.in/check.v1 41f04d3bba15 github.com/go-check/check' # indirect
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="General purpose file previewer designed for Ranger/Lf to make scope.sh redundant"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=(LICENSE README.adoc)

DEPEND=">=dev-lang/go-1.12"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	emake || die
}

src_install() {
	dobin ${PN}
	einstalldocs
}
