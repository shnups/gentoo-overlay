# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="afff2c9679a697ebfc933360267253a10325269d"
EGO_PN="github.com/${PN}/${PN}"
EGO_VENDOR=(
	"github.com/bmatcuk/doublestar v1.2.2"
	"github.com/bradfitz/iter e8f45d346db8" # indirect
	"github.com/c-bata/go-prompt v0.2.3"
	"github.com/c4milo/unpackit 4ed373e9ef1c"
	"github.com/docker-slim/go-update ed40247aff59"
	"github.com/docker-slim/uilive v0.0.2" # indirect
	"github.com/docker-slim/uiprogress 9d4396e6d40b"
	"github.com/docker/docker ada3c14355ce"
	"github.com/docker/go-connections v0.4.0"
	"github.com/dsnet/compress v0.0.1" # indirect
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/fsouza/go-dockerclient v1.5.0"
	"github.com/google/shlex c34317bd91bf"
	"github.com/gosuri/uilive v0.0.3" # indirect
	"github.com/hooklift/assert 9d1defd6d214" # indirect
	"github.com/klauspost/pgzip v1.2.1" # indirect
	"github.com/mattn/go-colorable v0.1.6" # indirect
	"github.com/mattn/go-runewidth v0.0.8" # indirect
	"github.com/mattn/go-tty v0.0.3" # indirect
	"github.com/pkg/term aa71e9d9e942" # indirect
	"github.com/sirupsen/logrus v1.4.2"
	"github.com/urfave/cli v1.22.1"
	"golang.org/x/sys d5e6a3e2c0ae github.com/golang/sys"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Minify and Secure Docker containers"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=(CHANGELOG.md CONTRIBUTING.md LICENSE README.md WISHLIST.md)

DEPEND=">=dev-lang/go-1.13"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	make build
}

src_install() {
	dobin "${S}/dist_linux/${PN}"
	dobin "${S}/dist_linux/${PN}-sensor"
	einstalldocs
}
