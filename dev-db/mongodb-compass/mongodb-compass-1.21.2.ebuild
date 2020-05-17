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

RDEPEND="${DEPEND}"
DEPEND="net-libs/nodejs[npm]"
# Node.js: ^12.4.0
# npm: >= >=6.13.0

S="${WORKDIR}/compass-${PV}"

inherit npmv1

src_compile() {
    # npm install mkdirp
    # npm install --only=dev
    # default
    npm install
    npm run release compass
}

# src_install() {
#     default
#     #npm run release compass --debug
# }

# Manual changes:
# package.json: engines/node: "^13.11"
# $ npm install
# $ npm run release compass
# tout est dans le repertoire dist

# had to add electron "3.1.13" to deps in package.json
# npm install, puis npm run release
# change versions de node & npm (> 6.13.6 qui a le fix) dans package.json
