# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="86fbd29ab3549fa564e87e4770178480cb0542d3"
EGO_PN="github.com/${PN}/${PN}"
EGO_VENDOR=(
	"github.com/PuerkitoBio/goquery v1.5.1" # indirect
	"github.com/andybalholm/cascadia v1.2.0" # indirect
	"github.com/antchfx/htmlquery v1.2.3" # indirect
	"github.com/antchfx/xmlquery v1.2.4" # indirect
	"github.com/antchfx/xpath v1.1.8" # indirect
	"github.com/armon/go-radix v1.0.0"
	"github.com/bmatcuk/doublestar v1.3.4"
	"github.com/bmatcuk/doublestar v3.0.0"
	"github.com/bradfitz/iter e8f45d346db8" # indirect
	"github.com/c-bata/go-prompt v0.2.3"
	"github.com/c4milo/unpackit 4ed373e9ef1c"
	"github.com/compose-spec/compose-go a7e1bc322970"
	"github.com/docker-slim/go-update ed40247aff59"
	"github.com/docker-slim/uilive v0.0.2" # indirect
	"github.com/docker-slim/uiprogress 9d4396e6d40b"
	"github.com/docker/docker v20.10.12"
	"github.com/docker/go-connections v0.4.0"
	"github.com/dsnet/compress v0.0.1" # indirect
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/fatih/color v1.13.0"
	"github.com/fsouza/go-dockerclient v1.7.4"
	"github.com/getkin/kin-openapi v0.19.0"
	"github.com/ghodss/yaml v1.0.0"
	"github.com/gocolly/colly v2.0.1"
	"github.com/google/go-containerregistry v0.8.0"
	"github.com/google/shlex e7afc7fbc510"
	"github.com/gorilla/websocket v1.4.2"
	"github.com/gosuri/uilive v0.0.3" # indirect
	"github.com/hooklift/assert 9d1defd6d214" # indirect
	"github.com/klauspost/pgzip v1.2.4" # indirect
	"github.com/mattn/go-runewidth v0.0.9" # indirect
	"github.com/mattn/go-tty v0.0.3" # indirect
	"github.com/moby/term 3f7ff695adc6"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/term c3ffed290a03" # indirect
	"github.com/robertkrimen/otto b87d35c0b86f"
	"github.com/sirupsen/logrus v1.8.1"
	"github.com/syndtr/gocapability 42c35b437635"
	"github.com/ulikunitz/xz v0.5.7" # indirect
	"github.com/urfave/cli v2.3.0"
	"golang.org/x/net fe4d6282115f github.com/golang/net"
	"golang.org/x/sys 1d35b9e2eb4e github.com/golang/sys"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Minify and Secure Docker containers"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(CHANGELOG.md CONTRIBUTING.md LICENSE README.md WISHLIST.md)

BDEPEND=">=dev-lang/go-1.13"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	local BUILD_TIME="$(date -u '+%Y-%m-%d_%I:%M:%S%p')"

	for bin in "${PN}" "${PN}-sensor"
	do
		local ldflags=(
			-X "${EGO_PN}/pkg/version.appVersionTag=${PV}"
			-X "${EGO_PN}/pkg/version.appVersionRev=${GIT_COMMIT}"
			-X "${EGO_PN}/pkg/version.appVersionTime=${BUILD_TIME}"
		)

		local goargs=(
			-trimpath
			-ldflags "${ldflags[*]}"
			-a -tags 'netgo osusergo'
			-o "${bin}"
			-v -work -x
		)

		GOPATH="${G}" go build "${goargs[@]}" "${S}/cmd/${bin}" || die
	done
}

src_install() {
	dobin "${S}/${PN}" "${S}/${PN}-sensor"
	einstalldocs
}
