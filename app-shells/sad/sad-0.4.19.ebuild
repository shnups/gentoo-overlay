# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	aho-corasick-0.7.18
	ansi_term-0.12.1
	async-channel-1.6.1
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.3.2
	bytes-1.1.0
	cache-padded-1.2.0
	cfg-if-1.0.0
	clap-3.0.14
	clap_derive-3.0.14
	concurrent-queue-1.2.2
	difflib-0.4.0
	either-1.6.1
	event-listener-2.5.2
	futures-0.3.19
	futures-channel-0.3.19
	futures-core-0.3.19
	futures-executor-0.3.19
	futures-io-0.3.19
	futures-macro-0.3.19
	futures-sink-0.3.19
	futures-task-0.3.19
	futures-util-0.3.19
	getrandom-0.2.4
	hashbrown-0.11.2
	heck-0.4.0
	hermit-abi-0.1.19
	indexmap-1.8.0
	instant-0.1.12
	lazy_static-1.4.0
	libc-0.2.117
	lock_api-0.4.6
	log-0.4.14
	memchr-2.4.1
	mio-0.7.14
	miow-0.3.7
	ntapi-0.3.6
	num_cpus-1.13.1
	once_cell-1.9.0
	os_str_bytes-6.0.0
	parking_lot-0.11.2
	parking_lot_core-0.8.5
	pathdiff-0.2.1
	pin-project-lite-0.2.8
	pin-utils-0.1.0
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.36
	quote-1.0.15
	redox_syscall-0.2.10
	regex-1.5.4
	regex-syntax-0.6.25
	scopeguard-1.1.0
	shlex-1.1.0
	signal-hook-registry-1.4.0
	slab-0.4.5
	smallvec-1.8.0
	strsim-0.10.0
	syn-1.0.86
	termcolor-1.1.2
	textwrap-0.14.2
	tokio-1.16.1
	tokio-macros-1.7.0
	unicode-xid-0.2.2
	uuid-0.8.2
	version_check-0.9.4
	wasi-0.10.2+wasi-snapshot-preview1
	which-4.2.4
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

CI_BUILD_DATETIME="2021-10-03_14-55"
DESCRIPTION="CLI search and replace | Space Age seD"
HOMEPAGE="https://github.com/ms-jpq/${PN}"
SRC_URI="$(cargo_crate_uris ${CRATES}) https://github.com/ms-jpq/sad/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(LICENSE README.md RELEASE_NOTES.md)

S="${WORKDIR}/${PN}-${PV}"

src_install() {
	cargo_src_install
	einstalldocs
}