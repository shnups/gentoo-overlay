# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
REVISION="df98aa8c0e3ed3b15a25925cc07c1b54a5a6627a"
EGO_PN="github.com/slimtoolkit/slim"
inherit go-module golang-build

DESCRIPTION="Minify and Secure Docker containers"
HOMEPAGE="https://github.com/slimtoolkit/slim"
SRC_URI="https://github.com/slimtoolkit/slim/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(CHANGELOG.md CONTRIBUTING.md LICENSE README.md WISHLIST.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.19"

S="${WORKDIR}/slim-${PV}"

src_compile() {
	sed -i -e 's/TAG="current"/TAG="${PV}"/' scripts/src.build.quick.sh
	sed -i -e 's/REVISION="current"/REVISION="${REVISION}"/' scripts/src.build.quick.sh  # FIXME: not working
	emake build_dev
}

src_install() {
	dobin "${S}/bin/slim" "${S}/bin/slim-sensor"
	einstalldocs
}
