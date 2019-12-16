# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit golang-build

GITHUB_USER="dtan4"
GITHUB_REPO="k8sec"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/archive/v${PV}.tar.gz"

#GOLANG_PKG_IMPORTPATH="github.com/dtan4"
#GOLANG_PKG_VERSION="3895431872d51ede5a23b6d6471c1963354f941b"
EGO_PN="github.com/dtan4/k8sec"

DESCRIPTION="CLI tool to manage Kubernetes Secrets easily"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"
DOCS=(CHANGELOG.md LICENSE README.md)

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

