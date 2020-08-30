# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module
EGO_SUM=(
    "github.com/go-ini/ini v1.55.0"
    "github.com/go-ini/ini v1.55.0/go.mod"
    "github.com/mattn/go-colorable v0.1.6"
    "github.com/mattn/go-colorable v0.1.6/go.mod"
    "github.com/mattn/go-isatty v0.0.12"
    "github.com/mattn/go-isatty v0.0.12/go.mod"
    "golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
    "golang.org/x/net v0.0.0-20200506145744-7e3656a0809f"
    "golang.org/x/net v0.0.0-20200506145744-7e3656a0809f/go.mod"
    "golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
    "golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
    "golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
    "golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd"
    "golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
    "golang.org/x/text v0.3.0/go.mod"
)
go-module_set_globals

DESCRIPTION="Command-line tool to customize Spotify client"
HOMEPAGE="https://github.com/khanhas/${PN}"
SRC_URI="https://khanhas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_SUM_SRC_URI}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(LICENSE README.md)

RDEPEND=""
BDEPEND=">=dev-lang/go-1.14"

src_compile() {
    go build -v -work -o "${PN/-cli}" || die
}

src_install() {
	dobin ${PN/-cli}
	einstalldocs
}
