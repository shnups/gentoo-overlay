# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/${PN}/${PN}"
EGO_VENDOR=(
	"github.com/klauspost/pgzip v1.2.1"
	"github.com/google/shlex v0.0.0-20181106134648-c34317bd91bf"
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/dsnet/compress v0.0.1"
	"github.com/urfave/cli v1.22.1"
	"github.com/docker-slim/go-update v0.0.0-20190422071557-ed40247aff59"
	"github.com/c4milo/unpackit v0.0.0-20170704181138-4ed373e9ef1c"
	"github.com/docker/go-connections v0.4.0"
	"github.com/docker-slim/uiprogress v0.0.0-20190505193231-9d4396e6d40b"
	"github.com/docker-slim/uilive v0.0.2"
	"github.com/fsouza/go-dockerclient v1.5.0"
	"github.com/sirupsen/logrus v1.4.2"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d"
	"github.com/BurntSushi/toml v0.3.1"
	"gopkg.in/yaml.v2 v2.2.2"
	"github.com/ulikunitz/xz v0.5.6"
	"github.com/dsnet/golib v0.0.0-20171103203638-1ea166775780"
	"github.com/klauspost/cpuid v1.2.0"
	"github.com/klauspost/compress v1.4.1"
	"gotest.tools v2.2.0+incompatible"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/opencontainers/runc v0.1.1"
	"github.com/opencontainers/go-digest v1.0.0-rc1"
	"github.com/google/go-cmp v0.3.1"
	"github.com/docker/distribution v2.7.1+incompatible"
	"github.com/gorilla/mux v1.7.3"
	"github.com/golang/protobuf v1.3.0"
	"github.com/containerd/containerd v1.3.0"
	"github.com/Azure/go-ansiterm v0.0.0-20170929234023-d6e3b3328b78"
	"github.com/Microsoft/go-winio v0.4.14"
	"github.com/Microsoft/hcsshim v0.8.6"
	"google.golang.org/grpc v1.22.0"
	"github.com/containerd/continuity v0.0.0-20181203112020-004b46473808"
	"github.com/docker/go-units v0.4.0"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0"
	"github.com/gogo/protobuf v1.2.1"
	"github.com/opencontainers/image-spec v1.0.1"
	"golang.org/x/sys v0.0.0-20190507160741-ecd444e8653b"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd"
	"github.com/pkg/errors v0.8.1"
	"golang.org/x/crypto v0.0.0-20190927123631-a832865fa7ad"
	"github.com/russross/blackfriday/v2 v2.0.1"
	"google.golang.org/genproto v0.0.0-20180831171423-11092d34479b"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a"
	"github.com/stretchr/testify v1.2.2"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894"
	"github.com/client9/misspell v0.3.4"
	"golang.org/x/tools v0.0.0-20190524140312-2c0ae7006135"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/docker/docker v1.4.2-0.20190927142053-ada3c14"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2"
	"github.com/golang/mock v1.1.1"
	"golang.org/x/text v0.3.0"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be"
	"google.golang.org/appengine v1.1.0"
	"github.com/kisielk/errcheck v1.1.0"
	"github.com/stretchr/objx v0.1.1"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"github.com/sirupsen/logrus v1.4.1"
	"github.com/google/go-cmp v0.2.0"
	"golang.org/x/tools v0.0.0-20180221164845-07fd8470d635"
	"github.com/kisielk/gotool v1.0.0"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd"
	"cloud.google.com/go v0.26.0"
	"honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a"
	"github.com/morikuni/aec v0.0.0-20170113033406-39771216ff"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58"
	"github.com/golang/protobuf v1.2.0"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Minify and Secure Docker containers"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=(CHANGELOG.md CONTRIBUTING.md LICENSE README.md WHISHLIST.md)

DEPEND=">=dev-lang/go-1.12"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

#src_compile() {
#	export GOPATH="${G}"
#	local mygoargs=(
#		-v -work -x
#		-asmflags "-trimpath=${S}"
#		-gcflags "-trimpath=${S}"
#		-ldflags "$(usex !debug '-s -w' '')"
#		-o ./vc
#	)
#	go build "${mygoargs[@]}" "${S}" || die
#}

# src_install() {
# 	newbin vc ${PN}
# 	einstalldocs
# }
