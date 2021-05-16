# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs
inherit desktop

SLOT="0"
IUSE=""

EGIT_REPO_URI="https://github.com/davidbrazdil/volnoti.git"
inherit git-r3

DESCRIPTION="Lightweight volume notification"
HOMEPAGE="https://github.com/davidbrazdil/volnoti"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	sys-apps/dbus
	dev-libs/dbus-glib
	x11-libs/gtk+
	x11-libs/gdk-pixbuf
"
DEPEND="virtual/pkgconfig"

DOCS=(AUTHORS COPYING README.md)

src_prepare() {
	./prepare.sh
	default
}

src_compile() {
	tc-export CC

	cd src/
	rm value-client-stub.h && make value-client-stub.h
	rm value-daemon-stub.h && make value-daemon-stub.h
	cd -

	emake
}

src_install() {
	dobin src/${PN}
	dobin src/${PN}-show

	dodir /usr/share/pixmaps/${PN}
	insinto /usr/share/pixmaps/${PN}
	shopt -s nullglob
	doins "res"/*.{png,svg}
	shopt -u nullglob

	einstalldocs
}
