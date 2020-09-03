# Copyright-1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
    aho-corasick-0.7.13
    ansi_term-0.11.0
    ansi_term-0.12.1
    assert_cmd-1.0.1
    atty-0.2.14
    autocfg-1.0.0
    bitflags-1.2.1
    bstr-0.2.13
    cfg-if-0.1.10
    clap-2.33.3
    crossbeam-channel-0.4.3
    crossbeam-utils-0.7.2
    difference-2.0.0
    doc-comment-0.3.3
    fnv-1.0.7
    getrandom-0.1.14
    globset-0.4.5
    hermit-abi-0.1.15
    ignore-0.4.16
    lazy_static-1.4.0
    libc-0.2.74
    log-0.4.11
    lscolors-0.7.1
    memchr-2.3.3
    num_cpus-1.13.0
    ppv-lite86-0.2.8
    predicates-1.0.5
    predicates-core-1.0.0
    predicates-tree-1.0.0
    rand-0.7.3
    rand_chacha-0.2.2
    rand_core-0.5.1
    rand_hc-0.2.0
    redox_syscall-0.1.57
    regex-1.3.9
    regex-syntax-0.6.18
    remove_dir_all-0.5.3
    same-file-1.0.6
    strsim-0.8.0
    tempfile-3.1.0
    terminal_size-0.1.13
    textwrap-0.11.0
    thousands-0.2.0
    thread_local-1.0.1
    treeline-0.1.0
    unicode-width-0.1.8
    vec_map-0.8.2
    wait-timeout-0.2.0
    walkdir-2.3.1
    wasi-0.9.0+wasi-snapshot-preview1
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

src_prepare() {
    sed -i "s/0.5.2/${PV}/g" Cargo.toml
    default
}

src_install() {
    cargo_src_install
    einstalldocs
}
