# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Command-line tool to work with users, groups, vaults, and items in a 1Password account"
HOMEPAGE="https://1password.com/downloads/command-line/"
SRC_URI="https://cache.agilebits.com/dist/1P/op/pkg/v${PV}/op_linux_amd64_v${PV}.zip"

# TODO: LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"
S="${WORKDIR}"

src_install() {
    dobin "op"
}
