# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

GIT_COMMIT="157594489153ba85bed77762cf05c0c1c40a82d9"

DESCRIPTION="Terminal user interface for Podman v4."
HOMEPAGE="https://github.com/containers/${PN}/"
SRC_URI="https://github.com/containers/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
DOCS=(CODE-OF-CONDUCT.md CONTRIBUTING.md LICENSE OWNERS README.md SECURITY.md)

src_install() {
    dobin bin/${PN}
    einstalldocs
}