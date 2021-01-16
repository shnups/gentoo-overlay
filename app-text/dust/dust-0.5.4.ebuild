# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	aho-corasick-0.7.15
	ansi_term-0.11.0
	ansi_term-0.12.1
	assert_cmd-1.0.2
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.2.1
	bstr-0.2.14
	cfg-if-0.1.10
	cfg-if-1.0.0
	clap-2.33.3
	crossbeam-channel-0.4.4
	crossbeam-utils-0.7.2
	crossbeam-utils-0.8.1
	difference-2.0.0
	doc-comment-0.3.3
	du-dust-0.5.4
	fnv-1.0.7
	getrandom-0.2.1
	globset-0.4.6
	hermit-abi-0.1.17
	ignore-0.4.17
	lazy_static-1.4.0
	libc-0.2.82
	log-0.4.13
	lscolors-0.7.1
	maybe-uninit-2.0.0
	memchr-2.3.4
	num_cpus-1.13.0
	ppv-lite86-0.2.10
	predicates-1.0.6
	predicates-core-1.0.1
	predicates-tree-1.0.1
	rand-0.8.2
	rand_chacha-0.3.0
	rand_core-0.6.1
	rand_hc-0.3.0
	redox_syscall-0.2.4
	regex-1.4.3
	regex-syntax-0.6.22
	remove_dir_all-0.5.3
	same-file-1.0.6
	stfu8-0.2.4
	strsim-0.8.0
	tempfile-3.2.0
	terminal_size-0.1.15
	textwrap-0.11.0
	thousands-0.2.0
	thread_local-1.1.0
	treeline-0.1.0
	unicode-width-0.1.8
	vec_map-0.8.2
	wait-timeout-0.2.0
	walkdir-2.3.1
	wasi-0.10.1+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
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
