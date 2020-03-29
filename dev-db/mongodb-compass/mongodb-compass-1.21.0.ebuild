# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The MongoDB GUI"
HOMEPAGE="https://github.com/mongodb-js/compass"

NPM_GITHUP_MOD="mongodb-js/compass"
NPM_PV="v${PV}-beta.2"

LICENSE="SSPL-1"
SLOT="0"
KEYWORDS="~amd64" 
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/compass-${PV}-beta.2"

inherit npmv1

src_compile() {
    npm install mkdirp
    npm install --only=dev
    default
}

# src_instsall() {
#     npm run release compass
# }

# Manual changes:
# package.json: engines/node: "^13.11"
# $ npm install
# $ npm run release compass
# tout est dans le repertoire dist

# had to add electron "3.1.13" to deps in package.json
# npm install, puis npm run release
# change versions de node & npm (> 6.13.6 qui a le fix) dans package.json
