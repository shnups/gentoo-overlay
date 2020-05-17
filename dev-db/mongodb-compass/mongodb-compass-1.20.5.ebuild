# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The MongoDB GUI"
HOMEPAGE="https://github.com/mongodb-js/compass"

NPM_GITHUP_MOD="mongodb-js/compass"
# NPM_NO_DEPS=1
# WORKDIR=""
S="${WORKDIR}/compass-${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

inherit npmv1

# TODO:
# setup deps on the right nodejs version
# had to add electron "3.1.13" to deps in package.json
# npm install, puis npm run release
# change versions de node & npm (> 6.13.6 qui a le fix) dans package.json
