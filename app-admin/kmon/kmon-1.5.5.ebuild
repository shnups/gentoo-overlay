# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	ansi_term-0.11.0
	atty-0.2.14
	autocfg-1.0.0
	bitflags-1.2.1
	block-0.1.6
	bytesize-1.1.0
	cassowary-0.3.0
	cfg-if-0.1.10
	clap-2.33.3
	clipboard-0.5.0
	clipboard-win-2.2.0
	colorsys-0.6.3
	enum-iterator-0.7.0
	enum-iterator-derive-0.7.0
	enum-unitary-0.4.3
	hermit-abi-0.1.15
	kmon-1.5.5
	libc-0.2.73
	log-0.4.11
	malloc_buf-0.0.6
	num-traits-0.2.12
	numtoa-0.1.0
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	proc-macro2-1.0.19
	quote-1.0.7
	redox_syscall-0.1.57
	redox_syscall-0.2.9
	redox_termios-0.1.1
	strsim-0.8.0
	syn-1.0.35
	termion-1.5.6
	textwrap-0.11.0
	tui-0.16.0
	unicode-segmentation-1.6.0
	unicode-width-0.1.8
	unicode-xid-0.2.1
	vec_map-0.8.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	x11-clipboard-0.3.3
	xcb-0.8.2
"

inherit cargo

DESCRIPTION="Linux Kernel Manager and Activity Monitor"
HOMEPAGE="https://github.com/orhun/${PN}"
SRC_URI="$(cargo_crate_uris ${CRATES})"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md RELEASE.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=virtual/rust-1.41.1"

# NOTE: it seems that the man page was stripped from the crate package, open issue upstream?
# src_install() {
# 	doman "${S}/man/${PN}.8"
# 	rm -rf "${S}/man"

# 	cargo_src_install
# 	einstalldocs
# }
