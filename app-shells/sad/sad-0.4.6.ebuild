# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	aho-corasick-0.7.13
	ansi_term-0.11.0
	ansi_term-0.12.1
	arc-swap-0.4.7
	async-std-1.6.2
	async-task-3.0.0
	atty-0.2.14
	autocfg-1.0.0
	bitflags-1.2.1
	blocking-0.4.6
	bumpalo-3.4.0
	bytes-0.5.6
	cache-padded-1.1.1
	cc-1.0.58
	cfg-if-0.1.10
	clap-2.33.1
	concurrent-queue-1.1.1
	crossbeam-utils-0.7.2
	difflib-0.4.0
	fastrand-1.3.3
	fnv-1.0.7
	fuchsia-zircon-0.3.3
	fuchsia-zircon-sys-0.3.3
	futures-0.3.5
	futures-channel-0.3.5
	futures-core-0.3.5
	futures-executor-0.3.5
	futures-io-0.3.5
	futures-macro-0.3.5
	futures-sink-0.3.5
	futures-task-0.3.5
	futures-timer-3.0.2
	futures-util-0.3.5
	getrandom-0.1.14
	gloo-timers-0.2.1
	heck-0.3.1
	hermit-abi-0.1.15
	iovec-0.1.4
	js-sys-0.3.42
	kernel32-sys-0.2.2
	kv-log-macro-1.0.7
	lazy_static-1.4.0
	libc-0.2.72
	log-0.4.11
	memchr-2.3.3
	mio-0.6.22
	mio-named-pipes-0.1.7
	mio-uds-0.6.8
	miow-0.2.1
	miow-0.3.5
	net2-0.2.34
	num_cpus-1.13.0
	once_cell-1.4.0
	parking-1.0.5
	pin-project-0.4.22
	pin-project-internal-0.4.22
	pin-project-lite-0.1.7
	pin-utils-0.1.0
	ppv-lite86-0.2.8
	proc-macro-error-1.0.3
	proc-macro-error-attr-1.0.3
	proc-macro-hack-0.5.16
	proc-macro-nested-0.1.6
	proc-macro2-1.0.18
	quote-1.0.7
	rand-0.7.3
	rand_chacha-0.2.2
	rand_core-0.5.1
	rand_hc-0.2.0
	redox_syscall-0.1.57
	regex-1.3.9
	regex-syntax-0.6.18
	scoped-tls-1.0.0
	send_wrapper-0.4.0
	signal-hook-registry-1.2.0
	slab-0.4.2
	smol-0.1.18
	socket2-0.3.12
	strsim-0.8.0
	structopt-0.3.15
	structopt-derive-0.4.8
	syn-1.0.34
	syn-mid-0.5.0
	textwrap-0.11.0
	thiserror-1.0.20
	thiserror-impl-1.0.20
	thread_local-1.0.1
	tokio-0.2.21
	unicode-segmentation-1.6.0
	unicode-width-0.1.8
	unicode-xid-0.2.1
	uuid-0.8.1
	vec_map-0.8.2
	version_check-0.9.2
	waker-fn-1.0.0
	wasi-0.9.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.65
	wasm-bindgen-backend-0.2.65
	wasm-bindgen-futures-0.4.15
	wasm-bindgen-macro-0.2.65
	wasm-bindgen-macro-support-0.2.65
	wasm-bindgen-shared-0.2.65
	web-sys-0.3.42
	wepoll-sys-stjepang-1.0.6
	which-4.0.1
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	ws2_32-sys-0.2.1
"

inherit cargo

DESCRIPTION="CLI search and replace | Space Age seD"
HOMEPAGE="https://github.com/ms-jpq/${PN}"
SRC_URI="$(cargo_crate_uris ${CRATES}) https://github.com/ms-jpq/sad/archive/v${PV}.tar.gz -> ${P}.tar.gz"

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
