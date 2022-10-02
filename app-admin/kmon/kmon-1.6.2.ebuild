# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	atty-0.2.14
	autocfg-1.1.0
	bitflags-1.3.2
	block-0.1.6
	bytesize-1.1.0
	cassowary-0.3.0
	cfg-if-1.0.0
	clap-4.0.8
	clap_complete-4.0.2
	clap_lex-0.3.0
	clap_mangen-0.2.2
	clipboard-win-3.1.1
	colorsys-0.6.6
	copypasta-0.8.1
	copypasta-ext-0.3.9
	dlib-0.5.0
	downcast-rs-1.2.0
	either-1.8.0
	enum-iterator-1.2.0
	enum-iterator-derive-1.1.0
	hermit-abi-0.1.19
	kmon-1.6.2
	lazy-bytes-cast-5.0.1
	lazy_static-1.4.0
	libc-0.2.134
	libloading-0.7.3
	log-0.4.17
	malloc_buf-0.0.6
	memchr-2.5.0
	memmap2-0.5.7
	memoffset-0.6.5
	minimal-lexical-0.2.1
	nix-0.24.2
	nom-7.1.1
	numtoa-0.1.0
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	once_cell-1.15.0
	os_str_bytes-6.3.0
	pkg-config-0.3.25
	proc-macro2-1.0.46
	quick-xml-0.22.0
	quote-1.0.21
	redox_syscall-0.2.16
	redox_termios-0.1.2
	roff-0.2.1
	scoped-tls-1.0.0
	smallvec-1.9.0
	smithay-client-toolkit-0.16.0
	smithay-clipboard-0.6.6
	strsim-0.10.0
	syn-1.0.101
	termcolor-1.1.3
	termion-1.5.6
	tui-0.19.0
	unicode-ident-1.0.4
	unicode-segmentation-1.10.0
	unicode-width-0.1.10
	wayland-client-0.29.5
	wayland-commons-0.29.5
	wayland-cursor-0.29.5
	wayland-protocols-0.29.5
	wayland-scanner-0.29.5
	wayland-sys-0.29.5
	which-4.3.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	x11-clipboard-0.6.1
	xcb-1.1.1
	xcursor-0.3.4
	xml-rs-0.8.4
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
BDEPEND=">=virtual/rust-1.64.0"
