# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="19732a63035e316e3079d15030a573e89d7115cf"
EGO_PN="github.com/charmbracelet/${PN}"
EGO_VENDOR=(
	"github.com/atotto/clipboard v0.1.4"
	"github.com/charmbracelet/bubbles v0.15.0"
	"github.com/charmbracelet/bubbletea v0.23.1"
	"github.com/charmbracelet/charm v0.8.6"
	"github.com/charmbracelet/glamour v0.6.0"
	"github.com/charmbracelet/lipgloss v0.6.0"
	"github.com/dustin/go-humanize afde56e7acac"
	"github.com/mattn/go-runewidth v0.0.14"
	"github.com/meowgorithm/babyenv v1.3.1"
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/muesli/gitcha v0.2.0"
	"github.com/muesli/go-app-paths v0.2.2"
	"github.com/muesli/reflow v0.3.0"
	"github.com/muesli/termenv v0.13.0"
	"github.com/sahilm/fuzzy v0.1.0"
	"github.com/segmentio/ksuid v1.0.4"
	"github.com/spf13/cobra v1.6.1"
	"github.com/spf13/viper v1.14.0"
	"golang.org/x/sys 27713097b956 github.com/golang/sys" # indirect
	"golang.org/x/term 03fcf44c2211 github.com/golang/term"
	"golang.org/x/text v0.6.0 github.com/golang/text" # indirect
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
