# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	addr2line-0.17.0
	adler-1.0.2
	advapi32-sys-0.2.0
	ahash-0.4.7
	aho-corasick-0.7.18
	anyhow-1.0.52
	anylog-0.6.1
	app_dirs-1.2.1
	arrayref-0.3.6
	arrayvec-0.5.2
	arrayvec-0.7.2
	assert-json-diff-2.0.1
	assert_cmd-1.0.8
	atty-0.2.14
	autocfg-1.0.1
	backoff-0.3.0
	backtrace-0.3.63
	base64-0.10.1
	base64-0.13.0
	bitflags-1.3.2
	blake2b_simd-0.5.11
	block-buffer-0.7.3
	block-padding-0.1.5
	brotli-sys-0.3.2
	brotli2-0.3.2
	brownstone-1.1.0
	bstr-0.2.17
	byte-tools-0.3.1
	byteorder-1.4.3
	bzip2-0.4.3
	bzip2-sys-0.1.11+1.0.8
	cc-1.0.72
	cfg-if-1.0.0
	chardet-0.2.4
	chrono-0.4.19
	clap-2.34.0
	colored-2.0.0
	console-0.15.0
	constant_time_eq-0.1.5
	crc32fast-1.3.0
	crossbeam-channel-0.5.2
	crossbeam-deque-0.8.1
	crossbeam-epoch-0.9.6
	crossbeam-utils-0.8.6
	csv-1.1.6
	csv-core-0.1.10
	curl-0.4.42
	curl-sys-0.4.52+curl-7.81.0
	debugid-0.7.2
	difference-2.0.0
	difflib-0.4.0
	digest-0.8.1
	dirs-1.0.5
	dirs-3.0.2
	dirs-sys-0.3.6
	dlv-list-0.2.3
	dmsort-1.0.1
	doc-comment-0.3.3
	dotenv-0.15.0
	either-1.6.1
	elementtree-0.5.0
	encode_unicode-0.3.6
	encoding-0.2.33
	encoding-index-japanese-1.20141219.5
	encoding-index-korean-1.20141219.5
	encoding-index-simpchinese-1.20141219.5
	encoding-index-singlebyte-1.20141219.5
	encoding-index-tradchinese-1.20141219.5
	encoding_index_tests-0.1.4
	failure-0.1.8
	failure_derive-0.1.8
	fake-simd-0.1.2
	fallible-iterator-0.2.0
	fastrand-1.6.0
	flate2-1.0.22
	float-cmp-0.9.0
	fnv-1.0.7
	form_urlencoded-1.0.1
	generic-array-0.12.4
	getrandom-0.1.16
	getrandom-0.2.4
	gimli-0.26.1
	git2-0.13.25
	glob-0.3.0
	globset-0.4.8
	goblin-0.4.3
	hashbrown-0.9.1
	hashbrown-0.11.2
	heck-0.3.3
	hermit-abi-0.1.19
	httparse-1.5.1
	httpdate-1.0.2
	id-arena-2.2.1
	idna-0.1.5
	idna-0.2.3
	if_chain-0.1.3
	if_chain-1.0.2
	ignore-0.4.18
	indent_write-2.2.0
	indexmap-1.8.0
	indicatif-0.14.0
	insta-1.10.0
	instant-0.1.12
	itertools-0.10.3
	itoa-0.4.8
	itoa-1.0.1
	java-properties-1.4.0
	jobserver-0.1.24
	joinery-2.1.0
	lazy_static-1.4.0
	lazycell-1.3.0
	leb128-0.2.5
	libc-0.2.112
	libgit2-sys-0.12.26+1.3.0
	libz-sys-1.1.3
	line-wrap-0.1.1
	linked-hash-map-0.5.4
	lock_api-0.4.5
	log-0.4.14
	mac-process-info-0.2.0
	maplit-1.0.2
	matches-0.1.9
	memchr-2.4.1
	memmap-0.7.0
	memoffset-0.6.5
	might-be-minified-0.3.0
	minimal-lexical-0.2.1
	miniz_oxide-0.4.4
	mockito-0.30.0
	new_debug_unreachable-1.0.4
	nom-7.1.0
	nom-supreme-0.6.0
	normalize-line-endings-0.3.0
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.1
	number_prefix-0.3.0
	object-0.27.1
	ole32-sys-0.2.0
	once_cell-1.9.0
	opaque-debug-0.2.3
	open-1.7.1
	openssl-probe-0.1.5
	openssl-src-111.17.0+1.1.1m
	openssl-sys-0.9.72
	ordered-multimap-0.3.1
	osascript-0.3.0
	parking_lot-0.11.2
	parking_lot_core-0.8.5
	pathdiff-0.2.1
	pdb-0.7.0
	percent-encoding-1.0.1
	percent-encoding-2.1.0
	pest-2.1.3
	pest_derive-2.1.0
	pest_generator-2.1.3
	pest_meta-2.1.3
	phf_shared-0.8.0
	pin-project-lite-0.2.8
	pkg-config-0.3.24
	plain-0.2.3
	plist-1.3.1
	ppv-lite86-0.2.16
	precomputed-hash-0.1.1
	predicates-2.1.1
	predicates-core-1.0.3
	predicates-tree-1.0.5
	prettytable-rs-0.8.0
	proc-macro2-0.4.30
	proc-macro2-1.0.36
	proguard-4.1.1
	quote-0.6.13
	quote-1.0.14
	r2d2-0.8.9
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	rayon-1.5.1
	rayon-core-1.9.1
	redox_syscall-0.1.57
	redox_syscall-0.2.10
	redox_users-0.3.5
	redox_users-0.4.0
	regex-1.5.4
	regex-automata-0.1.10
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	runas-0.2.1
	rust-argon2-0.8.3
	rust-ini-0.17.0
	rustc-demangle-0.1.21
	rustc_version-0.2.3
	ryu-1.0.9
	safemem-0.3.3
	same-file-1.0.6
	schannel-0.1.19
	scheduled-thread-pool-0.2.5
	scopeguard-1.1.0
	scroll-0.9.2
	scroll-0.10.2
	scroll_derive-0.9.5
	scroll_derive-0.10.5
	semver-0.9.0
	semver-1.0.4
	semver-parser-0.7.0
	sentry-0.23.0
	sentry-core-0.23.0
	sentry-types-0.23.0
	serde-1.0.133
	serde_derive-1.0.133
	serde_json-1.0.75
	serde_urlencoded-0.7.1
	serde_yaml-0.8.23
	sha-1-0.8.2
	sha1-0.6.1
	sha1_smol-1.0.0
	shell32-sys-0.1.2
	signal-hook-0.3.13
	signal-hook-registry-1.4.0
	similar-2.1.0
	siphasher-0.3.9
	smallvec-1.8.0
	socket2-0.4.2
	sourcemap-5.0.0
	stable_deref_trait-1.2.0
	string_cache-0.8.2
	strsim-0.8.0
	symbolic-8.5.0
	symbolic-common-8.5.0
	symbolic-debuginfo-8.5.0
	syn-0.15.44
	syn-1.0.85
	synstructure-0.12.6
	tempfile-3.3.0
	term-0.5.2
	term_size-0.3.2
	terminal_size-0.1.17
	termtree-0.2.4
	textwrap-0.11.0
	thiserror-1.0.30
	thiserror-impl-1.0.30
	thread_local-1.1.3
	time-0.1.43
	time-0.3.5
	tinyvec-1.5.1
	tinyvec_macros-0.1.0
	tokio-1.15.0
	typenum-1.15.0
	ucd-trie-0.1.3
	unicode-bidi-0.3.7
	unicode-normalization-0.1.19
	unicode-segmentation-1.8.0
	unicode-width-0.1.9
	unicode-xid-0.1.0
	unicode-xid-0.2.2
	unix-daemonize-0.1.2
	url-1.7.2
	url-2.2.2
	username-0.2.0
	uuid-0.8.2
	vcpkg-0.2.15
	version_check-0.9.4
	wait-timeout-0.2.0
	walkdir-2.3.2
	walrus-0.19.0
	walrus-macro-0.19.0
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.3+wasi-snapshot-preview1
	wasmparser-0.77.0
	which-3.1.1
	which-4.2.2
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	xdg-2.4.0
	xml-rs-0.8.4
	yaml-rust-0.4.5
	zip-0.5.13
"

inherit cargo

DESCRIPTION="A command line utility to work with Sentry"
HOMEPAGE="https://github.com/getsentry/sentry-cli"
SRC_URI="$(cargo_crate_uris ${CRATES}) https://github.com/getsentry/sentry-cli/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(CHANGELOG.md LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=virtual/rust-1.46.0"

src_install() {
	cargo_src_install
	einstalldocs
}
