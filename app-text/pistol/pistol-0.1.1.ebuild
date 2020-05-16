# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="c8f5dc875eb676bc59efbdd7d36efba737e7378d"
EGO_PN="github.com/doronbehar/${PN}"
EGO_VENDOR=(
	'github.com/adrg/xdg 88e5137d2444'
	'github.com/alecthomas/chroma v0.7.1'
	'github.com/alecthomas/repr d37bc2a10ba1' # indirect
	'github.com/andybalholm/brotli v1.0.0' # indirect
	'github.com/dlclark/regexp2 v1.2.0' # indirect
	'github.com/dustin/go-humanize v1.0.0'
	'github.com/frankban/quicktest v1.9.0' # indirect
	'github.com/galdor/go-cmdline v1.1.0'
	'github.com/klauspost/compress v1.10.1' # indirect
	'github.com/konsorten/go-windows-terminal-sequences v1.0.2' # indirect
	'github.com/mattn/go-isatty v0.0.8' # indirect
	'github.com/mholt/archiver 33320f6f7306'
	'github.com/nwaples/rardecode v1.0.0'
	'github.com/pierrec/lz4 v2.4.1' # indirect
	'github.com/rakyll/magicmime v0.1.0'
	'github.com/sirupsen/logrus v1.4.2'
	'github.com/stretchr/testify v1.4.0' # indirect
	'golang.org/x/sys cb0a6d8edb6c github.com/golang/sys' # indirect
	'gopkg.in/alessio/shellescape.v1 52074bc9df61 github.com/alessio/shellescape'
	'gopkg.in/check.v1 41f04d3bba15 github.com/go-check/check' # indirect
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="General purpose file previewer designed for Ranger, Lf to make scope.sh redundant"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=(LICENSE README.md)

DEPEND=">=dev-lang/go-1.12"


G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"
    export GO111MODULE="on"

	local ldflags=(
		"-s -w"
		"-extldflags '-static'"
		-X "main.Version=${PV}"
	)
	local goargs=(
		-v -work -x
		-asmflags "-trimpath=${S}"
		-gcflags "-trimpath=${S}"
		-ldflags "${ldflags[*]}"
		-o "${PN}"
	)

	go build "${goargs[@]}" "${S}" || die
}

src_install() {
	dobin ${PN}
	einstalldocs
}
