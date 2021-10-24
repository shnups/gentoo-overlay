# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module
GIT_COMMIT="1c7dc7a5f0fa3674b88c14d8613ee9a56abec8ba"

DESCRIPTION="General purpose file previewer designed for Ranger/Lf to make scope.sh redundant"
HOMEPAGE="https://github.com/doronbehar/pistol"

EGO_SUM=(
	"github.com/adrg/xdg v0.3.3"
	"github.com/adrg/xdg v0.3.3/go.mod"
	"github.com/akamensky/argparse v1.3.1"
	"github.com/akamensky/argparse v1.3.1/go.mod"
	"github.com/alecthomas/chroma v0.9.4"
	"github.com/alecthomas/chroma v0.9.4/go.mod"
	"github.com/alessio/shellescape v1.4.1"
	"github.com/alessio/shellescape v1.4.1/go.mod"
	"github.com/alexflint/go-arg v1.4.2"
	"github.com/alexflint/go-arg v1.4.2/go.mod"
	"github.com/alexflint/go-scalar v1.0.0/go.mod"
	"github.com/alexflint/go-scalar v1.1.0"
	"github.com/alexflint/go-scalar v1.1.0/go.mod"
	"github.com/andybalholm/brotli v1.0.0/go.mod"
	"github.com/andybalholm/brotli v1.0.3"
	"github.com/andybalholm/brotli v1.0.3/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dlclark/regexp2 v1.4.0"
	"github.com/dlclark/regexp2 v1.4.0/go.mod"
	"github.com/dsnet/compress v0.0.1"
	"github.com/dsnet/compress v0.0.1/go.mod"
	"github.com/dsnet/golib v0.0.0-20171103203638-1ea166775780/go.mod"
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/dustin/go-humanize v1.0.0/go.mod"
	"github.com/galdor/go-cmdline v1.1.1"
	"github.com/galdor/go-cmdline v1.1.1/go.mod"
	"github.com/golang/snappy v0.0.1/go.mod"
	"github.com/golang/snappy v0.0.4"
	"github.com/golang/snappy v0.0.4/go.mod"
	"github.com/klauspost/compress v1.4.1/go.mod"
	"github.com/klauspost/compress v1.10.10/go.mod"
	"github.com/klauspost/compress v1.13.6"
	"github.com/klauspost/compress v1.13.6/go.mod"
	"github.com/klauspost/cpuid v1.2.0/go.mod"
	"github.com/klauspost/pgzip v1.2.4/go.mod"
	"github.com/klauspost/pgzip v1.2.5"
	"github.com/klauspost/pgzip v1.2.5/go.mod"
	"github.com/mholt/archiver/v3 v3.5.0"
	"github.com/mholt/archiver/v3 v3.5.0/go.mod"
	"github.com/nwaples/rardecode v1.1.0/go.mod"
	"github.com/nwaples/rardecode v1.1.2"
	"github.com/nwaples/rardecode v1.1.2/go.mod"
	"github.com/pierrec/lz4/v4 v4.0.3/go.mod"
	"github.com/pierrec/lz4/v4 v4.1.8"
	"github.com/pierrec/lz4/v4 v4.1.8/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rakyll/magicmime v0.1.0"
	"github.com/rakyll/magicmime v0.1.0/go.mod"
	"github.com/sirupsen/logrus v1.8.1"
	"github.com/sirupsen/logrus v1.8.1/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/ulikunitz/xz v0.5.6/go.mod"
	"github.com/ulikunitz/xz v0.5.7/go.mod"
	"github.com/ulikunitz/xz v0.5.10"
	"github.com/ulikunitz/xz v0.5.10/go.mod"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20211015200801-69063c4bb744"
	"golang.org/x/sys v0.0.0-20211015200801-69063c4bb744/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/doronbehar/pistol/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(LICENSE README.adoc)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-ruby/asciidoctor"

S="${WORKDIR}/${P}"

src_compile() {
	EGO_BUILD_FLAGS="-ldflags \"-X main.Version ${PV}\"" default
}

src_install() {
	dobin ${PN}
	einstalldocs

	asciidoctor -b manpage -d manpage README.adoc
	newman "${S}/${PN}.1" "${PN}.1"
}
