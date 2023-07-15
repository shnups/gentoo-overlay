# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="237c2bcb0a9b7d0b7c0f3227557b6eedd91db0b2"
EGO_PN="github.com/homeport/${PN}"
EGO_VENDOR=(
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/gonvenience/bunt v1.3.5"
	"github.com/gonvenience/neat v1.3.12"
	"github.com/gonvenience/term v1.0.2"
	"github.com/gonvenience/text v1.0.7"
	"github.com/gonvenience/wrap v1.1.2"
	"github.com/gonvenience/ytbx v1.4.4"
	"github.com/lucasb-eyer/go-colorful v1.2.0"
	"github.com/mitchellh/hashstructure v1.1.0"
	"github.com/onsi/ginkgo v2.11.0"
	"github.com/onsi/gomega v1.27.8"
	"github.com/sergi/go-diff v1.3.1"
	"github.com/spf13/cobra v1.7.0"
	"github.com/texttheater/golang-levenshtein v1.0.1"
	"gopkg.in/yaml.v3 v3.0.1 github.com/go-yaml/yaml"
	"github.com/BurntSushi/toml v1.3.2" # indirect
	"github.com/go-logr/logr v1.2.4" # indirect
	"github.com/go-task/slim-sprig 52ccab3ef572" # indirect
	"github.com/google/go-cmp v0.5.9" # indirect
	"github.com/google/pprof 91b7bce49751" # indirect
	"github.com/inconshreveable/mousetrap v1.1.0" # indirect
	"github.com/mattn/go-ciede2000 782e8c62fec3" # indirect
	"github.com/mattn/go-isatty v0.0.19" # indirect
	"github.com/mitchellh/go-ps v1.0.0" # indirect
	"github.com/spf13/pflag v1.0.5" # indirect
	"github.com/stretchr/testify v1.8.4" # indirect
	"github.com/virtuald/go-ordered-json b18e6e673d74" # indirect
	"golang.org/x/net v0.11.0 github.com/golang/net" # indirect
	"golang.org/x/sync v0.3.0 github.com/golang/sync" # indirect
	"golang.org/x/sys v0.9.0 github.com/golang/sys" # indirect
	"golang.org/x/term v0.9.0 github.com/golang/term" # indirect
	"golang.org/x/text v0.10.0 github.com/golang/text" # indirect
	"golang.org/x/tools v0.10.0 github.com/golang/tools" # indirect
	"gopkg.in/yaml.v2 v2.4.0 github.com/go-yaml/yaml" # indirect
)

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Diff tool for YAML files, and sometimes JSON"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.19"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	local ldflags=(
		-X "${EGO_PN}/internal/cmd.version=${PV}"
	)
	local goargs=(
		-ldflags "${ldflags[*]}"
		-mod=readonly
	)

	GOPATH="${G}" go build -v -work -x "${goargs[@]}" "${S}/cmd/${PN}/" || die
}

src_install() {
	dobin ${PN}
	einstalldocs
}
