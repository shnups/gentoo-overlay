# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple clipboard manager to be integrated with rofi"
HOMEPAGE="https://github.com/erebe/greenclip"
SRC_URI="https://github.com/erebe/greenclip/releases/download/${PV}/${PN/-bin}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

S="${WORKDIR}"

src_install() {
	dobin "${DISTDIR}/${PN/-bin}"
}