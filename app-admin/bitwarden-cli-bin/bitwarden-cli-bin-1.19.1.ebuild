# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The Bitwarden CLI is a powerful, full-featured command-line interface (CLI) tool to access and manage a Bitwarden vault"
HOMEPAGE="https://bitwarden.com"
SRC_URI="https://github.com/bitwarden/cli/releases/download/v${PV}/bw-linux-${PV}.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="zsh-completion"
RESTRICT=strip
DOCS=()

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default
	mkdir "${S}"
	mv bw "${S}/"
}

src_compile() {
	chmod u+x bw
	use zsh-completion && ./bw completion --shell zsh > _bw
}

src_install() {
	dobin bw
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins _bw
	fi
}
