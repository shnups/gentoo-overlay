# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
EGO_PN="github.com/danielgtaylor/${PN}"
inherit go-module golang-build

DESCRIPTION="General purpose file previewer designed for Ranger/Lf to make scope.sh redundant"
HOMEPAGE="https://rest.sh"

SRC_URI="https://github.com/danielgtaylor/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(LICENSE.md README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.18"

src_compile() {
    ego build -v -work -x ${EGO_BUILD_FLAGS} -ldflags="
        -X 'main.version=${PV}'
        -X 'main.commit=${MY_GIT_COMMIT}'
        -X 'main.date=$(date +%FT%T%z)'
        " "${EGO_PN}"
}

src_install() {
    dobin ${S}/${PN}
    default
}