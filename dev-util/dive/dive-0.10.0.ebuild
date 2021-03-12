# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="64880972b0726ec2ff2b005b0cc97801067c1bb5"
EGO_PN="github.com/wagoodman/${PN}"
EGO_VENDOR=(
	"github.com/Azure/go-ansiterm d6e3b3328b78" # indirect
	"github.com/Microsoft/go-winio v0.4.14" # indirect
	"github.com/awesome-gocui/gocui v0.6.0"
	"github.com/awesome-gocui/keybinding v1.0.0"
	"github.com/cespare/xxhash v1.1.0"
	"github.com/docker/cli 016a3232168d"
	"github.com/docker/distribution v2.7.1" # indirect
	"github.com/docker/docker 33c3200e0d16"
	"github.com/docker/go-connections v0.4.0" # indirect
	"github.com/docker/go-units v0.4.0" # indirect
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/fatih/color v1.7.0"
	"github.com/gogo/protobuf v1.3.0" # indirect
	"github.com/google/go-cmp v0.3.0" # indirect
	"github.com/google/uuid v1.1.1"
	"github.com/gorilla/mux v1.7.2" # indirect
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2" # indirect
	"github.com/logrusorgru/aurora 94edacc10f9b"
	"github.com/lunixbochs/vtclean v1.0.0"
	"github.com/magiconair/properties v1.8.1" # indirect
	"github.com/mattn/go-colorable v0.1.2" # indirect
	"github.com/mattn/go-isatty v0.0.9" # indirect
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/morikuni/aec v1.0.0" # indirect
	"github.com/opencontainers/go-digest v1.0.0-rc1" # indirect
	"github.com/opencontainers/image-spec v1.0.1" # indirect
	"github.com/pelletier/go-toml v1.4.0" # indirect
	"github.com/phayes/permbits 39d7c581d2ee"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sirupsen/logrus v1.4.2"
	"github.com/spf13/afero v1.2.2"
	"github.com/spf13/cobra v0.0.5"
	"github.com/spf13/jwalterweatherman v1.1.0" # indirect
	"github.com/spf13/pflag v1.0.5" # indirect
	"github.com/spf13/viper v1.4.0"
	"github.com/stretchr/testify v1.4.0" # indirect
	"golang.org/x/net ba9fcec4b297 github.com/golang/net"
	"golang.org/x/sys 12a6c2dcc1e4 github.com/golang/sys" # indirect
	"golang.org/x/text v0.3.2 github.com/golang/text" # indirect
	"google.golang.org/genproto 6af8c5fc6601 github.com/googleapis/go-genproto" # indirect
	"google.golang.org/grpc v1.21.1 github.com/grpc/grpc-go" # indirect
	"gotest.tools v2.2.0 github.com/gotestyourself/gotest.tools" # indirect
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
