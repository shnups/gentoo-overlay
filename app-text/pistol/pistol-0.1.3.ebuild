# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module
GIT_COMMIT="d4d8654"

DESCRIPTION="General purpose file previewer designed for Ranger/Lf to make scope.sh redundant"
HOMEPAGE="https://github.com/doronbehar/pistol"

EGO_SUM=(
	"github.com/adrg/xdg v0.2.1"
	"github.com/adrg/xdg v0.2.1/go.mod"
	"github.com/alecthomas/assert v0.0.0-20170929043011-405dbfeb8e38"
	"github.com/alecthomas/assert v0.0.0-20170929043011-405dbfeb8e38/go.mod"
	"github.com/alecthomas/chroma v0.7.3"
	"github.com/alecthomas/chroma v0.7.3/go.mod"
	"github.com/alecthomas/colour v0.0.0-20160524082231-60882d9e2721"
	"github.com/alecthomas/colour v0.0.0-20160524082231-60882d9e2721/go.mod"
	"github.com/alecthomas/kong v0.2.4/go.mod"
	"github.com/alecthomas/repr v0.0.0-20180818092828-117648cd9897/go.mod"
	"github.com/alecthomas/repr v0.0.0-20181024024818-d37bc2a10ba1"
	"github.com/alecthomas/repr v0.0.0-20181024024818-d37bc2a10ba1/go.mod"
	"github.com/alessio/shellescape v1.2.2"
	"github.com/alessio/shellescape v1.2.2/go.mod"
	"github.com/andybalholm/brotli v0.0.0-20190621154722-5f990b63d2d6"
	"github.com/andybalholm/brotli v0.0.0-20190621154722-5f990b63d2d6/go.mod"
	"github.com/andybalholm/brotli v1.0.0"
	"github.com/andybalholm/brotli v1.0.0/go.mod"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dlclark/regexp2 v1.2.0"
	"github.com/dlclark/regexp2 v1.2.0/go.mod"
	"github.com/dsnet/compress v0.0.1"
	"github.com/dsnet/compress v0.0.1/go.mod"
	"github.com/dsnet/golib v0.0.0-20171103203638-1ea166775780/go.mod"
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/dustin/go-humanize v1.0.0/go.mod"
	"github.com/frankban/quicktest v1.9.0"
	"github.com/frankban/quicktest v1.9.0/go.mod"
	"github.com/galdor/go-cmdline v1.1.1"
	"github.com/galdor/go-cmdline v1.1.1/go.mod"
	"github.com/golang/gddo v0.0.0-20190419222130-af0f2af80721"
	"github.com/golang/gddo v0.0.0-20190419222130-af0f2af80721/go.mod"
	"github.com/golang/snappy v0.0.1"
	"github.com/golang/snappy v0.0.1/go.mod"
	"github.com/google/go-cmp v0.3.0"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.4.0"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/klauspost/compress v1.4.1/go.mod"
	"github.com/klauspost/compress v1.9.2/go.mod"
	"github.com/klauspost/compress v1.10.10"
	"github.com/klauspost/compress v1.10.10/go.mod"
	"github.com/klauspost/cpuid v1.2.0"
	"github.com/klauspost/cpuid v1.2.0/go.mod"
	"github.com/klauspost/pgzip v1.2.1"
	"github.com/klauspost/pgzip v1.2.1/go.mod"
	"github.com/klauspost/pgzip v1.2.4"
	"github.com/klauspost/pgzip v1.2.4/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.3"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.3/go.mod"
	"github.com/kr/pretty v0.2.0"
	"github.com/kr/pretty v0.2.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/mattn/go-colorable v0.1.6/go.mod"
	"github.com/mattn/go-isatty v0.0.12"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mholt/archiver/v3 v3.3.0"
	"github.com/mholt/archiver/v3 v3.3.0/go.mod"
	"github.com/nwaples/rardecode v1.0.0"
	"github.com/nwaples/rardecode v1.0.0/go.mod"
	"github.com/nwaples/rardecode v1.1.0"
	"github.com/nwaples/rardecode v1.1.0/go.mod"
	"github.com/pierrec/lz4 v2.0.5+incompatible"
	"github.com/pierrec/lz4 v2.0.5+incompatible/go.mod"
	"github.com/pierrec/lz4 v2.5.2+incompatible"
	"github.com/pierrec/lz4 v2.5.2+incompatible/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rakyll/magicmime v0.1.0"
	"github.com/rakyll/magicmime v0.1.0/go.mod"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/sirupsen/logrus v1.6.0"
	"github.com/sirupsen/logrus v1.6.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/ulikunitz/xz v0.5.6"
	"github.com/ulikunitz/xz v0.5.6/go.mod"
	"github.com/ulikunitz/xz v0.5.7"
	"github.com/ulikunitz/xz v0.5.7/go.mod"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8/go.mod"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20200413165638-669c56c373c4/go.mod"
	"golang.org/x/sys v0.0.0-20200625212154-ddb9806d33ae"
	"golang.org/x/sys v0.0.0-20200625212154-ddb9806d33ae/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/yaml.v2 v2.2.2"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/doronbehar/pistol/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
DOCS=(LICENSE NEWS.adoc README.adoc)

S="${WORKDIR}/${P}"

src_install() {
	dobin ${PN}
	einstalldocs
}
