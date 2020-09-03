# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

MY_PN="${PN/-bin}"
MY_P="${MY_PN}_${PV}"

DESCRIPTION="The MongoDB GUI"
HOMEPAGE="https://github.com/mongodb-js/compass"
SRC_URI="https://github.com/mongodb-js/compass/releases/download/v${PV}/${MY_P}_amd64.deb"

LICENSE="SSPL-1"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror strip"
DOCS="copyright"
S="${WORKDIR}"

src_unpack() {
    unpack_deb "${A}"
}

src_prepare() {
    mv usr/share/doc/${MY_PN}/copyright .
    rm -rf usr/share/doc
    default
}

src_install() {
    mkdir -p "${ED}"
    cp -r ./usr "${ED}"/
    default
}
