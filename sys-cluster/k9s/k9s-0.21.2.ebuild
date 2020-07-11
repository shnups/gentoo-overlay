# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="977791627860a0febb3c217a5322702da109ecbb"
EGO_PN="github.com/derailed/${PN}"
EGO_VENDOR=(
	"9fans.net/go v0.0.2 github.com/9fans/go"
	"github.com/atotto/clipboard v0.1.2"
	"github.com/coreos/etcd v3.3.10"
	"github.com/derailed/popeye v0.8.6"
	"github.com/derailed/tview v0.3.10"
	"github.com/drone/envsubst v1.0.2" # indirect
	"github.com/fatih/color v1.9.0"
	"github.com/fsnotify/fsnotify v1.4.7"
	"github.com/gdamore/tcell v1.3.0"
	"github.com/ghodss/yaml v1.0.0"
	"github.com/golang/protobuf v1.4.2" # indirect
	"github.com/kylelemons/godebug v1.1.0"
	"github.com/logrusorgru/aurora e9ef32dff381"
	"github.com/mattn/go-isatty v0.0.11"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/openfaas/faas 6afae214e3ec"
	"github.com/openfaas/faas-cli 30b7cec9634c"
	"github.com/openfaas/faas-provider v0.15.0"
	"github.com/petergtz/pegomock v2.7.0"
	"github.com/rakyll/hey v0.1.3"
	"github.com/rs/zerolog v1.18.0"
	"github.com/ryanuber/go-glob v1.0.0" # indirect
	"github.com/sahilm/fuzzy v0.1.0"
	"github.com/spf13/cobra v1.0.0"
	"github.com/stretchr/testify v1.5.1"
	"golang.org/x/net d87ec0cfa476 github.com/golang/net" # indirect
	"golang.org/x/sys fe76b779f299 github.com/golang/sys" # indirect
	"golang.org/x/text v0.3.2 github.com/golang/text"
	"google.golang.org/genproto fc4c6c6a6587 github.com/googleapis/go-genproto" # indirect
	"google.golang.org/grpc v1.29.1 github.com/grpc/grpc-go" # indirect
	"gopkg.in/fsnotify.v1 v1.4.7 github.com/fsnotify/fsnotify"
	"gopkg.in/yaml.v2 v2.2.8 github.com/go-yaml/yaml"
	"helm.sh/helm/v3 v3.2.0 github.com/helm/helm"
	"k8s.io/api v0.18.2 github.com/kubernetes/api"
	"k8s.io/apimachinery v0.18.2 github.com/kubernetes/apimachinery"
	"k8s.io/cli-runtime v0.18.2 github.com/kubernetes/cli-runtime"
	"k8s.io/client-go v0.18.2 github.com/kubernetes/client-go"
	"k8s.io/klog v1.0.0 github.com/kubernetes/klog"
	"k8s.io/kubectl v0.18.2 github.com/kubernetes/kubectl"
	"k8s.io/metrics v0.18.2 github.com/kubernetes/metrics"
	"sigs.k8s.io/yaml v1.2.0 github.com/kubernetes-sigs/yaml"
	"vbom.ml/util efcd4e0f9787 github.com/fvbommel/util"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Kubernetes CLI To Manage Your Clusters In Style!"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=(COPYING LICENSE README.md)

BDEPEND=">=dev-lang/go-1.14"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	# Fix "go: inconsistent vendoring"
	go mod vendor
    emake build -e GIT="${GIT_COMMIT}" -e VERSION="${PV}"|| die
}

src_install() {
	dobin "${S}/execs/${PN}"
	einstalldocs
}
