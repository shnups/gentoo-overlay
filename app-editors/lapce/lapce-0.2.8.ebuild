# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	Inflector-0.11.4
	addr2line-0.17.0
	adler-1.0.2
	ahash-0.7.6
	aho-corasick-0.7.19
	alacritty_config-0.1.0
	alacritty_config_derive-0.2.0
	alacritty_terminal-0.17.0
	ambient-authority-0.0.1
	android_system_properties-0.1.5
	ansi_term-0.12.1
	anyhow-1.0.65
	arc-swap-1.5.1
	arrayref-0.3.6
	arrayvec-0.5.2
	arrayvec-0.7.2
	async-channel-1.7.1
	async-task-4.3.0
	async-trait-0.1.57
	atk-0.14.0
	atk-sys-0.14.0
	atomic-waker-1.0.0
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.66
	base64-0.8.0
	base64-0.13.0
	bincode-1.3.3
	bit_field-0.10.1
	bitflags-1.3.2
	bitmaps-2.1.0
	block-0.1.6
	block-buffer-0.9.0
	block-buffer-0.10.3
	blocking-1.2.0
	bstr-0.2.17
	bumpalo-3.11.0
	bytecount-0.6.3
	bytemuck-1.12.1
	bytemuck_derive-1.2.1
	byteorder-1.4.3
	bytes-1.2.1
	cache-padded-1.2.0
	cairo-rs-0.14.9
	cairo-sys-rs-0.14.9
	cap-fs-ext-0.25.3
	cap-primitives-0.25.3
	cap-rand-0.25.3
	cap-std-0.25.3
	cap-time-ext-0.25.3
	cc-1.0.73
	cfg-expr-0.8.1
	cfg-if-0.1.10
	cfg-if-1.0.0
	cgl-0.3.2
	chrono-0.4.22
	clap-3.2.22
	clap_derive-3.2.18
	clap_lex-0.2.4
	cmake-0.1.48
	cocoa-0.24.0
	cocoa-foundation-0.1.0
	color_quant-1.1.0
	combine-4.6.6
	concurrent-queue-1.2.4
	config-0.13.2
	console_error_panic_hook-0.1.7
	const-cstr-0.3.0
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	core-graphics-0.22.3
	core-graphics-types-0.1.1
	core-text-19.2.0
	cpp_demangle-0.3.5
	cpufeatures-0.2.5
	cranelift-bforest-0.88.2
	cranelift-codegen-0.88.2
	cranelift-codegen-meta-0.88.2
	cranelift-codegen-shared-0.88.2
	cranelift-entity-0.88.2
	cranelift-frontend-0.88.2
	cranelift-isle-0.88.2
	cranelift-native-0.88.2
	cranelift-wasm-0.88.2
	crc32fast-1.3.2
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.10
	crossbeam-utils-0.8.11
	crypto-common-0.1.6
	darling-0.13.4
	darling_core-0.13.4
	darling_macro-0.13.4
	data-url-0.1.1
	digest-0.9.0
	digest-0.10.5
	directories-4.0.1
	directories-next-2.0.0
	dirs-4.0.0
	dirs-next-2.0.0
	dirs-sys-0.3.7
	dirs-sys-next-0.1.2
	dlib-0.5.0
	dmg-0.1.1
	druid-derive-0.4.0
	druid-shell-0.7.0
	dwrote-0.11.0
	dyn-clone-1.0.10
	either-1.8.0
	encoding_rs-0.8.31
	encoding_rs_io-0.1.7
	env_logger-0.9.1
	errno-0.2.8
	errno-dragonfly-0.1.2
	euclid-0.22.7
	event-listener-2.5.3
	exr-1.5.1
	fallible-iterator-0.2.0
	fastrand-1.8.0
	fern-0.6.1
	field-offset-0.3.4
	file-per-thread-logger-0.1.5
	filetime-0.2.17
	fixedbitset-0.2.0
	flate2-1.0.24
	float-cmp-0.5.3
	float-cmp-0.9.0
	float-ord-0.2.0
	float_next_after-0.1.5
	fluent-bundle-0.15.2
	fluent-langneg-0.13.0
	fluent-syntax-0.11.0
	flume-0.10.14
	fnv-1.0.7
	font-kit-0.11.0
	fontconfig-parser-0.5.0
	fontdb-0.5.4
	fontdb-0.9.1
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.1.0
	freetype-0.7.0
	freetype-sys-0.13.1
	fs-set-times-0.17.1
	fs2-0.4.3
	fs_extra-1.2.0
	fsevent-sys-4.1.0
	fuchsia-zircon-0.3.3
	fuchsia-zircon-sys-0.3.3
	futures-0.3.24
	futures-channel-0.3.24
	futures-core-0.3.24
	futures-executor-0.3.24
	futures-io-0.3.24
	futures-lite-1.12.0
	futures-macro-0.3.24
	futures-sink-0.3.24
	futures-task-0.3.24
	futures-util-0.3.24
	fuzzy-matcher-0.3.7
	fxhash-0.2.1
	gdk-0.14.3
	gdk-pixbuf-0.14.0
	gdk-pixbuf-sys-0.14.0
	gdk-sys-0.14.0
	generic-array-0.14.6
	getopts-0.2.21
	getrandom-0.2.7
	gif-0.11.4
	gimli-0.26.2
	gio-0.14.8
	gio-sys-0.14.0
	git2-0.16.1
	gl_generator-0.14.0
	gl_loader-0.1.2
	glam-0.10.2
	glib-0.14.8
	glib-macros-0.14.1
	glib-sys-0.14.0
	glob-0.3.0
	globset-0.4.9
	glow-0.11.2
	glutin_wgl_sys-0.1.5
	gobject-sys-0.14.0
	grep-matcher-0.1.5
	grep-regex-0.1.10
	grep-searcher-0.1.10
	gtk-0.14.3
	gtk-sys-0.14.0
	gtk3-macros-0.14.0
	h2-0.3.14
	half-1.8.2
	hashbrown-0.11.2
	hashbrown-0.12.3
	heck-0.3.3
	heck-0.4.0
	hermit-abi-0.1.19
	hermit-abi-0.2.6
	http-0.2.8
	http-body-0.4.5
	httparse-1.8.0
	httpdate-1.0.2
	human-sort-0.2.2
	humantime-2.1.0
	hyper-0.14.20
	hyper-tls-0.5.0
	iana-time-zone-0.1.50
	ident_case-1.0.1
	idna-0.3.0
	ignore-0.4.18
	im-15.1.0
	image-0.24.4
	include_dir-0.6.2
	include_dir_impl-0.6.2
	indexmap-1.9.2
	inotify-0.9.6
	inotify-sys-0.1.5
	instant-0.1.12
	interprocess-1.1.1
	intl-memoizer-0.5.1
	intl_pluralrules-7.0.1
	intmap-0.7.1
	io-extras-0.15.0
	io-lifetimes-0.7.3
	iovec-0.1.4
	ipnet-2.5.0
	is-terminal-0.3.0
	itertools-0.10.5
	itoa-1.0.3
	ittapi-0.3.2
	ittapi-sys-0.3.2
	jobserver-0.1.25
	jpeg-decoder-0.2.6
	js-sys-0.3.60
	jsonrpc-lite-0.6.0
	kernel32-sys-0.2.2
	keyboard-types-0.6.2
	khronos_api-3.1.0
	kqueue-1.0.6
	kqueue-sys-1.0.3
	kurbo-0.8.3
	lazy_static-1.4.0
	lazycell-1.3.0
	leb128-0.2.5
	lebe-0.5.2
	libc-0.2.133
	libgit2-sys-0.14.2+1.5.1
	libloading-0.7.3
	libssh2-sys-0.2.23
	libz-sys-1.1.8
	linked-hash-map-0.5.6
	linux-raw-sys-0.0.46
	locale_config-0.3.0
	lock_api-0.4.9
	log-0.3.9
	log-0.4.17
	log-panics-2.1.0
	lsp-types-0.93.1
	lyon-0.17.10
	lyon_algorithms-0.17.7
	lyon_geom-0.17.7
	lyon_path-0.17.7
	lyon_tessellation-0.17.10
	mach-0.3.2
	malloc_buf-0.0.6
	matches-0.1.9
	maybe-owned-0.3.4
	memchr-2.5.0
	memfd-0.6.1
	memmap2-0.2.3
	memmap2-0.5.7
	memoffset-0.6.5
	mime-0.3.16
	minimal-lexical-0.2.1
	miniz_oxide-0.5.4
	mio-0.6.23
	mio-0.8.4
	mio-anonymous-pipes-0.2.0
	mio-extras-2.0.6
	mio-uds-0.6.8
	miow-0.2.2
	miow-0.3.7
	nanorand-0.7.0
	native-tls-0.2.10
	net2-0.2.37
	nix-0.24.2
	nom-7.1.1
	notify-5.0.0
	num-integer-0.1.45
	num-rational-0.4.1
	num-traits-0.2.15
	num_cpus-1.13.1
	num_threads-0.1.6
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	object-0.29.0
	once_cell-1.17.1
	opaque-debug-0.3.0
	open-3.0.3
	openssl-0.10.42
	openssl-macros-0.1.0
	openssl-probe-0.1.5
	openssl-src-111.22.0+1.1.1q
	openssl-sys-0.9.76
	os_str_bytes-6.3.0
	pango-0.14.8
	pango-sys-0.14.0
	parking-2.0.0
	parking_lot-0.11.2
	parking_lot-0.12.1
	parking_lot_core-0.8.5
	parking_lot_core-0.9.3
	paste-1.0.9
	pathdiff-0.2.1
	pathfinder_geometry-0.5.1
	pathfinder_simd-0.5.1
	percent-encoding-2.2.0
	pest-2.3.1
	petgraph-0.5.1
	pico-args-0.4.2
	piet-0.4.0
	piet-wgpu-0.1.0
	pin-project-1.0.12
	pin-project-internal-1.0.12
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	plist-0.2.4
	png-0.17.6
	ppv-lite86-0.2.16
	proc-macro-crate-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro2-1.0.44
	psm-0.1.21
	psp-types-0.1.0
	pulldown-cmark-0.9.2
	quote-1.0.21
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	rand_xoshiro-0.6.0
	rayon-1.5.3
	rayon-core-1.9.3
	rctree-0.3.3
	rctree-0.4.0
	redox_syscall-0.2.16
	redox_users-0.4.3
	regalloc2-0.3.2
	regex-1.7.0
	regex-automata-0.1.10
	regex-syntax-0.6.27
	remove_dir_all-0.5.3
	reqwest-0.11.12
	resvg-0.22.0
	rgb-0.8.34
	roxmltree-0.14.1
	rustc-demangle-0.1.21
	rustc-hash-1.1.0
	rustc_version-0.3.3
	rustix-0.35.10
	rustybuzz-0.3.0
	rustybuzz-0.5.1
	ryu-1.0.11
	safe_arch-0.5.2
	safemem-0.2.0
	same-file-1.0.6
	schannel-0.1.20
	scoped_threadpool-0.1.9
	scopeguard-1.1.0
	security-framework-2.7.0
	security-framework-sys-2.6.1
	self_cell-0.10.2
	semver-0.11.0
	semver-parser-0.10.2
	serde-1.0.145
	serde_derive-1.0.145
	serde_json-1.0.87
	serde_repr-0.1.9
	serde_urlencoded-0.7.1
	serde_yaml-0.8.26
	sha2-0.9.9
	sha2-0.10.6
	sharded-slab-0.1.4
	shellexpand-2.1.2
	sid-0.6.1
	signal-hook-0.3.14
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.0
	simplecss-0.2.1
	siphasher-0.2.3
	siphasher-0.3.10
	sized-chunks-0.6.5
	slab-0.4.7
	sled-0.34.7
	slice-group-by-0.3.0
	slotmap-1.0.6
	smallvec-1.10.0
	socket2-0.4.7
	spin-0.9.4
	spinning-0.1.0
	spsc-buffer-0.1.1
	stable_deref_trait-1.2.0
	strsim-0.10.0
	strum-0.21.0
	strum_macros-0.21.1
	svgfilters-0.4.0
	svgtypes-0.5.0
	svgtypes-0.8.1
	swash-0.1.4
	syn-1.0.101
	system-deps-3.2.0
	system-interface-0.22.0
	tar-0.4.38
	target-lexicon-0.12.4
	tempfile-3.3.0
	termcolor-1.1.3
	textwrap-0.15.2
	thiserror-1.0.36
	thiserror-impl-1.0.36
	thread-id-4.0.0
	thread_local-1.1.4
	threadpool-1.8.1
	tiff-0.7.3
	time-0.1.44
	time-0.3.14
	tiny-skia-0.6.6
	tinystr-0.3.4
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tokio-1.21.1
	tokio-macros-1.8.0
	tokio-native-tls-0.3.0
	tokio-socks-0.5.1
	tokio-util-0.7.4
	toml-0.5.9
	toml_edit-0.14.4
	tower-service-0.3.2
	tracing-0.1.36
	tracing-attributes-0.1.22
	tracing-core-0.1.29
	tracing-subscriber-0.3.15
	tracing-wasm-0.2.1
	trash-2.1.5
	tree-sitter-0.20.9
	tree-sitter-c-0.20.2
	tree-sitter-cpp-0.20.0
	tree-sitter-cmake-0.1.0
	tree-sitter-elm-5.6.3
	tree-sitter-go-0.19.1
	tree-sitter-hare-0.20.7
	tree-sitter-html-0.19.0
	tree-sitter-javascript-0.20.0
	tree-sitter-md-0.1.2
	tree-sitter-prisma-io-1.3.0
	tree-sitter-r-0.19.5
	tree-sitter-rust-0.20.1
	tree-sitter-swift-0.3.4
	tree-sitter-toml-0.20.0
	tree-sitter-typescript-0.20.1
	tree-sitter-vue-0.0.3
	try-lock-0.2.3
	ttf-parser-0.9.0
	ttf-parser-0.12.3
	ttf-parser-0.15.2
	type-map-0.4.0
	typenum-1.15.0
	ucd-trie-0.1.5
	unic-bidi-0.9.0
	unic-char-property-0.9.0
	unic-char-range-0.9.0
	unic-common-0.9.0
	unic-langid-0.9.0
	unic-langid-impl-0.9.0
	unic-ucd-bidi-0.9.0
	unic-ucd-version-0.9.0
	unicase-2.6.0
	unicode-bidi-0.3.8
	unicode-bidi-mirroring-0.1.0
	unicode-ccc-0.1.2
	unicode-general-category-0.2.0
	unicode-general-category-0.4.0
	unicode-ident-1.0.4
	unicode-normalization-0.1.22
	unicode-script-0.5.5
	unicode-segmentation-1.10.0
	unicode-vo-0.1.0
	unicode-width-0.1.10
	url-2.3.1
	usvg-0.14.1
	usvg-0.22.0
	utf8parse-0.2.0
	uuid-1.2.2
	vcpkg-0.2.15
	version-compare-0.0.11
	version_check-0.9.4
	vte-0.10.1
	vte_generate_state_changes-0.1.1
	waker-fn-1.1.0
	walkdir-2.3.2
	want-0.3.0
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasi-cap-std-sync-1.0.2
	wasi-common-1.0.2
	wasi-experimental-http-wasmtime-0.10.0
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-futures-0.4.33
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	wasm-encoder-0.17.0
	wasmparser-0.89.1
	wasmtime-1.0.2
	wasmtime-asm-macros-1.0.2
	wasmtime-cache-1.0.2
	wasmtime-cranelift-1.0.2
	wasmtime-environ-1.0.2
	wasmtime-fiber-1.0.2
	wasmtime-jit-1.0.2
	wasmtime-jit-debug-1.0.2
	wasmtime-runtime-1.0.2
	wasmtime-types-1.0.2
	wasmtime-wasi-1.0.2
	wast-35.0.2
	wast-47.0.0
	wat-1.0.49
	web-sys-0.3.60
	weezl-0.1.7
	which-4.3.0
	wiggle-1.0.2
	wiggle-generate-1.0.2
	wiggle-macro-1.0.2
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.37.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.37.0
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.37.0
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.37.0
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.37.0
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.37.0
	winreg-0.10.1
	winres-0.1.12
	winx-0.33.0
	wio-0.2.2
	witx-0.9.1
	ws2_32-sys-0.2.1
	xattr-0.2.3
	xi-unicode-0.3.0
	xml-rs-0.7.0
	xml-rs-0.8.4
	xmlparser-0.13.3
	xmlwriter-0.1.0
	yaml-rust-0.4.5
	yazi-0.1.4
	yeslogic-fontconfig-sys-3.2.0
	zeno-0.2.2
	zip-0.6.3
	zstd-0.11.2+zstd.1.5.2
	zstd-safe-5.0.2+zstd.1.5.2
	zstd-sys-2.0.1+zstd.1.5.2
"
# 	floem_renderer-0.1.0
#	floem_vger-0.1.0
	# lapce-0.2.8
	# lapce-core-0.2.8
	# lapce-data-0.2.8
	# lapce-proxy-0.2.8
	# lapce-rpc-0.2.8
	# lapce-ui-0.2.8
	# lapce-xi-rope-0.3.1


# 	[home]="https://github.com/rbtcollins/home;a243ee2fbee6022c57d56f5aa79aefe194eabe53"
# declare -A GIT_CRATES=(
# 	[floem]="https://github.com/lapce/floem;17ffb5577d9519d04b1871b01e60da70f0765b11"
# 	[fount]="https://github.com/lapce/fount:3bfdc689c0cfbeb498358c79c7be2cb3beb44efe"
# 	[glazier]="https://github.com/lapce/glazier"
# 	[parley]="https://github.com/lapce/parley:c37477b889ff53b9a3033e2180becddf90b9bb17"
# 	[peniko]="https://github.com/linebender/peniko"
# 	[structdesc]="https://github.com/lapce/structdesc"
# 	[tracing]="https://github.com/tokio-rs/tracing:"
# )

declare -A GIT_CRATES=(
	[druid]="https://github.com/lapce/druid;0b9c00fcda238e392e758382f25166cd748fd305"
	[fount]="https://github.com/lapce/fount;3bfdc689c0cfbeb498358c79c7be2cb3beb44efe"
	[parley]="https://github.com/lapce/parley;c37477b889ff53b9a3033e2180becddf90b9bb17"
	[structdesc]="https://github.com/lapce/structdesc;a6a2b8ab65d43475238f889736c4aa5dfff4500a"
	# [tree-sitter]="https://github.com/tree-sitter/tree-sitter;90fca305bf211849bc28c65f2cad012c5e265c72"
	[tree-sitter-bash]="https://github.com/tree-sitter/tree-sitter-bash;b6667bed364733c8a8f8e5973749f86cfa04ba2a"
	# [tree-sitter-c]="https://github.com/tree-sitter/tree-sitter-c;0.20.2"
	[tree-sitter-c-sharp]="https://github.com/tree-sitter/tree-sitter-c-sharp;5b60f99545fea00a33bbfae5be956f684c4c69e2"
	[tree-sitter-clojure]="https://github.com/abreumatheus/tree-sitter-clojure;fdc969eb04fc711e38ad74afe441d74b3b5d3091"
	# [tree-sitter-cmake]="https://github.com/tree-sitter/tree-sitter-cmake;0.1.0"
	# [tree-sitter-cpp]="https://github.com/tree-sitter/tree-sitter-cpp;0.20.0"
	[tree-sitter-css]="https://github.com/syntacti/tree-sitter-css;397aa132b9982fcdd2d473ed69343762a557f10a"
	[tree-sitter-d]="https://github.com/ghishadow/tree-sitter-d;92179b00995bc16694671c58f513ccdda13f4b27"
	[tree-sitter-dart]="https://github.com/syntacti/tree-sitter-dart;78cad4503571d72666f78d5ba8ed6c1417653063"
	[tree-sitter-dockerfile]="https://github.com/panekj/tree-sitter-dockerfile;c49d819e07685c90456270f1cc654d9cba640f53"
	[tree-sitter-elixir]="https://github.com/elixir-lang/tree-sitter-elixir;05e3631c6a0701c1fa518b0fee7be95a2ceef5e2"
	# [tree-sitter-elm]="https://github.com/tree-sitter/tree-sitter-elm;5.6.3"
	[tree-sitter-erlang]="https://github.com/WhatsApp/tree-sitter-erlang;5dba13dcd531c19bf99829e2e0bb31f2e08e16fe"
	[tree-sitter-glimmer]="https://github.com/VixieTSQ/tree-sitter-glimmer;7281caca2ba114e1960c5d944a37860ef0841426"
	[tree-sitter-glsl]="https://github.com/theHamsta/tree-sitter-glsl;74329feb2605deccd32b1c644af507daa6fb82f1"
	# [tree-sitter-go]="https://github.com/tree-sitter/tree-sitter-go;0.19.1"
	# [tree-sitter-hare]="https://github.com/tree-sitter/tree-sitter-hare;0.20.7"
	[tree-sitter-haskell]="https://github.com/tree-sitter/tree-sitter-haskell;e30bdfd53eb28c73f26a68b77d436fd2140af167"
	[tree-sitter-haxe]="https://github.com/vantreeseba/tree-sitter-haxe;32f6bda9b568ae47c89678096de9b4d0cbd450b8"
	[tree-sitter-hcl]="https://github.com/VixieTSQ/tree-sitter-hcl;f4aa4553344e03e149ec459549a7f686d6846626"
	# [tree-sitter-html]="https://github.com/tree-sitter/tree-sitter-html;0.19.0"
	[tree-sitter-java]="https://github.com/tree-sitter/tree-sitter-java;09d650def6cdf7f479f4b78f595e9ef5b58ce31e"
	# [tree-sitter-javascript]="https://github.com/tree-sitter/tree-sitter-javascript;0.20.0"
	[tree-sitter-json]="https://github.com/tree-sitter/tree-sitter-json;137e1ce6a02698fc246cdb9c6b886ed1de9a1ed8"
	[tree-sitter-julia]="https://github.com/varlad/tree-sitter-julia;2ad4c9b79e0f213b61dbb3820754bfc6306e595a"
	[tree-sitter-kotlin]="https://github.com/fwcd/tree-sitter-kotlin;a4f71eb9b8c9b19ded3e0e9470be4b1b77c2b569"
	[tree-sitter-latex]="https://github.com/latex-lsp/tree-sitter-latex;b3b2cf27f33e71438ebe46934900b1153901c6f2"
	[tree-sitter-lua]="https://github.com/syntacti/tree-sitter-lua;c9ece5b2d348f917052db5a2da9bd4ecff07426c"
	# [tree-sitter-markdown]="https://github.com/MDeiml/tree-sitter-markdown;272e080bca0efd19a06a7f4252d746417224959e"
	[tree-sitter-nix]="https://github.com/panekj/tree-sitter-nix;59fc47150ab437e8bb356c7ab21e9531e87f7cc8"
	[tree-sitter-ocaml]="https://github.com/tree-sitter/tree-sitter-ocaml;cc26b1ef111100f26a137bcbcd39fd4e35be9a59"
	[tree-sitter-php]="https://github.com/tree-sitter/tree-sitter-php;ab2e72179ceb8bb0b249c8ac9162a148e911b3dc"
	# [tree-sitter-prisma-io]="https://github.com/tree-sitter/tree-sitter-prisma-io;1.3.0"
	[tree-sitter-protobuf]="https://github.com/yusdacra/tree-sitter-protobuf;5aef38d655f76a6b0d172340eed3766c93b3124c"
	[tree-sitter-python]="https://github.com/tree-sitter/tree-sitter-python;de221eccf9a221f5b85474a553474a69b4b5784d"
	[tree-sitter-ql]="https://github.com/tree-sitter/tree-sitter-ql;e58144140d7564392327a6d3f4b064d70aeb5c53"
	# [tree-sitter-r]="https://github.com/tree-sitter/tree-sitter-r;0.19.5"
	[tree-sitter-ruby]="https://github.com/tree-sitter/tree-sitter-ruby;656abef0645caea793e33c1c773570722463e1d8"
	# [tree-sitter-rust]="https://github.com/tree-sitter/tree-sitter-rust;0.20.1"
	[tree-sitter-scheme]="https://github.com/6cdh/tree-sitter-scheme;af0fd1fa452cb2562dc7b5c8a8c55551c39273b9"
	[tree-sitter-scss]="https://github.com/VixieTSQ/tree-sitter-scss;3aac3391ede5098edbf4cc8a9f6d0cfdfe28e5dc"
	[tree-sitter-sql]="https://github.com/oknozor/tree-sitter-sql;15dad0f3cae8a094a7dac17d712ea8fb25228011"
	[tree-sitter-svelte]="https://github.com/Himujjal/tree-sitter-svelte;52e122ae68b316d3aa960a0a422d3645ba717f42"
	# [tree-sitter-swift]="https://github.com/tree-sitter/tree-sitter-swift;0.3.4"
	# [tree-sitter-toml]="https://github.com/tree-sitter/tree-sitter-toml;0.20.0"
	# [tree-sitter-typescript]="https://github.com/tree-sitter/tree-sitter-typescript;0.20.1"
	# [tree-sitter-vue]="https://github.com/tree-sitter/tree-sitter-vue;0.0.3"
	[tree-sitter-wgsl]="https://github.com/szebniok/tree-sitter-wgsl;40259f3c77ea856841a4e0c4c807705f3e4a2b65"
	[tree-sitter-xml]="https://github.com/RenjiSann/tree-sitter-xml;422528a43630db6dcc1e222d1c5ee3babd559473"
	[tree-sitter-yaml]="https://github.com/panekj/tree-sitter-yaml;80c8d76847f03e772c5c524cf29bafb56858a8d1"
	[tree-sitter-zig]="https://github.com/maxxnino/tree-sitter-zig;8d3224c3bd0890fe08358886ebf54fca2ed448a6"
)


inherit cargo

DESCRIPTION="Lightning-fast and Powerful Code Editor written in Rust"
HOMEPAGE="https://lapce.dev/"
SRC_URI="$(cargo_crate_uris ${CRATES}) https://github.com/lapce/lapce/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(CHANGELOG.md CONTRIBUTING.md LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=virtual/rust-1.65"

src_install() {
	cargo_src_install
	einstalldocs
}
