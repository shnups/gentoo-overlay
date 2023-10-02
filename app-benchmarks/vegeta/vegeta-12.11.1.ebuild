# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="6fbe391628eeeae1adf39522a55078797e6e7f2e"
EGO_PN="github.com/tsenart/${PN}"
EGO_VENDOR=(
	"github.com/alecthomas/jsonschema 9eeeec9d044b"
	"github.com/bmizerany/perks 03f9df79da1e"
	"github.com/c2h5oh/datasize 859f65c6625b"
	"github.com/dgryski/go-gk a69029f61654"
	"github.com/dgryski/go-lttb f8fc36cdbff1"
	"github.com/google/go-cmp v0.5.9"
	"github.com/influxdata/tdigest v0.0.1"
	"github.com/mailru/easyjson v0.7.7"
	"github.com/miekg/dns v1.1.56"
	"github.com/prometheus/client_golang v1.16.0"
	"github.com/prometheus/prometheus v0.47.0"
	"github.com/rs/dnscache e0241e321417"
	"github.com/streadway/quantile 4246515d968d"
	"github.com/tsenart/go-tsz 0bd30b3df1c3"
	"golang.org/x/net v0.15.0 github.com/golang/net"
	"pgregory.net/rapid v1.1.0 github.com/flyingmutant/rapid"
	"github.com/beorn7/perks v1.0.1" # indirect
	"github.com/cespare/xxhash v2.2.0" # indirect
	"github.com/gogo/protobuf v1.3.2" # indirect
	"github.com/golang/protobuf v1.5.3" # indirect
	"github.com/grafana/regexp 6b5c0a4cb7fd" # indirect
	"github.com/iancoleman/orderedmap v0.3.0" # indirect
	"github.com/josharian/intern v1.0.0" # indirect
	"github.com/matttproud/golang_protobuf_extensions v1.0.4" # indirect
	"github.com/pkg/errors v0.9.1" # indirect
	"github.com/prometheus/client_model v0.4.0" # indirect
	"github.com/prometheus/common v0.44.0" # indirect
	"github.com/prometheus/procfs v0.11.0" # indirect
	"golang.org/x/exp 613f0c0eb8a1 github.com/golang/exp" # indirect
	"golang.org/x/mod v0.12.0 github.com/golang/mod" # indirect
	"golang.org/x/sync v0.3.0 github.com/golang/sync" # indirect
	"golang.org/x/sys v0.12.0 github.com/golang/sys" # indirect
	"golang.org/x/text v0.13.0 github.com/golang/text" # indirect
	"golang.org/x/tools v0.13.0 github.com/golang/tools" # indirect
	"google.golang.org/protobuf v1.31.0 github.com/protocolbuffers/protobuf-go" # indirect
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

DEPEND=">=dev-lang/go-1.20"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	local DATE=`date +'%FT%TZ%z'`
	local ldflags=(
		-X "main.Version=${PV}"
		-X "main.Commit=${GIT_COMMIT}"
		-X "main.Date=${DATE}"
	)
	local goargs=(
		-trimpath
		-ldflags "${ldflags[*]}"
		-o "${bin}"
		-v -work -x
	)

	GOPATH="${G}" go build -mod=readonly "${goargs[@]}" "${S}" || die
}

src_install() {
	dobin ${PN}
	einstalldocs
}
