# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="6e831099a39cee8bb24f38a824732abecc9fb325"
EGO_PN="github.com/charmbracelet/${PN}"
EGO_VENDOR=(
	"github.com/charmbracelet/glamour v0.1.0"
	"github.com/dlclark/regexp2 v1.2.0" # indirect
	"github.com/mattn/go-isatty v0.0.4"
	"github.com/spf13/cobra v0.0.5"
	"golang.org/x/net c0dbc17a3553 github.com/golang/net" # indirect
	"golang.org/x/sys d0b11bdaac8a github.com/golang/sys"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Render markdown on the CLI, with pizzazz!"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=(LICENSE README.md)

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
		-X "main.CommitSHA=${GIT_COMMIT}"
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
