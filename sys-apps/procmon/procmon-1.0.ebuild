# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-info cmake-multilib llvm

GITHUB_USER="microsoft"
GITHUB_REPO="ProcMon-for-Linux"

DESCRIPTION="Procmon provides a convenient and efficient way for Linux developers to trace the syscall activity on the system"
HOMEPAGE="https://github.com/${GITHUB_USER}/${GITHUB_REPO}"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE NOTICE.txt README.md SECURITY.md)

RDEPEND="
	dev-libs/libedit
	sys-libs/zlib
	sys-devel/flex
	sys-devel/bison
	virtual/libelf
	dev-util/bcc
	<sys-devel/clang-10:=
	<sys-devel/llvm-10:=[llvm_targets_BPF(+)]
"
BDEPEND="
	>=dev-util/bcc-0.10.0
	>=dev-util/cmake-3.13
"
DEPEND="${RDEPEND}"

pkg_pretend() {
	if use kernel_linux ; then
		kernel_is ge 4 18 && kernel_is le 5 3 || die "${PN} will only run on Linux Kernels >= 4.18 and <= 5.3"
	fi
}

# pkg_setup() {
# 	LLVM_MAX_SLOT=9 llvm_pkg_setup
#  	default
#  }

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${GITHUB_REPO}-${PV}" "${S}" || die "Couldn't move sources directory"
}

# src_compile() {
# 	emake obj bin bin/${PN} || die "emake failed"
# }

# TODO man page