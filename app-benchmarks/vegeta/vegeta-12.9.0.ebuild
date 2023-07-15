# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="96e735dba533487fa389a85a3fceb76bd2081717"
EGO_PN="github.com/tsenart/${PN}"
EGO_VENDOR=(
	"github.com/alecthomas/jsonschema 9eeeec9d044b"
	"github.com/bmizerany/perks d9a9656a3a4b"
	"github.com/c2h5oh/datasize 859f65c6625b"
	"github.com/dgryski/go-gk 201884a44051"
	"github.com/dgryski/go-lttb 318fcdf10a77"
	"github.com/google/go-cmp v0.5.9"
	"github.com/influxdata/tdigest v0.0.1"
	"github.com/mailru/easyjson v0.7.7"
	"github.com/miekg/dns v1.1.25"
	"github.com/streadway/quantile 4246515d968d"
	"github.com/tsenart/go-tsz 0bd30b3df1c3"
	"golang.org/x/net v0.12.0 github.com/golang/net"
	"pgregory.net/rapid v0.3.3 github.com/flyingmutant/rapid"
	"github.com/iancoleman/orderedmap v0.3.0" # indirect
	"github.com/josharian/intern v1.0.0" # indirect
	"golang.org/x/crypto v0.11.0 github.com/golang/crypto" # indirect
	"golang.org/x/sys v0.10.0 github.com/golang/sys" # indirect
	"golang.org/x/text v0.11.0 github.com/golang/text" # indirect
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
