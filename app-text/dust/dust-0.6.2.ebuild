# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	aho-corasick-0.7.18
	ansi_term-0.11.0
	ansi_term-0.12.1
	assert_cmd-1.0.7
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.2.1
	bstr-0.2.16
	cfg-if-1.0.0
	clap-2.33.3
	crossbeam-channel-0.5.1
	crossbeam-deque-0.8.0
	crossbeam-epoch-0.9.5
	crossbeam-utils-0.8.5
	difflib-0.4.0
	doc-comment-0.3.3
	du-dust-0.6.2
	either-1.6.1
	getrandom-0.2.3
	hermit-abi-0.1.19
	itertools-0.10.1
	lazy_static-1.4.0
	libc-0.2.98
	lscolors-0.7.1
	memchr-2.4.0
	memoffset-0.6.4
	num_cpus-1.13.0
	ppv-lite86-0.2.10
	predicates-2.0.0
	predicates-core-1.0.2
	predicates-tree-1.0.2
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	rayon-1.5.1
	rayon-core-1.9.1
	redox_syscall-0.2.9
	regex-1.5.4
	regex-automata-0.1.10
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	scopeguard-1.1.0
	stfu8-0.2.4
	strsim-0.8.0
	tempfile-3.2.0
	term_size-0.3.2
	terminal_size-0.1.17
	textwrap-0.11.0
	thousands-0.2.0
	treeline-0.1.0
	unicode-width-0.1.8
	vec_map-0.8.2
	wait-timeout-0.2.0
	wasi-0.10.2+wasi-snapshot-preview1
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
