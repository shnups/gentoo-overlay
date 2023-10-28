# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module
GIT_COMMIT="bb2283bc44c8885d5d15bedd58c05bc21fa590d9"

DESCRIPTION="Command-line tool to customize Spotify client"
HOMEPAGE="https://github.com/khanhas/${PN}"

EGO_SUM=(
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/go-ini/ini v1.67.0"
	"github.com/go-ini/ini v1.67.0/go.mod"
	"github.com/mattn/go-colorable v0.1.13"
	"github.com/mattn/go-colorable v0.1.13/go.mod"
	"github.com/mattn/go-isatty v0.0.16"
	"github.com/mattn/go-isatty v0.0.16/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.7.1"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"golang.org/x/net v0.17.0"
	"golang.org/x/net v0.17.0/go.mod"
	"golang.org/x/sys v0.0.0-20220811171246-fbc7d0a398ab/go.mod"
	"golang.org/x/sys v0.13.0"
	"golang.org/x/sys v0.13.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/khanhas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_SUM_SRC_URI}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.19"

S="${WORKDIR}/${P}"

src_compile() {
	go build -v -work -o "${PN/-cli}" -ldflags "-X 'main.version=${PV}'" || die
}

src_install() {
	dobin ${PN/-cli}
	einstalldocs
}
