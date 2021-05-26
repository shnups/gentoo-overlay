# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	addr2line-0.14.0
	adler-0.2.3
	advapi32-sys-0.2.0
	ahash-0.3.8
	aho-corasick-0.7.15
	anyhow-1.0.34
	anylog-0.5.0
	app_dirs-1.2.1
	arrayref-0.3.6
	arrayvec-0.5.2
	assert-json-diff-1.1.0
	assert_cmd-1.0.2
	atty-0.2.14
	autocfg-0.1.7
	autocfg-1.0.1
	backoff-0.1.6
	backtrace-0.3.55
	base64-0.10.1
	base64-0.13.0
	bitflags-1.2.1
	bitmaps-2.1.0
	blake2b_simd-0.5.11
	block-buffer-0.7.3
	block-padding-0.1.5
	brotli-sys-0.3.2
	brotli2-0.3.2
	bstr-0.2.14
	byte-tools-0.3.1
	byteorder-1.3.4
	bzip2-0.3.3
	bzip2-sys-0.1.9+1.0.8
	cc-1.0.66
	cfg-if-0.1.10
	cfg-if-1.0.0
	chardet-0.2.4
	chrono-0.4.19
	clap-2.33.3
	cloudabi-0.0.3
	colored-1.9.3
	console-0.11.3
	const_fn-0.4.4
	constant_time_eq-0.1.5
	crc32fast-1.2.1
	crossbeam-channel-0.4.4
	crossbeam-channel-0.5.0
	crossbeam-deque-0.8.0
	crossbeam-epoch-0.9.1
	crossbeam-utils-0.7.2
	crossbeam-utils-0.8.1
	csv-1.1.5
	csv-core-0.1.10
	curl-0.4.34
	curl-sys-0.4.39+curl-7.74.0
	debugid-0.7.2
	difference-2.0.0
	digest-0.8.1
	dirs-1.0.5
	dirs-2.0.2
	dirs-sys-0.3.5
	dlv-list-0.2.2
	dmsort-1.0.1
	doc-comment-0.3.3
	dotenv-0.15.0
	dtoa-0.4.6
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
	extend-0.1.2
	failure-0.1.8
	failure_derive-0.1.8
	fake-simd-0.1.2
	fallible-iterator-0.2.0
	flate2-1.0.19
	float-cmp-0.8.0
	fnv-1.0.7
	form_urlencoded-1.0.0
	fuchsia-cprng-0.1.1
	generic-array-0.12.3
	getrandom-0.1.15
	gimli-0.23.0
	git2-0.13.12
	glob-0.3.0
	globset-0.4.6
	goblin-0.3.4
	hashbrown-0.7.2
	hashbrown-0.9.1
	heck-0.3.1
	hermit-abi-0.1.17
	hostname-0.3.1
	httparse-1.3.4
	httpdate-0.3.2
	id-arena-2.2.1
	idna-0.1.5
	idna-0.2.0
	if_chain-0.1.3
	if_chain-1.0.1
	ignore-0.4.17
	im-14.3.0
	indexmap-1.6.0
	indicatif-0.14.0
	insta-0.16.1
	instant-0.1.9
	itertools-0.9.0
	itoa-0.4.6
	java-properties-1.3.0
	jobserver-0.1.21
	lazy_static-1.4.0
	lazycell-1.3.0
	leb128-0.2.4
	libc-0.2.81
	libgit2-sys-0.12.14+1.1.0
	libz-sys-1.1.2
	line-wrap-0.1.1
	linked-hash-map-0.5.3
	lock_api-0.3.4
	lock_api-0.4.2
	log-0.4.11
	mac-process-info-0.2.0
	maplit-1.0.2
	match_cfg-0.1.0
	matches-0.1.8
	maybe-uninit-2.0.0
	memchr-2.3.4
	memmap-0.7.0
	memoffset-0.6.1
	might-be-minified-0.3.0
	miniz_oxide-0.4.3
	mockito-0.26.0
	new_debug_unreachable-1.0.4
	normalize-line-endings-0.3.0
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.0
	number_prefix-0.3.0
	object-0.22.0
	ole32-sys-0.2.0
	opaque-debug-0.2.3
	open-1.4.0
	openssl-probe-0.1.2
	openssl-src-111.13.0+1.1.1i
	openssl-sys-0.9.59
	ordered-multimap-0.2.4
	osascript-0.3.0
	parking_lot-0.10.2
	parking_lot-0.11.1
	parking_lot_core-0.7.2
	parking_lot_core-0.8.1
	pdb-0.7.0
	percent-encoding-1.0.1
	percent-encoding-2.1.0
	pest-2.1.3
	pest_derive-2.1.0
	pest_generator-2.1.3
	pest_meta-2.1.3
	phf_shared-0.8.0
	pkg-config-0.3.19
	plain-0.2.3
	plist-0.5.5
	podio-0.1.7
	ppv-lite86-0.2.10
	precomputed-hash-0.1.1
	predicates-1.0.5
	predicates-core-1.0.0
	predicates-tree-1.0.0
	prettytable-rs-0.8.0
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-0.4.30
	proc-macro2-1.0.24
	proguard-4.1.1
	quote-0.6.13
	quote-1.0.7
	r2d2-0.8.9
	rand-0.6.5
	rand-0.7.3
	rand_chacha-0.1.1
	rand_chacha-0.2.2
	rand_core-0.3.1
	rand_core-0.4.2
	rand_core-0.5.1
	rand_hc-0.1.0
	rand_hc-0.2.0
	rand_isaac-0.1.1
	rand_jitter-0.1.4
	rand_os-0.1.3
	rand_pcg-0.1.2
	rand_xorshift-0.1.1
	rand_xoshiro-0.4.0
	rayon-1.5.0
	rayon-core-1.9.0
	rdrand-0.4.0
	redox_syscall-0.1.57
	redox_users-0.3.5
	regex-1.4.2
	regex-automata-0.1.9
	regex-syntax-0.6.21
	remove_dir_all-0.5.3
	runas-0.2.1
	rust-argon2-0.8.3
	rust-ini-0.15.3
	rustc-demangle-0.1.18
	rustc_version-0.2.3
	ryu-1.0.5
	safemem-0.3.3
	same-file-1.0.6
	schannel-0.1.19
	scheduled-thread-pool-0.2.5
	scopeguard-1.1.0
	scroll-0.9.2
	scroll-0.10.2
	scroll_derive-0.9.5
	scroll_derive-0.10.4
	semver-0.9.0
	semver-0.11.0
	semver-parser-0.7.0
	semver-parser-0.10.2
	sentry-0.18.1
	sentry-types-0.14.1
	serde-1.0.118
	serde_derive-1.0.118
	serde_json-1.0.60
	serde_urlencoded-0.6.1
	serde_yaml-0.8.14
	sha-1-0.8.2
	sha1-0.6.0
	shell32-sys-0.1.2
	signal-hook-0.1.16
	signal-hook-registry-1.2.2
	siphasher-0.3.3
	sized-chunks-0.5.3
	smallvec-1.5.1
	socket2-0.3.17
	sourcemap-5.0.0
	stable_deref_trait-1.2.0
	string_cache-0.8.1
	strsim-0.8.0
	symbolic-8.1.0
	symbolic-common-8.1.0
	symbolic-debuginfo-8.1.0
	syn-0.15.44
	syn-1.0.54
	synstructure-0.12.4
	tempfile-3.1.0
	term-0.5.2
	term_size-0.3.2
	terminal_size-0.1.15
	termios-0.3.3
	textwrap-0.11.0
	thiserror-1.0.22
	thiserror-impl-1.0.22
	thread_local-1.0.1
	time-0.1.44
	tinyvec-1.1.0
	tinyvec_macros-0.1.0
	treeline-0.1.0
	typenum-1.12.0
	ucd-trie-0.1.3
	uname-0.1.1
	unicode-bidi-0.3.4
	unicode-normalization-0.1.16
	unicode-segmentation-1.7.1
	unicode-width-0.1.8
	unicode-xid-0.1.0
	unicode-xid-0.2.1
	unix-daemonize-0.1.2
	url-1.7.2
	url-2.2.0
	username-0.2.0
	uuid-0.8.1
	vcpkg-0.2.11
	version_check-0.9.2
	wait-timeout-0.2.0
	walkdir-2.3.1
	walrus-0.18.0
	walrus-macro-0.18.0
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.0+wasi-snapshot-preview1
	wasmparser-0.59.0
	which-3.1.1
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	xdg-2.2.0
	xml-rs-0.8.3
	yaml-rust-0.4.4
	zip-0.5.6
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
