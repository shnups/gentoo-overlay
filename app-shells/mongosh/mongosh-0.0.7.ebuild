# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A shell for MongoDB data plateform with a modern user experience"
HOMEPAGE="https://github.com/mongodb-js/mongosh"
SRC_URI="https://github.com/mongodb-js/mongosh/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86"
DOCS=(AUTHORS CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md THIRD_PARTY_NOTICES.md)
RESTRICT="strip"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=net-libs/nodejs-12.4.0"

src_compile() {
	# Should really be build dependencies
	npm install lerna
	npm install typescript

	npm run bootstrap

	npm run compile-exec # standalone binary
}

src_install() {
	dobin dist/${PN}
	einstalldocs
}
