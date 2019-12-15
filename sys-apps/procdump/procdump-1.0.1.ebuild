# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-info

GITHUB_USER="microsoft"
GITHUB_REPO="ProcDump-for-Linux"
DOCS=(CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md)

DESCRIPTION="A Linux version of the ProcDump Sysinternals tool"
HOMEPAGE="https://github.com/${GITHUB_USER}/${GITHUB_REPO}"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=sys-devel/gdb-7.6.1"
BDEPEND="sys-libs/zlib"

pkg_pretend() {
	if use kernel_linux ; then
		kernel_is ge 3 5 || die "${PN} currently will only run on Linux Kernels version 3.5+"
	fi
}

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${GITHUB_REPO}-${PV}" "${S}" || die "Couldn't move sources directory"
}

