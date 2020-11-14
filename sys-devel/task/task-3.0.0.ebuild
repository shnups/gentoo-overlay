# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="dd2116c897175ad6413e9f216d55cf8f46671f8f"
EGO_PN="github.com/go-task/task"
EGO_VENDOR=(
	"github.com/fatih/color v1.7.0"
	"github.com/go-task/slim-sprig f9bac4e523eb"
	"github.com/joho/godotenv v1.3.0"
	"github.com/mattn/go-colorable v0.1.2" # indirect
	"github.com/mattn/go-zglob v0.0.1"
	"github.com/radovskyb/watcher v1.0.5"
	"github.com/spf13/pflag v1.0.3"
	"github.com/stretchr/testify v1.5.1"
	"golang.org/x/sync cd5d95a43a6e github.com/golang/sync"
	"gopkg.in/yaml.v3 9f266ea9e77c github.com/go-yaml/yaml"
	"mvdan.cc/sh/v3 v3.1.2 github.com/mvdan/sh"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="A task runner / simpler Make alternative written in Go"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(CHANGELOG.md docs LICENSE README.md)

DEPEND=">=dev-lang/go-1.13"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	local DATE=`date +'%FT%TZ%z'`
	local ldflags=(
		-X "main.Version=${PV}"
	)
	local goargs=(
		-trimpath
		-ldflags "${ldflags[*]}"
		-o "${PN}"
		-v -work -x
	)

	GOPATH="${G}" go build "${goargs[@]}" "${S}/cmd/${PN}" || die
}

src_install() {
	dobin ${PN}
	einstalldocs
}
