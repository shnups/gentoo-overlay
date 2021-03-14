# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="4f9ad6721c8294de75b80a86d7560786f66dc632"
EGO_PN="github.com/charmbracelet/${PN}"
EGO_VENDOR=(
	"github.com/charmbracelet/bubbles v0.7.6"
	"github.com/charmbracelet/bubbletea v0.13.1"
	"github.com/charmbracelet/charm v0.8.6"
	"github.com/charmbracelet/glamour 2b8307dcb400"
	"github.com/dustin/go-humanize afde56e7acac"
	"github.com/google/uuid v1.1.2" # indirect
	"github.com/kylelemons/godebug v1.1.0" # indirect
	"github.com/mattn/go-runewidth v0.0.10"
	"github.com/meowgorithm/babyenv v1.3.1"
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/muesli/gitcha v0.2.0"
	"github.com/muesli/go-app-paths v0.2.1"
	"github.com/muesli/reflow 9e1d0d53df68"
	"github.com/muesli/termenv v0.8.0"
	"github.com/sahilm/fuzzy v0.1.0"
	"github.com/segmentio/ksuid v1.0.3"
	"github.com/spf13/cobra v1.1.3"
	"github.com/spf13/viper v1.7.1"
	"golang.org/x/crypto eec23a3978ad github.com/golang/crypto"
	"golang.org/x/net 3edf25e44fcc github.com/golang/net" # indirect
	"golang.org/x/sys 4bcb84eeeb78 github.com/golang/sys"
	"golang.org/x/term 2321bbc49cbf github.com/golang/term" # indirect
	"golang.org/x/text v0.3.2 github.com/golang/text"
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
