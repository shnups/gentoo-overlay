# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="b9e5d6b144b111ade70e30b7f31e1c46f79a7ec9"
EGO_PN="github.com/charmbracelet/${PN}"
EGO_VENDOR=(
	"github.com/alecthomas/chroma v0.8.0" # indirect
	"github.com/charmbracelet/bubbles v0.6.1"
	"github.com/charmbracelet/bubbletea v0.11.1"
	"github.com/charmbracelet/charm v0.8.2"
	"github.com/charmbracelet/glamour 6c0e29c4dae5"
	"github.com/dustin/go-humanize afde56e7acac"
	"github.com/google/uuid v1.1.2" # indirect
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/meowgorithm/babyenv v1.3.0"
	"github.com/microcosm-cc/bluemonday v1.0.4" # indirect
	"github.com/muesli/gitcha 5aa4fdccf2f6"
	"github.com/muesli/reflow a312cb5b2d8d"
	"github.com/muesli/termenv v0.7.4"
	"github.com/spf13/cobra v1.0.0"
	"golang.org/x/crypto 84dcc777aaee github.com/golang/crypto"
	"golang.org/x/net 3edf25e44fcc github.com/golang/net" # indirect
	"golang.org/x/sys 2da7054afaeb github.com/golang/sys"
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Render markdown on the CLI, with pizzazz!"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
DOCS=(LICENSE README.md)

DEPEND=">=dev-lang/go-1.13"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	local DATE=`date +'%FT%TZ%z'`
	local ldflags=(
		-X "main.Version=${PV}"
		-X "main.CommitSHA=${GIT_COMMIT}"
	)
	local goargs=(
		-trimpath
		-ldflags "${ldflags[*]}"
		-o "${PN}"
		-v -work -x
	)

	GOPATH="${G}" go build "${goargs[@]}" "${S}" || die
}

src_install() {
	dobin ${PN}
	einstalldocs
}
