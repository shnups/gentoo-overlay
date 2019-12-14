# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GITHUB_USER="microsoft"
GITHUB_PROJECT="ProcDump-for-Linux"

DESCRIPTION="A Linux version of the ProcDump Sysinternals tool"
HOMEPAGE="https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=sys-devel/gdb-7.6.1"
BDEPEND="sys-libs/zlib"

src_unpack() {
  	unpack ${A}
	S="${WORKDIR}"/"${GITHUB_PROJECT}"-"${PV}"
}

