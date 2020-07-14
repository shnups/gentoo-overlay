# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The MongoDB GUI"
HOMEPAGE="https://github.com/mongodb-js/compass"

NPM_GITHUP_MOD="mongodb-js/compass"
NPM_PV="v${PV}"

LICENSE="SSPL-1"
SLOT="0"
KEYWORDS="~amd64" 
IUSE=""

# dep on hadron-build?
RDEPEND="${DEPEND}"
DEPEND="=net-libs/nodejs-12.4*[npm]"

S="${WORKDIR}/compass-${PV}"

inherit npmv1

src_compile() {
    # npm install mkdirp
    # npm install --only=dev
    # default
    npm install
    npm run release compass
}

# Manual changes:
# package.json: engines/node: "^13.11"
# $ npm install
# $ npm run release compass
# everything ends up in dist directory

# had to add electron "3.1.13" to deps in package.json
