# Copyright-1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
aho-corasick-0.7.6
ansi_term-0.11.0
arc-swap-0.4.4
arrayref-0.3.5
arrayvec-0.4.12
atty-0.2.13
autocfg-0.1.7
backtrace-0.3.40
backtrace-sys-0.1.32
base64-0.10.1
bitflags-1.2.1
blake2b_simd-0.5.8
${PF}
bstr-0.2.8
bumpalo-3.2.1
byteorder-1.3.2
cast-0.2.3
cc-1.0.46
cfg-if-0.1.10
chrono-0.4.9
clap-2.33.0
cloudabi-0.0.3
constant_time_eq-0.1.4
criterion-0.3.1
criterion-plot-0.4.1
crossbeam-0.7.2
crossbeam-channel-0.3.9
crossbeam-deque-0.7.2
crossbeam-epoch-0.7.2
crossbeam-epoch-0.8.0
crossbeam-queue-0.1.2
crossbeam-queue-0.2.0
crossbeam-utils-0.6.6
crossbeam-utils-0.7.0
crossterm-0.17.5
crossterm_winapi-0.6.1
csv-1.1.1
csv-core-0.1.6
custom_error-1.7.1
directories-2.0.2
dirs-2.0.2
dirs-sys-0.3.4
either-1.5.3
failure-0.1.6
failure_derive-0.1.6
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
git2-0.11.0
glob-0.3.0
hermit-abi-0.1.3
id-arena-2.2.1
idna-0.2.0
iovec-0.1.4
is_executable-0.1.2
itertools-0.8.2
itoa-0.4.4
jobserver-0.1.19
js-sys-0.3.37
kernel32-sys-0.2.2
lazy-regex-0.1.3
lazy_static-1.4.0
libc-0.2.65
libgit2-sys-0.10.0
libz-sys-1.0.25
lock_api-0.3.2
log-0.4.8
matches-0.1.8
memchr-2.2.1
memoffset-0.5.2
minimad-0.6.4
mio-0.6.21
miow-0.2.1
net2-0.2.33
nodrop-0.1.14
num-integer-0.1.41
num-traits-0.2.8
num_cpus-1.11.1
oorandom-11.1.0
open-1.4.0
parking_lot-0.10.0
parking_lot_core-0.7.0
pathdiff-0.1.0
percent-encoding-2.1.0
pkg-config-0.3.17
plotters-0.2.12
proc-macro2-1.0.10
quote-1.0.2
rand_core-0.3.1
rand_core-0.4.2
rand_os-0.1.3
rayon-1.3.0
rayon-core-1.7.0
rdrand-0.4.0
redox_syscall-0.1.56
redox_users-0.3.1
regex-1.3.1
regex-automata-0.1.8
regex-syntax-0.6.12
rust-argon2-0.5.1
rustc-demangle-0.1.16
rustc_version-0.2.3
ryu-1.0.2
same-file-1.0.5
scopeguard-1.0.0
secular-0.2.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.102
serde_derive-1.0.103
serde_json-1.0.42
signal-hook-0.1.15
signal-hook-registry-1.2.0
simplelog-0.7.4
slab-0.4.2
smallvec-1.0.0
strict-0.1.3
strsim-0.8.0
syn-1.0.17
synstructure-0.12.1
term-0.6.1
termimad-0.8.23
textwrap-0.11.0
thiserror-1.0.19
thiserror-impl-1.0.19
thread_local-0.3.6
time-0.1.42
tinytemplate-1.0.2
toml-0.5.5
umask-1.0.0
unicode-bidi-0.3.4
unicode-normalization-0.1.11
unicode-width-0.1.6
unicode-xid-0.2.0
url-2.1.1
users-0.9.1
vcpkg-0.2.8
vec_map-0.8.1
walkdir-2.3.1
wasm-bindgen-0.2.60
wasm-bindgen-backend-0.2.60
wasm-bindgen-macro-0.2.60
wasm-bindgen-macro-support-0.2.60
wasm-bindgen-shared-0.2.60
web-sys-0.3.37
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.2
winapi-x86_64-pc-windows-gnu-0.4.0
ws2_32-sys-0.2.1
"

inherit cargo

DESCRIPTION="A new way to see and navigate directory trees"
HOMEPAGE="https://github.com/Canop/${PN}"
SRC_URI="$(cargo_crate_uris ${CRATES})"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=(CHANGELOG.md LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=virtual/rust-1.41.1"

src_install() {
    newman "${S}/man/page" "${PN}.1"
    rm -rf "${S}/man"

    cargo_src_install
    einstalldocs
}
