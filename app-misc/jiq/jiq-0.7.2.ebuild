# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module
EGO_SUM=(
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/hashicorp/go-version v1.0.0"
	"github.com/hashicorp/go-version v1.0.0/go.mod"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"github.com/mitchellh/gox v1.0.1"
	"github.com/mitchellh/gox v1.0.1/go.mod"
	"github.com/mitchellh/iochan v1.0.0"
	"github.com/mitchellh/iochan v1.0.0/go.mod"
	"github.com/nsf/termbox-go v0.0.0-20200418040025-38ba6e5628f1"
	"github.com/nsf/termbox-go v0.0.0-20200418040025-38ba6e5628f1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.6.1"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
)
go-module_set_globals

DESCRIPTION="Interactive JSON query tool using jq expressions"
HOMEPAGE="https://github.com/fiatjaf/${PN}"
SRC_URI="https://github.com/fiatjaf/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.14"

src_compile() {
	go build -tags="full" -ldflags "-X 'main.version=${PV}'" -o "${PN}" "${S}/cmd/${PN}" || die
}

src_install() {
	dobin ${PN}
	einstalldocs
}
