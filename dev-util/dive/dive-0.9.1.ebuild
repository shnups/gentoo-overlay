# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A tool for exploring each layer in a docker image"
HOMEPAGE="https://github.com/wagoodman/dive"
SRC_URI="https://github.com/wagoodman/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
BDEPEND=">=dev-lang/go-1.11.5"

src_install() {
	dobin dist/dive_linux_amd64/${PN}
}
