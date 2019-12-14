# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GITHUB_USER="microsoft"
GITHUB_REPO="ProcDump-for-Linux"
DOCS=(CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md docs/coreclrintegration.md)

DESCRIPTION="A Linux version of the ProcDump Sysinternals tool"
HOMEPAGE="https://github.com/${GITHUB_USER}/${GITHUB_REPO}"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=sys-devel/gdb-7.6.1"
BDEPEND="sys-libs/zlib"

src_unpack() {
  	unpack ${A}
	mv "${WORKDIR}/${GITHUB_REPO}-${PV}" "${S}" || die "Couldn't move sources directory"
}

