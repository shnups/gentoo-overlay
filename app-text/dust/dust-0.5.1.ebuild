# Copyright-1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
    ansi_term-0.11.0
    ansi_term-0.12.1
    assert_cli-0.6.3
    atty-0.2.14
    autocfg-0.1.7
    backtrace-0.3.44
    backtrace-sys-0.1.32
    bitflags-1.2.1
    c2-chacha-0.2.3
    cc-1.0.50
    cfg-if-0.1.10
    clap-2.33.0
    colored-1.9.2
    crossbeam-0.7.3
    crossbeam-channel-0.4.0
    crossbeam-deque-0.7.2
    crossbeam-epoch-0.8.0
    crossbeam-queue-0.2.1
    crossbeam-utils-0.7.0
    difference-2.0.0
    either-1.5.3
    environment-0.1.1
    failure-0.1.6
    failure_derive-0.1.6
    getrandom-0.1.14
    hermit-abi-0.1.6
    itoa-0.4.5
    jwalk-0.4.0
    lazy_static-1.4.0
    libc-0.2.66
    lscolors-0.6.0
    memoffset-0.5.3
    num_cpus-1.12.0
    ppv-lite86-0.2.6
    proc-macro2-1.0.8
    quote-1.0.2
    rand-0.7.3
    rand_chacha-0.2.1
    rand_core-0.5.1
    rand_hc-0.2.0
    rayon-1.3.0
    rayon-core-1.7.0
    redox_syscall-0.1.56
    remove_dir_all-0.5.2
    rustc-demangle-0.1.16
    rustc_version-0.2.3
    ryu-1.0.2
    scopeguard-1.0.0
    semver-0.9.0
    semver-parser-0.7.0
    serde-1.0.104
    serde_json-1.0.47
    strsim-0.8.0
    syn-1.0.14
    synstructure-0.12.3
    tempfile-3.1.0
    terminal_size-0.1.10
    textwrap-0.11.0
    unicode-width-0.1.7
    unicode-xid-0.2.0
    vec_map-0.8.1
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
DOCS=(LICENSE README.md)
