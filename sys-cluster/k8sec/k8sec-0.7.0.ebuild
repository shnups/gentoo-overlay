# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="650f80b157abb97d9e2eaaee9f1a67a7eddd2455"
EGO_PN="github.com/dtan4/${PN}"
EGO_VENDOR=(
	"github.com/pkg/errors v0.9.1"
	"github.com/spf13/cobra v0.0.6"
	"k8s.io/api v0.17.3 github.com/kubernetes/api"
	"k8s.io/apimachinery v0.17.3 github.com/kubernetes/apimachinery"
	"k8s.io/client-go v0.17.3 github.com/kubernetes/client-go"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="CLI tool to manage Kubernetes Secrets easily"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=(CHANGELOG.md LICENSE README.md)

DEPEND=">=dev-lang/go-1.14"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"

	local DATE=`date "+%Y-%m-%dT%H:%M:%S%z"`
	local ldflags=(
		"-s -w"
		"-extldflags '-static'"
		-X "github.com/dtan4/k8sec/version.date=${DATE}"
		-X "github.com/dtan4/k8sec/version.version=${PV}"
		-X "github.com/dtan4/k8sec/version.commit=${GIT_COMMIT}"
	)
	local goargs=(
		-v -work -x -mod=readonly
		-asmflags "-trimpath=${S}"
		-gcflags "-trimpath=${S}"
		-ldflags "${ldflags[*]}"
		-o "${PN}"
	)

	go build "${goargs[@]}" "${S}" || die
}

src_install() {
	dobin ${PN}
	einstalldocs
}
