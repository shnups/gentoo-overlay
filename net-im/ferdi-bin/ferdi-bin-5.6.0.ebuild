# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

MY_PN="${PN/-bin}"
MY_P="${MY_PN}_${PV}"

DESCRIPTION="Organize how you use your favourite apps by combining them into one application"
HOMEPAGE="https://github.com/getferdi/ferdi/"
SRC_URI="https://github.com/getferdi/ferdi/releases/download/v${PV}/${MY_P}_amd64.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror strip"
DOCS="changelog"
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
