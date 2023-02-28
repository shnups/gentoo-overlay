# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module systemd
GIT_COMMIT="89641421bc8ae4f3fb519f505bb434dd27533ee2"

DESCRIPTION="A tool to detect when your YubiKey is waiting for a touch"
HOMEPAGE="https://github.com/maximbaz/${PN}"

EGO_SUM=(
	"github.com/coreos/go-systemd/v22 v22.3.2"
	"github.com/coreos/go-systemd/v22 v22.3.2/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/esiqveland/notify v0.11.0"
	"github.com/esiqveland/notify v0.11.0/go.mod"
	"github.com/fatih/set v0.2.1"
	"github.com/fatih/set v0.2.1/go.mod"
	"github.com/godbus/dbus/v5 v5.0.3/go.mod"
	"github.com/godbus/dbus/v5 v5.0.4/go.mod"
	"github.com/godbus/dbus/v5 v5.1.0"
	"github.com/godbus/dbus/v5 v5.1.0/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rjeczalik/notify v0.9.2"
	"github.com/rjeczalik/notify v0.9.2/go.mod"
	"github.com/scylladb/go-set v1.0.2"
	"github.com/scylladb/go-set v1.0.2/go.mod"
	"github.com/sirupsen/logrus v1.8.1"
	"github.com/sirupsen/logrus v1.8.1/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/vtolstov/go-ioctl v0.0.0-20151206205506-6be9cced4810"
	"github.com/vtolstov/go-ioctl v0.0.0-20151206205506-6be9cced4810/go.mod"
	"golang.org/x/sys v0.0.0-20180926160741-c2ed4eda69e7/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/maximbaz/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz ${EGO_SUM_SRC_URI}"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.16"

S="${WORKDIR}/${P}"

src_compile() {
	go build -v -work -o "${PN}" || die
}

# Make sure portage handle files installation, instead of calling "make install"
# automatically, as it would install in:
# - $(LIB_DIR)/systemd/user
# - $(SHARE_DIR)/licenses
# - $(SHARE_DIR)/doc
src_install() {
	dobin ${PN}
	einstalldocs
}
