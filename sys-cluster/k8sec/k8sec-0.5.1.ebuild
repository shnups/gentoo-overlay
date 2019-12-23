# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/dtan4/${PN}"
EGO_VENDOR=(
	"cloud.google.com/go 3b1ae45394a234c385be014e9a488f2bb6eef821 github.com/googleapis/google-cloud-go"
	"github.com/blang/semver 31b736133b98f26d5e078ec9eb591666edfd091f"
	"github.com/coreos/go-oidc 5644a2f50e2d2d5ba0b474bc5bc55fea1925936d"
	"github.com/coreos/pkg fa29b1d70f0beaddd4c7021607cc3c3be8ce94b8"
	"github.com/davecgh/go-spew 5215b55f46b2b919f50a1df0eaa5886afe4e3b3d"
	"github.com/docker/distribution cd27f179f2c10c5d300e6d09025b538c475b0d51"
	"github.com/emicklei/go-restful 89ef8af493ab468a45a42bb0d89a06fccdd2fb22"
	"github.com/ghodss/yaml 73d445a93680fa1a78ae23a5839bad48f32ba1ee"
	"github.com/go-openapi/jsonpointer 46af16f9f7b149af66e5d1bd010e3574dc06de98"
	"github.com/go-openapi/jsonreference 13c6e3589ad90f49bd3e3bbe2c2cb3d7a4142272"
	"github.com/go-openapi/spec 6aced65f8501fe1217321abf0749d354824ba2ff"
	"github.com/go-openapi/swag 1d0bd113de87027671077d3c71eb3ac5d7dbba72"
	"github.com/gogo/protobuf e18d7aa8f8c624c915db340349aad4c49b10d173"
	"github.com/golang/glog 44145f04b68cf362d9c4df2182967c2275eaefed"
	"github.com/golang/protobuf 8616e8ee5e20a1704615e6c8d7afcdac06087a67"
	"github.com/google/gofuzz bbcb9da2d746f8bdbd6a936686a0a6067ada0ec5"
	"github.com/howeyc/gopass 3ca23474a7c7203e0a0a070fd33508f6efdb9b3d"
	"github.com/imdario/mergo 6633656539c1639d9d78127b7d47c622b5d7b6dc"
	"github.com/inconshreveable/mousetrap 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
	"github.com/jonboulle/clockwork 72f9bd7c4e0c2a40055ab3d0f09654f730cce982"
	"github.com/juju/ratelimit 77ed1c8a01217656d2080ad51981f6e99adaa177"
	"github.com/mailru/easyjson d5b7844b561a7bc640052f1b935f7b800330d7e0"
	"github.com/pborman/uuid ca53cad383cad2479bbba7f7a1a05797ec1386e4"
	"github.com/pkg/errors 645ef00459ed84a119197bfb8d8205042c6df63d"
	"github.com/PuerkitoBio/purell 8a290539e2e8629dbc4e6bad948158f790ec31f4"
	"github.com/PuerkitoBio/urlesc 5bd2802263f21d8788851d5305584c82a5c75d7e"
	"github.com/spf13/cobra de09d9ce07d0d8a74442cfeaa91628cf9492cc23"
	"github.com/spf13/pflag c7e63cf4530bcd3ba943729cee0efeff2ebea63f"
	"github.com/ugorji/go f1f1a805ed361a0e078bb537e4ea78cd37dcf065"
	"golang.org/x/crypto 1f22c0103821b9390939b6776727195525381532 github.com/golang/crypto"
	"golang.org/x/net e90d6d0afc4c315a0d87a568ae68577cc15149a0 github.com/golang/net"
	"golang.org/x/oauth2 3c3a985cb79f52a3190fbc056984415ca6763d01 github.com/golang/oauth2"
	"golang.org/x/sys 8f0908ab3b2457e2e15403d3697c9ef5cb4b57a9 github.com/golang/sys"
	"golang.org/x/text 2910a502d2bf9e43193af9d68ca516529614eed3 github.com/golang/text"
	"google.golang.org/appengine 4f7eeb5305a4ba1966344836ba4af9996b7b4e05 github.com/golang/appengine"
	"gopkg.in/inf.v0 3887ee99ecf07df5b447e9b00d9c0b2adaa9f3e4 github.com/go-inf/inf"
	"gopkg.in/yaml.v2 53feefa2559fb8dfa8d81baad31be332c97d6c77 github.com/go-yaml/yaml"
	"k8s.io/client-go e121606b0d09b2e1c467183ee46217fa85a6b672 github.com/kubernetes/client-go"
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

DEPEND=">=dev-lang/go-1.12"

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

