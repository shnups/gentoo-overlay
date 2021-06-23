# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

MY_PN="${PN/-bin}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="The Kubernetes IDE"
HOMEPAGE="https://github.com/lensapp/lens"
SRC_URI="https://github.com/lensapp/lens/releases/download/v${PV}/${MY_P}.amd64.deb"

LICENSE="MIT CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror strip"
DOCS="changelog"
S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_prepare() {
	mv usr/share/doc/kontena-${MY_PN}/changelog.gz .
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
