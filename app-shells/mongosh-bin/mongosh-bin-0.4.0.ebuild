# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

MY_PN="${PN/-bin}"

DESCRIPTION="A shell for MongoDB with a modern user experience that will grow in functionality along with the MongoDB data platform"
HOMEPAGE="https://github.com/mongodb-js/mongosh"
SRC_URI="https://github.com/mongodb-js/mongosh/releases/download/v${PV}/${MY_PN}_${PV}_amd64.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="mirror strip"
S="${WORKDIR}"

src_unpack() {
    unpack_deb "${A}"
}

src_install() {
    dobin ${S}/usr/bin/${MY_PN}
}
