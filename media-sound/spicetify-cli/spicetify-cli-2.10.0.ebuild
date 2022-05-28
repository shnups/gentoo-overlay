# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module
GIT_COMMIT="59625d4838bef6a375e2f24ebd12ae273e8a85ea"

DESCRIPTION="Command-line tool to customize Spotify client"
HOMEPAGE="https://github.com/khanhas/${PN}"

EGO_SUM=(
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/go-ini/ini v1.66.4"
	"github.com/go-ini/ini v1.66.4/go.mod"
	"github.com/mattn/go-colorable v0.1.12"
	"github.com/mattn/go-colorable v0.1.12/go.mod"
	"github.com/mattn/go-isatty v0.0.14"
	"github.com/mattn/go-isatty v0.0.14/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.7.1"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"golang.org/x/net v0.0.0-20220325170049-de3da57026de"
	"golang.org/x/net v0.0.0-20220325170049-de3da57026de/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/sys v0.0.0-20210927094055-39ccf1dd6fa6/go.mod"
	"golang.org/x/sys v0.0.0-20220319134239-a9b59b0215f8"
	"golang.org/x/sys v0.0.0-20220319134239-a9b59b0215f8/go.mod"
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
BDEPEND=">=dev-lang/go-1.18"

S="${WORKDIR}/${P}"

src_prepare() {
	default
	sed -i -e "s/version = \".*\"/version = \"${PV}\"/" spicetify.go || die "sed failed!"
}

src_compile() {
	go build -v -work -o "${PN/-cli}" || die
}

src_install() {
	dobin ${PN/-cli}
	einstalldocs
}
