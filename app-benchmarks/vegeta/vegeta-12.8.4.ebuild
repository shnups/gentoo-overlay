# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="e04d9c0df8177e8633bff4afe7b39c2f3a9e7dea"
EGO_PN="github.com/tsenart/${PN}"
EGO_VENDOR=(
	"github.com/alecthomas/jsonschema f2c93856175a"
	"github.com/bmizerany/perks d9a9656a3a4b"
	"github.com/c2h5oh/datasize 4eba002a5eae"
	"github.com/dgryski/go-gk 201884a44051"
	"github.com/dgryski/go-lttb 318fcdf10a77"
	"github.com/gonum/blas f22b278b28ac" # indirect
	"github.com/gonum/diff 500114f11e71" # indirect
	"github.com/gonum/floats c233463c7e82" # indirect
	"github.com/gonum/integrate a422b5c0fdf2" # indirect
	"github.com/gonum/internal f884aa714029" # indirect
	"github.com/gonum/lapack e4cdc5a0bff9" # indirect
	"github.com/gonum/mathext 8a4bf007ea55" # indirect
	"github.com/gonum/matrix c518dec07be9" # indirect
	"github.com/gonum/stat 41a0da705a5b" # indirect
	"github.com/google/go-cmp v0.2.0"
	"github.com/influxdata/tdigest a7d76c6f093a"
	"github.com/mailru/easyjson v0.7.0"
	"github.com/miekg/dns v1.1.17"
	"github.com/streadway/quantile b0c588724d25"
	"github.com/tsenart/go-tsz cdeb9e1e981e"
	"golang.org/x/net ba9fcec4b297 github.com/golang/net"
	"pgregory.net/rapid v0.3.3 github.com/flyingmutant/rapid"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="HTTP load testing tool and library. It's over 9000!"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(CHANGELOG LICENSE README.md)

DEPEND=">=dev-lang/go-1.13"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"

	local DATE=`date +'%FT%TZ%z'`
	local ldflags=(
		"-s -w"
		"-extldflags '-static'"
		-X "main.Version=${PV}"
		-X "main.Commit=${GIT_COMMIT}"
		-X "main.Date=${DATE}"
	)
	local goargs=(
		-v -work -x
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
