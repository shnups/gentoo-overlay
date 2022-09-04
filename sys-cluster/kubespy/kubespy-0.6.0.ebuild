# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="b05ac83b152f1ff0595f7e7056aa0b70b18594e3"
EGO_PN="github.com/pulumi/${PN}"
EGO_VENDOR=(
	"github.com/fatih/color v1.9.0"
	"github.com/gosuri/uilive ac356e6e42cd" # indirect
	"github.com/k0kubun/colorstring 9440f1994b88" # indirect
	"github.com/mbrlabs/uilive e481c8e66f15"
	"github.com/pulumi/pulumi-kubernetes 2c206f417da4"
	"github.com/spf13/cobra v1.0.0"
	"github.com/yudai/gojsondiff 7b1b7adf999d"
	"github.com/yudai/golcs ecda9a501e82" # indirect
	"github.com/yudai/pp v2.0.1" # indirect
	"k8s.io/apimachinery v0.18.8 github.com/kubernetes/apimachinery"
	"k8s.io/client-go v0.18.8 github.com/kubernetes/client-go"
	"github.com/Azure/go-autorest v13.3.1"
	"github.com/evanphx/json-patch 162e5629780b"
)
inherit golang-build golang-vcs-snapshot

DESCRIPTION="Tools for observing Kubernetes resources in real time, powered by Pulumi"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md ROADMAP.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.15"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"
	go build -trimpath -mod=readonly -ldflags "-X 'github.com/pulumi/kubespy/version.Version=${PV}'" -o "${PN}" || die
}

src_install() {
	dobin ${S}/${PN}
	einstalldocs
}
