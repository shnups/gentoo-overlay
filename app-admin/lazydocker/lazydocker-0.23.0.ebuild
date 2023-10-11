# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="cce9d40f43c08c42a401135467aec4500895b21a"
EGO_PN="github.com/jesseduffield/lazydocker"
EGO_VENDOR=(
	"github.com/OpenPeeDeeP/xdg 4ba9e1eb294c"
	"github.com/boz/go-throttle fdc4eab740c1"
	"github.com/cloudfoundry/jibber_jabber bcc4c8345a21"
	"github.com/docker/cli v20.10.15"
	"github.com/docker/docker 29a0e76e6495"
	"github.com/fatih/color v1.10.0"
	"github.com/go-errors/errors v1.4.2"
	"github.com/gookit/color v1.5.0"
	"github.com/imdario/mergo v0.3.8"
	"github.com/integrii/flaggy v1.4.0"
	"github.com/jesseduffield/asciigraph 6d88e39309ee"
	"github.com/jesseduffield/gocui ef06450f4fdc"
	"github.com/jesseduffield/kill bfbe04675d10"
	"github.com/jesseduffield/lazycore 718a4caea996"
	"github.com/jesseduffield/yaml b900b7e08b56"
	"github.com/mattn/go-runewidth v0.0.14"
	"github.com/mcuadros/go-lookup 5650f26be767"
	"github.com/mgutz/str v1.2.0"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/samber/lo v1.31.0"
	"github.com/sasha-s/go-deadlock v0.3.1"
	"github.com/sirupsen/logrus v1.4.2"
	"github.com/spkg/bom 59b7046e48ad"
	"github.com/stretchr/testify v1.8.0"
	"golang.org/x/xerrors 5ec99f83aff1 github.com/golang/xerrors"
	"github.com/Microsoft/go-winio v0.4.14" # indirect
	"github.com/davecgh/go-spew v1.1.1" # indirect
	"github.com/docker/distribution v2.8.2" # indirect
	"github.com/docker/docker-credential-helpers v0.8.0" # indirect
	"github.com/docker/go-connections v0.4.0" # indirect
	"github.com/docker/go-units v0.4.0" # indirect
	"github.com/fvbommel/sortorder v1.1.0" # indirect
	"github.com/gdamore/encoding v1.0.0" # indirect
	"github.com/gdamore/tcell/v2 v2.5.3 github.com/gdamore/tcell" # indirect
	"github.com/goccy/go-yaml v1.11.0"
	"github.com/gogo/protobuf v1.3.2" # indirect
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2" # indirect
	"github.com/lucasb-eyer/go-colorful v1.2.0" # indirect
	"github.com/mattn/go-colorable v0.1.8" # indirect
	"github.com/mattn/go-isatty v0.0.12" # indirect
	"github.com/moby/term 3f7ff695adc6" # indirect
	"github.com/morikuni/aec 39771216ff4c" # indirect
	"github.com/onsi/ginkgo v1.8.0" # indirect
	"github.com/onsi/gomega v1.5.0" # indirect
	"github.com/opencontainers/go-digest v1.0.0-rc1" # indirect
	"github.com/opencontainers/image-spec v1.0.2" # indirect
	"github.com/petermattis/goid b0b1615b78e5" # indirect
	"github.com/pkg/errors v0.9.1" # indirect
	"github.com/rivo/uniseg v0.4.2" # indirect
	"github.com/xo/terminfo ca9a967f8778" # indirect
	"golang.org/x/exp 39d4317da171 github.com/golang/exp" # indirect
	"golang.org/x/net v0.17.0 github.com/golang/net" # indirect
	"golang.org/x/sys v0.13.0 github.com/golang/sys" # indirect
	"golang.org/x/term v0.13.0 github.com/golang/term" # indirect
	"golang.org/x/text v0.13.0 github.com/golang/text" # indirect
	"golang.org/x/time 9d24e82272b4 github.com/golang/time" # indirect
	"gopkg.in/yaml.v2 v2.2.2 github.com/go-yaml/yaml" # indirect
	"gopkg.in/yaml.v3 v3.0.1 github.com/go-yaml/yaml" # indirect
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
