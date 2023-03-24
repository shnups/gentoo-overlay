# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="k9s like CLI for AWS"
HOMEPAGE="https://one2n.gitbook.io/docs/"
SRC_URI="https://github.com/one2nc/cloudlens/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT=strip
DOCS=(CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin execs/${PN}
}
