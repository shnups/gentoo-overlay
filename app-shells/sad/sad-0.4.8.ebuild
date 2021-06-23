# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	aho-corasick-0.7.18
	ansi_term-0.11.0
	ansi_term-0.12.1
	async-channel-1.6.1
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.2.1
	bytes-1.0.1
	cache-padded-1.1.1
	cfg-if-1.0.0
	clap-2.33.3
	concurrent-queue-1.2.2
	difflib-0.4.0
	either-1.6.1
	event-listener-2.5.1
	futures-0.3.15
	futures-channel-0.3.15
	futures-core-0.3.15
	futures-executor-0.3.15
	futures-io-0.3.15
	futures-macro-0.3.15
	futures-sink-0.3.15
	futures-task-0.3.15
	futures-util-0.3.15
	getrandom-0.2.2
	heck-0.3.2
	hermit-abi-0.1.18
	instant-0.1.9
	lazy_static-1.4.0
	libc-0.2.94
	lock_api-0.4.2
	log-0.4.14
	memchr-2.4.0
	mio-0.7.7
	miow-0.3.6
	ntapi-0.3.6
	num_cpus-1.13.0
	once_cell-1.5.2
	parking_lot-0.11.1
	parking_lot_core-0.8.3
	pin-project-lite-0.2.4
	pin-utils-0.1.0
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro-nested-0.1.7
	proc-macro2-1.0.24
	quote-1.0.9
	redox_syscall-0.2.4
	regex-1.5.4
	regex-syntax-0.6.25
	scopeguard-1.1.0
	signal-hook-registry-1.3.0
	slab-0.4.2
	smallvec-1.6.1
	socket2-0.3.19
	strsim-0.8.0
	structopt-0.3.21
	structopt-derive-0.4.14
	syn-1.0.60
	textwrap-0.11.0
	tokio-1.7.0
	tokio-macros-1.1.0
	unicode-segmentation-1.7.1
	unicode-width-0.1.8
	unicode-xid-0.2.1
	uuid-0.8.2
	vec_map-0.8.2
	version_check-0.9.2
	wasi-0.10.2+wasi-snapshot-preview1
	which-4.1.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="CLI search and replace | Space Age seD"
HOMEPAGE="https://github.com/ms-jpq/${PN}"
SRC_URI="$(cargo_crate_uris ${CRATES}) https://github.com/ms-jpq/sad/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(LICENSE README.md release_notes.md)

src_install() {
	cargo_src_install
	einstalldocs
}
