# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="59907e093e5ab7e294df9c4affb2e8767f9a5bd1"
EGO_PN="github.com/diamondburned/${PN}"
EGO_VENDOR=(
	"github.com/Xuanwo/go-locale v0.1.0"
	"github.com/alecthomas/chroma v0.7.1"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/diamondburned/arikawa v0.9.6"
	"github.com/diamondburned/handy 8c5fb8c91329"
	"github.com/diamondburned/ningen 1c71b160c542"
	"github.com/disintegration/imaging v1.6.2"
	"github.com/goodsign/monday v1.0.0"
	"github.com/gotk3/gotk3 1bfadb2ac3e6"
	"github.com/logrusorgru/aurora e9ef32dff381"
	"github.com/markbates/pkger v0.15.1"
	"github.com/mattn/go-isatty v0.0.12" # indirect
	"github.com/petermattis/goid b0b1615b78e5" # indirect
	"github.com/pkg/errors v0.9.1"
	"github.com/sasha-s/go-deadlock v0.2.0"
	"github.com/sergi/go-diff v1.1.0" # indirect
	"github.com/skratchdot/open-golang eef842397966"
	"github.com/stretchr/objx v0.1.1" # indirect
	"github.com/yuin/goldmark v1.1.30"
	"github.com/zalando/go-keyring 667557018717"
	"golang.org/x/sync 43a5402ce75a github.com/golang/sync"
	"golang.org/x/sys 85ca7c5b95cd github.com/golang/sys" # indirect
	"gopkg.in/yaml.v2 v2.2.8 github.com/go-yaml/yaml" # indirect
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="A lightweight Discord client which uses GTK3 for the user interface"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(LICENSE README.md)

# build dependencies: go (1.13+), gtk, libhandy, pkgconfig (refer to shell.nix)
DEPEND="
    >=dev-lang/go-1.13
	x11-libs/gtk+:3
    dev-util/pkgconfig
    gui-libs/libhandy
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-lang/go-1.13
    dev-util/pkgconfig
	x11-libs/gtk+:3
    gui-libs/libhandy
"


G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_prepare() {
    sed -i "s/0.0.2/${PV}/g" shell.nix
    default
}

# src_compile() {
# 	local BUILD_TIME="$(date -u '+%Y-%m-%d_%I:%M:%S%p')"

#     local ldflags=(
#         -X "${EGO_PN}/pkg/version.appVersionTag=${PV}"
#         -X "${EGO_PN}/pkg/version.appVersionRev=${GIT_COMMIT}"
#         -X "${EGO_PN}/pkg/version.appVersionTime=${BUILD_TIME}"
#     )

#     local goargs=(
#         -trimpath
#         -ldflags "${ldflags[*]}"
#         -a -tags 'netgo osusergo'
#         -o "${bin}"
#         -v -work -x
#     )

#     GOPATH="${G}" go build "${goargs[@]}" "${S}/cmd/${bin}" || die
# }

# src_install() {
# 	dobin "${S}/${PN}" "${S}/${PN}-sensor"
# 	einstalldocs
# }
