# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="800398060434ce8dfda6b4d182b72e2a9724e9f6"
EGO_PN="github.com/wagoodman/${PN}"
EGO_VENDOR=(
	"github.com/Microsoft/go-winio v0.4.14" # indirect
	"github.com/awesome-gocui/gocui v1.1.0"
	"github.com/awesome-gocui/keybinding 864552bd36b7"
	"github.com/cespare/xxhash v1.1.0"
	"github.com/docker/cli 016a3232168d"
	"github.com/docker/distribution v2.8.2" # indirect
	"github.com/docker/docker v24.0.2"
	"github.com/docker/go-connections v0.4.0" # indirect
	"github.com/docker/go-units v0.4.0" # indirect
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/fatih/color v1.7.0"
	"github.com/gogo/protobuf v1.3.2" # indirect
	"github.com/google/uuid v1.1.1"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2" # indirect
	"github.com/logrusorgru/aurora 94edacc10f9b"
	"github.com/lunixbochs/vtclean v1.0.0"
	"github.com/magiconair/properties v1.8.1" # indirect
	"github.com/mattn/go-colorable v0.1.2" # indirect
	"github.com/mattn/go-isatty v0.0.9" # indirect
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/moby/term v0.5.0" # indirect
	"github.com/morikuni/aec v1.0.0" # indirect
	"github.com/opencontainers/go-digest v1.0.0-rc1" # indirect
	"github.com/opencontainers/image-spec v1.0.2" # indirect
	"github.com/pelletier/go-toml v1.4.0" # indirect
	"github.com/phayes/permbits 39d7c581d2ee"
	"github.com/pkg/errors v0.9.1" # indirect
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sirupsen/logrus v1.4.2"
	"github.com/spf13/afero v1.2.2"
	"github.com/spf13/cobra v0.0.5"
	"github.com/spf13/jwalterweatherman v1.1.0" # indirect
	"github.com/spf13/pflag v1.0.5" # indirect
	"github.com/spf13/viper v1.4.0"
	"github.com/stretchr/testify v1.4.0" # indirect
	"golang.org/x/net v0.11.0 github.com/golang/net"
	"gopkg.in/yaml.v2 v2.2.8 github.com/go-yaml/yaml" # indirect
	"gotest.tools v2.2.0 github.com/gotestyourself/gotest.tools" # indirect
	"gotest.tools v3.5.0 github.com/gotestyourself/gotest.tools" # indirect
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="A tool for exploring each layer in a docker image"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=(LICENSE README.md)

BDEPEND=">=dev-lang/go-1.13"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"

	local DATE=`date "+%Y-%m-%dT%H:%M:%S%z"`
	local ldflags=(
		"-s -w"
		"-extldflags '-static'"
		-X "main.version=${PV}"
		-X "main.commit=${GIT_COMMIT}"
		-X "main.buildTime=${DATE}"
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
	dobin ${PN}/${PN}
	einstalldocs
}
