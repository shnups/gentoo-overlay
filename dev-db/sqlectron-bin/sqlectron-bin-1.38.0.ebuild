# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

MY_PN="${PN/-bin}"
MY_P="${MY_PN}_${PV}"

DESCRIPTION="A simple and lightweight SQL client desktop with cross database and platform support"
HOMEPAGE="https://github.com/sqlectron/sqlectron-gui"
SRC_URI="https://github.com/sqlectron/sqlectron-gui/releases/download/v${PV}/${MY_P}_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror strip"
DOCS=""
S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_prepare() {
	mv usr/share/doc/${MY_PN}/changelog.gz .
	rm -rf usr/share/doc
	gzip -d ./changelog.gz
	default
}

src_install() {
	mkdir -p "${ED}"
	cp -r ./usr "${ED}"/
	cp -r ./opt "${ED}"/
	default
}
