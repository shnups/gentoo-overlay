# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg-utils

ELECTRON_SLOT="2.0"
ELECTRON_V="2.0.14"

DESCRIPTION="Native desktop application for Mattermost"
HOMEPAGE="https://mattermost.com/"
SRC_URI="https://github.com/${PN/-//}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-util/electron-bin-${ELECTRON_V}:${ELECTRON_SLOT}"
DEPEND="net-libs/nodejs[npm]"

PATCHES=( "${FILESDIR}/${P}-package-json.patch" )

S="${WORKDIR}/desktop-${PV}"

pkg_pretend() {
	# shellcheck disable=SC2086
	if has network-sandbox ${FEATURES} && [[ "${MERGE_TYPE}" != binary ]]; then
		ewarn
		ewarn "${CATEGORY}/${PN} requires 'network-sandbox' to be disabled in FEATURES"
		ewarn
		die "[network-sandbox] is enabled in FEATURES"
	fi
}

src_prepare() {
	default

	# Depending on the architecture, in order to accelerate the build process,
	# removes the compilation of ia32 or x64 build.
	if [[ "${ARCH}" == amd64 ]]; then
		sed -i 's| --ia32||g' package.json || die
	elif [[ "${ARCH}" == x86 ]]; then
		sed -i 's| --x64||g' package.json || die
	else
		die "This ebuild doesn't support ${ARCH}"
	fi

	# Reduce build time by removing the creation of a .deb and AppImage
	sed -i '/"deb",/d' electron-builder.json || die
	sed -i '/"appimage"/d' electron-builder.json || die

	# No need to compress the package. Pay attention at the trailing comma:
	# We are removing it from the JSON to make it valid again.
	sed -i 's|"tar.gz",|"dir"|' electron-builder.json || die
}

src_compile() {
	npm install || die
	npm run build || die
	npm run package:linux || die
}

src_install() {
	newbin "${FILESDIR}/${PN}-launcher.sh" "${PN}"
	sed -i \
		-e "s:@@ELECTRON@@:electron-${ELECTRON_SLOT}:" \
		-e "s:@@EPREFIX@@:${EPREFIX}:" \
		"${ED}/usr/bin/${PN}" || die

	insinto /usr/libexec/mattermost-desktop
	doins -r release/linux*unpacked/resources/*

	# Install icons and desktop entry
	newicon -s scalable resources/linux/icon.svg mattermost.svg
	make_desktop_entry "${PN}" Mattermost mattermost \
		"GTK;Network;Chat;InstantMessaging;" \
		"StartupNotify=true\\nStartupWMClass=mattermost-desktop"
}

update_caches() {
	if type gtk-update-icon-cache &>/dev/null; then
		ebegin "Updating GTK icon cache"
		gtk-update-icon-cache "${EROOT}/usr/share/icons/hicolor"
		eend $? || die
	fi
	xdg_desktop_database_update
}

pkg_postinst() {
	update_caches
}

pkg_postrm() {
	update_caches
}
