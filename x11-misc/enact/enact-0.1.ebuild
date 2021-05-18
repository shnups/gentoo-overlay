# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	anyhow-1.0.28
	autocfg-1.0.0
	bitflags-1.2.1
	cfg-if-0.1.10
	chrono-0.4.11
	clap-2.33.0
	either-1.5.3
	flexi_logger-0.15.2
	glob-0.3.0
	heck-0.3.1
	itertools-0.9.0
	lazy_static-1.4.0
	libc-0.2.68
	log-0.4.8
	num-integer-0.1.42
	num-traits-0.2.11
	proc-macro-error-1.0.2
	proc-macro-error-attr-1.0.2
	proc-macro2-1.0.9
	quote-1.0.3
	redox_syscall-0.1.56
	structopt-0.3.13
	structopt-derive-0.4.6
	syn-1.0.17
	syn-mid-0.5.0
	textwrap-0.11.0
	thiserror-1.0.13
	thiserror-impl-1.0.13
	time-0.1.42
	unicode-segmentation-1.6.0
	unicode-width-0.1.7
	unicode-xid-0.2.0
	version_check-0.9.1
	winapi-0.3.8
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Easy dual-monitor setup and hotplug support for minimalistic window managers"
HOMEPAGE="https://github.com/chmln/enact"
SRC_URI="$(cargo_crate_uris ${CRATES}) https://github.com/chmln/enact/archive/v${PV}.tar.gz -> ${P}.tar.gz"

# LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(README.md)

src_install() {
	cargo_src_install
	einstalldocs
}
