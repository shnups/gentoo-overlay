# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="a5cb54043b3ab3cf747165aad745f19db680434e"
EGO_PN="github.com/${PN}/${PN}"
EGO_VENDOR=(
	"github.com/Microsoft/hcsshim v0.8.9" # indirect
	"github.com/PuerkitoBio/goquery v1.5.1" # indirect
	"github.com/andybalholm/cascadia v1.2.0" # indirect
	"github.com/antchfx/htmlquery v1.2.3" # indirect
	"github.com/antchfx/xmlquery v1.2.4" # indirect
	"github.com/antchfx/xpath v1.1.8" # indirect
	"github.com/bmatcuk/doublestar v1.3.0"
	"github.com/bradfitz/iter e8f45d346db8" # indirect
	"github.com/c-bata/go-prompt v0.2.3"
	"github.com/c4milo/unpackit 4ed373e9ef1c"
	"github.com/containerd/containerd v1.3.4" # indirect
	"github.com/containerd/continuity d3ef23f19fbb" # indirect
	"github.com/cpuguy83/go-md2man v2.0.0" # indirect
	"github.com/docker-slim/go-update ed40247aff59"
	"github.com/docker-slim/uilive v0.0.2" # indirect
	"github.com/docker-slim/uiprogress 9d4396e6d40b"
	"github.com/docker/docker ac7306503d23"
	"github.com/docker/go-connections v0.4.0"
	"github.com/dsnet/compress v0.0.1" # indirect
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/fsouza/go-dockerclient v1.6.5"
	"github.com/getkin/kin-openapi v0.19.0"
	"github.com/ghodss/yaml v1.0.0"
	"github.com/gocolly/colly v2.0.1"
	"github.com/golang/protobuf v1.4.2" # indirect
	"github.com/google/shlex e7afc7fbc510"
	"github.com/gorilla/websocket v1.4.2"
	"github.com/gosuri/uilive v0.0.3" # indirect
	"github.com/hooklift/assert 9d1defd6d214" # indirect
	"github.com/klauspost/compress v1.10.6" # indirect
	"github.com/klauspost/pgzip v1.2.4" # indirect
	"github.com/mattn/go-colorable v0.1.6" # indirect
	"github.com/mattn/go-runewidth v0.0.9" # indirect
	"github.com/mattn/go-tty v0.0.3" # indirect
	"github.com/opencontainers/go-digest v1.0.0" # indirect
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/term c3ffed290a03" # indirect
	"github.com/sirupsen/logrus v1.6.0"
	"github.com/syndtr/gocapability d98352740cb2"
	"github.com/ulikunitz/xz v0.5.7" # indirect
	"github.com/urfave/cli v1.22.4"
	"golang.org/x/net c89045814202 github.com/golang/net"
	"golang.org/x/sync 43a5402ce75a github.com/golang/sync" # indirect
	"golang.org/x/sys 0e2f3a69832c github.com/golang/sys"
	"google.golang.org/appengine v1.6.6 github.com/golang/appengine" # indirect
	"google.golang.org/genproto e9a78aa275b7 github.com/googleapis/go-genproto" # indirect
	"google.golang.org/grpc v1.29.1 github.com/grpc/grpc-go" # indirect
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
