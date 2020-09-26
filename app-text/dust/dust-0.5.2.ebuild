# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	aho-corasick-0.7.10
	ansi_term-0.11.0
	ansi_term-0.12.1
	assert_cmd-0.12.0
	atty-0.2.14
	autocfg-1.0.0
	bitflags-1.2.1
	bstr-0.2.12
	cfg-if-0.1.10
	clap-2.33.0
	crossbeam-channel-0.4.2
	crossbeam-utils-0.7.2
	difference-2.0.0
	doc-comment-0.3.3
	escargot-0.5.0
	fnv-1.0.6
	getrandom-0.1.14
	globset-0.4.5
	hermit-abi-0.1.8
	ignore-0.4.12
	itoa-0.4.5
	lazy_static-1.4.0
	libc-0.2.68
	log-0.4.8
	lscolors-0.6.0
	maybe-uninit-2.0.0
	memchr-2.3.3
	num_cpus-1.12.0
	ppv-lite86-0.2.6
	predicates-1.0.4
	predicates-core-1.0.0
	predicates-tree-1.0.0
	proc-macro2-1.0.9
	quote-1.0.3
	rand-0.7.3
	rand_chacha-0.2.2
	rand_core-0.5.1
	rand_hc-0.2.0
	redox_syscall-0.1.56
	regex-1.3.5
	regex-syntax-0.6.17
	remove_dir_all-0.5.2
	ryu-1.0.3
	same-file-1.0.6
	serde-1.0.105
	serde_derive-1.0.105
	serde_json-1.0.48
	strsim-0.8.0
	syn-1.0.17
	tempfile-3.1.0
	terminal_size-0.1.10
	textwrap-0.11.0
	thread_local-1.0.1
	treeline-0.1.0
	unicode-width-0.1.7
	unicode-xid-0.2.0
	vec_map-0.8.1
	walkdir-2.3.1
	wasi-0.9.0+wasi-snapshot-preview1
	winapi-0.3.8
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.3
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="du + rust = dust. Like du but more intuitive."
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="$(cargo_crate_uris ${CRATES})  https://github.com/bootandy/dust/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(LICENSE README.md)

src_install() {
	cargo_src_install
	einstalldocs
}
