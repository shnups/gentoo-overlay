# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="0e13712e91c02411d7d9540665cd2258b4623a8f"
EGO_PN="github.com/jesseduffield/lazydocker"
EGO_VENDOR=(
	"github.com/OpenPeeDeeP/xdg 4ba9e1eb294c"
	"github.com/acarl005/stripansi 5a71ef0e047d"
	"github.com/boz/go-throttle fdc4eab740c1"
	"github.com/cloudfoundry/jibber_jabber bcc4c8345a21"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/docker/docker 54dddadc7d5d"
	"github.com/fatih/color v1.7.0"
	"github.com/go-errors/errors v1.0.1"
	"github.com/golang-collections/collections 604e922904d3"
	"github.com/imdario/mergo v0.3.8"
	"github.com/integrii/flaggy v1.4.0"
	"github.com/jesseduffield/asciigraph 6d88e39309ee"
	"github.com/jesseduffield/gocui 57fdcf23edc5"
	"github.com/jesseduffield/yaml b900b7e08b56"
	"github.com/mcuadros/go-lookup 5650f26be767"
	"github.com/mgutz/str v1.2.0"
	"github.com/samber/lo v1.20.0"
	"github.com/sirupsen/logrus v1.4.2"
	"github.com/spkg/bom 59b7046e48ad"
	"github.com/stretchr/testify v1.7.0"
	"golang.org/x/xerrors 5ec99f83aff1 github.com/golang/xerrors"
	"github.com/Azure/go-ansiterm d6e3b3328b78"
	"github.com/Microsoft/go-winio v0.4.14"
	"github.com/docker/distribution v2.7.1"
	"github.com/docker/go-connections v0.4.0"
	"github.com/docker/go-units v0.4.0"
	"github.com/gogo/protobuf v1.3.1"
	"github.com/google/go-cmp v0.3.0"
	"github.com/gorilla/mux v1.7.3"
	"github.com/jesseduffield/termbox-go 1d31d1faa3c9"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2"
	"github.com/mattn/go-colorable v0.1.4"
	"github.com/mattn/go-isatty v0.0.11"
	"github.com/mattn/go-runewidth v0.0.8"
	"github.com/morikuni/aec 39771216ff4c"
	"github.com/onsi/ginkgo v1.8.0"
	"github.com/onsi/gomega v1.5.0"
	"github.com/opencontainers/go-digest v1.0.0-rc1"
	"github.com/opencontainers/image-spec v1.0.1"
	"github.com/pkg/errors v0.8.1"
	"github.com/pmezard/go-difflib v1.0.0"
	"golang.org/x/exp 39d4317da171 github.com/golang/exp"
	"golang.org/x/net c0dbc17a3553 github.com/golang/net"
	"golang.org/x/sys 988cb79eb6c6 github.com/golang/sys"
	"golang.org/x/time 9d24e82272b4 github.com/golang/time"
	"google.golang.org/grpc v1.22.0 github.com/grpc/grpc-go"
	"gopkg.in/yaml.v2 v2.2.2 github.com/go-yaml/yaml"
	"gopkg.in/yaml.v3 496545a6307b github.com/go-yaml/yaml"
	"gotest.tools v2.2.0 github.com/gotestyourself/gotest.tools"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="A simple terminal UI for both docker and docker-compose"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(CODE-OF-CONDUCT.md CONTRIBUTING.md LICENSE README.md)  # docs directory

DEPEND="
	>=app-containers/docker-1.13
	>=app-containers/docker-compose-1.23.2
"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.18"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	local DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
	local ldflags=(
		-X "main.commit=${GIT_COMMIT}"
		-X "main.version=${PV}"
		-X "main.date=${DATE}"
		-X "main.buildSource=portage"
	)

	GOPATH="${G}" go build -v -work -x -ldflags "${ldflags[*]}" "${EGO_PN}" || die
}

src_install() {
	dobin ${PN}
	einstalldocs
}
