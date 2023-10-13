# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	autocfg-1.1.0
	base64-0.13.0
	bitflags-1.3.2
	bumpalo-3.10.0
	bytes-1.1.0
	cc-1.0.73
	cfg-if-1.0.0
	comfy-table-6.0.0
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	crossterm-0.23.2
	crossterm_winapi-0.9.0
	encoding_rs-0.8.31
	fastrand-1.7.0
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	futures-channel-0.3.21
	futures-core-0.3.21
	futures-io-0.3.21
	futures-sink-0.3.21
	futures-task-0.3.21
	futures-util-0.3.21
	h2-0.3.13
	hashbrown-0.11.2
	heck-0.4.0
	hermit-abi-0.1.19
	http-0.2.8
	http-body-0.4.5
	httparse-1.7.1
	httpdate-1.0.2
	hyper-0.14.19
	hyper-tls-0.5.0
	idna-0.2.3
	indexmap-1.8.2
	instant-0.1.12
	ipnet-2.5.0
	itoa-1.0.2
	js-sys-0.3.57
	lazy_static-1.4.0
	libc-0.2.126
	lock_api-0.4.7
	log-0.4.17
	matches-0.1.9
	memchr-2.5.0
	mime-0.3.16
	mio-0.8.3
	native-tls-0.2.10
	num_cpus-1.13.1
	once_cell-1.12.0
	openssl-0.10.40
	openssl-macros-0.1.0
	openssl-probe-0.1.5
	openssl-sys-0.9.74
	parking_lot-0.12.1
	parking_lot_core-0.9.3
	percent-encoding-2.1.0
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	proc-macro2-1.0.39
	quote-1.0.18
	redox_syscall-0.2.13
	remove_dir_all-0.5.3
	reqwest-0.11.10
	rustversion-1.0.6
	ryu-1.0.10
	schannel-0.1.20
	scopeguard-1.1.0
	security-framework-2.6.1
	security-framework-sys-2.6.1
	serde-1.0.137
	serde_derive-1.0.137
	serde_json-1.0.81
	serde_urlencoded-0.7.1
	signal-hook-0.3.14
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.0
	slab-0.4.6
	smallvec-1.8.0
	socket2-0.4.4
	strum-0.24.0
	strum_macros-0.24.0
	syn-1.0.96
	tempfile-3.3.0
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tokio-1.19.2
	tokio-native-tls-0.3.0
	tokio-util-0.7.3
	tower-service-0.3.1
	tracing-0.1.34
	tracing-core-0.1.26
	try-lock-0.2.3
	unicode-bidi-0.3.8
	unicode-ident-1.0.0
	unicode-normalization-0.1.19
	unicode-width-0.1.9
	url-2.2.2
	vcpkg-0.2.15
	want-0.3.0
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.80
	wasm-bindgen-backend-0.2.80
	wasm-bindgen-futures-0.4.30
	wasm-bindgen-macro-0.2.80
	wasm-bindgen-macro-support-0.2.80
	wasm-bindgen-shared-0.2.80
	web-sys-0.3.57
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
	winreg-0.10.1
"

inherit git-r3 cargo

EGIT_REPO_URI="https://github.com/pinpox/${PN}.git"

DESCRIPTION="Show firing Prometheus alerts in the terminal"
HOMEPAGE="https://github.com/pinpox/${PN}"
SRC_URI="$(cargo_crate_uris ${CRATES})"


# LICENSE="MIT"  # FIXME: Unknown license
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=virtual/rust-1.65.0"

src_unpack() {
	git-r3_src_unpack
	cargo_src_unpack
}

src_compile() {
    cargo_gen_config
    cargo_src_compile
}

src_install() {
	default
	einstalldocs
}