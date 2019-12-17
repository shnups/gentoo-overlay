# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/dtan4/${PN}"
EGO_VENDOR=(
	"github.com/pkg/errors v0.8.1"
	"github.com/spf13/cobra v0.0.5"
	"github.com/spf13/pflag v1.0.5"
	"k8s.io/client-go v0.17.0 github.com/kubernetes/client-go"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/golang/protobuf v1.3.2"
	"github.com/googleapis/gnostic v0.3.1"
	"github.com/imdario/mergo v0.3.8"
	"golang.org/x/crypto 81e90905daefcd6fd217b62423c0908922eadb30 github.com/golang/crypto"
	"golang.org/x/net 1c05540f6879653db88113bc4a2b70aec4bd491f github.com/golang/net"
	"golang.org/x/oauth2 a6bd8cefa1811bd24b86f8902872e4e8225f74c4 github.com/golang/oauth2"
	"golang.org/x/sys 43eea11bc92608addb41b8a406b0407495c106f6 github.com/golang/sys"
	"golang.org/x/text b19bf474d317b857955b12035d2c5acb57ce8b01 github.com/golang/text"
	"golang.org/x/time f51c12702a4d776e4c1fa9b0fabab841babae631 github.com/golang/time"
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

DEPEND="
 >=dev-lang/go-1.12"

#src_unpack() {
#	unpack ${A}
#	mv "${WORKDIR}/${P}/src/${EGO_PN}/" "${S}" || die "Couldn't move sources directory"
#}

#src_compile() {
#	export GOPATH="${G}"
#	local myldflags=(
#		"$(usex !debug '-s -w' '')"
#  -X "main.Version=${PV}"
#  -X "main.Commit=${GIT_COMMIT}"
#  -X "'main.Date=$(date -u '+%Y-%m-%dT%TZ')'"
# )
# local mygoargs=(
#  -v -work -x
#  -buildmode "$(usex pie pie exe)"
#  -asmflags "all=-trimpath=${S}"
#  -gcflags "all=-trimpath=${S}"
#  -ldflags "${myldflags[*]}"
# )
	#go build "${mygoargs[@]}" || die
#	go build || die "go build is dying"
#}

