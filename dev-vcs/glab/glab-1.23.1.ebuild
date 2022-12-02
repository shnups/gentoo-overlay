# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A GitLab CLI tool bringing GitLab to your command line"
HOMEPAGE="https://gitlab.com/gitlab-org/cli"
SRC_URI="https://gitlab.com/gitlab-org/cli/-/archive/v${PV}/cli-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md SECURITY.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.17"

S="${WORKDIR}/cli-v${PV}"

src_compile() {
	emake GLAB_VERSION=${PV} build

	mkdir -p ${S}/man
	go run ./cmd/gen-docs/docs.go --manpage --path ${S}/man
}

src_install() {
	dobin ${S}/bin/${PN}
	einstalldocs

	for page in $(ls ${S}/man)
	do
		doman ${S}/man/$page
	done
}
