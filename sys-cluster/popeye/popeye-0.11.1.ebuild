# Copyright 1999-2032 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT="22d0830c2c2000f46137b703276786c66ac90908"
EGO_PN="github.com/derailed/${PN}"
EGO_VENDOR=(
	"github.com/aws/aws-sdk-go v1.35.21"
	"github.com/fvbommel/sortorder v1.0.1"
	"github.com/magiconair/properties v1.8.5"
	"github.com/prometheus/client_golang v1.12.1"
	"github.com/prometheus/common v0.34.0"
	"github.com/rs/zerolog v1.18.0"
	"github.com/spf13/cobra v1.6.0"
	"github.com/stretchr/testify v1.8.0"
	"golang.org/x/net 1e63c2f08a10 github.com/golang/net"
	"gopkg.in/yaml.v2 v2.4.0 github.com/go-yaml/yaml"
	"k8s.io/api v0.26.1 github.com/kubernetes/api"
	"k8s.io/apimachinery v0.26.1 github.com/kubernetes/apimachinery"
	"k8s.io/cli-runtime v0.26.1 github.com/kubernetes/cli-runtime"
	"k8s.io/client-go v0.26.1 github.com/kubernetes/client-go"
	"k8s.io/metrics v0.26.1 github.com/kubernetes/metrics"
)
inherit golang-build golang-vcs-snapshot

DESCRIPTION="Popeye is a utility that scans live Kubernetes cluster and reports potential issues with deployed resources and configurations"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.20"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"
	local DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
	local ldflags=(
		-X "${EGO_PN}/cmd.version=${PV}"
		-X "${EGO_PN}/cmd.commit=${EGIT_COMMIT}"
		-X "${EGO_PN}/cmd.date=${DATE}"
	)
	go build -trimpath -mod=readonly -ldflags "${ldflags[*]}" -o "${PN}" || die
}

src_install() {
	dobin ${S}/${PN}
	einstalldocs
}
