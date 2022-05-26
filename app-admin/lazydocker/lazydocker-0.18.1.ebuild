# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="da650f4384219e13e0dad3de266501aa0b06859c"
EGO_PN="github.com/jesseduffield/lazydocker"
EGO_VENDOR=(
	"github.com/OpenPeeDeeP/xdg 4ba9e1eb294c"
	"github.com/boz/go-throttle fdc4eab740c1"
	"github.com/cloudfoundry/jibber_jabber bcc4c8345a21"
	"github.com/docker/docker 4433bf6"
	"github.com/fatih/color v1.7.0"
	"github.com/go-errors/errors v1.4.2"
	"github.com/golang-collections/collections 604e922904d3"
	"github.com/gookit/color v1.5.0"
	"github.com/imdario/mergo v0.3.8"
	"github.com/integrii/flaggy v1.4.0"
	"github.com/jesseduffield/asciigraph 6d88e39309ee"
	"github.com/jesseduffield/gocui bce22fd599f6"
	"github.com/jesseduffield/yaml b900b7e08b56"
	"github.com/mcuadros/go-lookup 5650f26be767"
	"github.com/mgutz/str v1.2.0"
	"github.com/samber/lo v1.20.0"
	"github.com/sirupsen/logrus v1.4.2"
	"github.com/spkg/bom 59b7046e48ad"
	"github.com/stretchr/testify v1.7.0"
	"golang.org/x/xerrors 5ec99f83aff1 github.com/golang/xerrors"
	"github.com/Microsoft/go-winio v0.4.14" # indirect
	"github.com/davecgh/go-spew v1.1.1" # indirect
	"github.com/docker/distribution 2461543" # indirect
	"github.com/docker/go-connections v0.4.0" # indirect
	"github.com/docker/go-units v0.4.0" # indirect
	"github.com/gdamore/encoding v1.0.0" # indirect
	"github.com/gdamore/tcell/v2 v2.5.1 github.com/gdamore/tcell" # indirect
	"github.com/gogo/protobuf v1.3.1" # indirect
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2" # indirect
	"github.com/lucasb-eyer/go-colorful v1.2.0" # indirect
	"github.com/mattn/go-colorable v0.1.4" # indirect
	"github.com/mattn/go-isatty v0.0.11" # indirect
	"github.com/mattn/go-runewidth v0.0.13" # indirect
	"github.com/moby/term 3f7ff695adc6" # indirect
	"github.com/morikuni/aec 39771216ff4c" # indirect
	"github.com/onsi/ginkgo v1.8.0" # indirect
	"github.com/onsi/gomega v1.5.0" # indirect
	"github.com/opencontainers/go-digest v1.0.0-rc1" # indirect
	"github.com/opencontainers/image-spec v1.0.1" # indirect
	"github.com/pkg/errors v0.9.1" # indirect
	"github.com/pmezard/go-difflib v1.0.0" # indirect
	"github.com/rivo/uniseg v0.2.0" # indirect
	"github.com/xo/terminfo ca9a967f8778" # indirect
	"golang.org/x/exp 39d4317da171 github.com/golang/exp" # indirect
	"golang.org/x/net f5854403a974 github.com/golang/net" # indirect
	"golang.org/x/sys 988cb79eb6c6 github.com/golang/sys" # indirect
	"golang.org/x/term e5f449aeb171 github.com/golang/term" # indirect
	"golang.org/x/text v0.3.7 github.com/golang/text" # indirect
	"golang.org/x/time 9d24e82272b4 github.com/golang/time" # indirect
	"gopkg.in/yaml.v2 v2.2.2 github.com/go-yaml/yaml" # indirect
	"gopkg.in/yaml.v3 496545a6307b github.com/go-yaml/yaml" # indirect
	"gotest.tools/v3 v3.2.0 github.com/gotestyourself/gotest.tools" # indirect
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
