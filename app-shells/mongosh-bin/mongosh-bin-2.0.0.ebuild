# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

MY_PN="${PN/-bin}"

DESCRIPTION="A shell for MongoDB data plateform with a modern user experience"
HOMEPAGE="https://github.com/mongodb-js/mongosh"
SRC_URI="https://github.com/mongodb-js/mongosh/releases/download/v${PV}/mongodb-${MY_PN}_${PV}_amd64.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="mirror strip"
S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	dobin "${S}/usr/bin/${MY_PN}"
}
