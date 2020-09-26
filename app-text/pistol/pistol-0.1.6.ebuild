# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module
GIT_COMMIT="69aaad4"

DESCRIPTION="General purpose file previewer designed for Ranger/Lf to make scope.sh redundant"
HOMEPAGE="https://github.com/doronbehar/pistol"

EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"cloud.google.com/go v0.34.0/go.mod"
	"cloud.google.com/go v0.38.0/go.mod"
	"cloud.google.com/go v0.44.1/go.mod"
	"cloud.google.com/go v0.44.2/go.mod"
	"cloud.google.com/go v0.45.1/go.mod"
	"cloud.google.com/go v0.46.3/go.mod"
	"cloud.google.com/go/bigquery v1.0.1/go.mod"
	"cloud.google.com/go/datastore v1.0.0/go.mod"
	"cloud.google.com/go/firestore v1.1.0/go.mod"
	"cloud.google.com/go/pubsub v1.0.1/go.mod"
	"cloud.google.com/go/storage v1.0.0/go.mod"
	"code.cloudfoundry.org/bytefmt v0.0.0-20190710193110-1eb035ffe2b6/go.mod"
	"dmitri.shuralyov.com/gpu/mtl v0.0.0-20190408044501-666a987793e9/go.mod"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/BurntSushi/xgb v0.0.0-20160522181843-27f122750802/go.mod"
	"github.com/Djarvur/go-err113 v0.0.0-20200511133814-5174e21577d5/go.mod"
	"github.com/Masterminds/semver v1.5.0/go.mod"
	"github.com/OneOfOne/xxhash v1.2.2/go.mod"
	"github.com/OpenPeeDeeP/depguard v1.0.1/go.mod"
	"github.com/StackExchange/wmi v0.0.0-20180116203802-5d049714c4a6/go.mod"
	"github.com/adrg/xdg v0.2.1"
	"github.com/adrg/xdg v0.2.1/go.mod"
	"github.com/alecthomas/assert v0.0.0-20170929043011-405dbfeb8e38"
	"github.com/alecthomas/assert v0.0.0-20170929043011-405dbfeb8e38/go.mod"
	"github.com/alecthomas/chroma v0.8.1"
	"github.com/alecthomas/chroma v0.8.1/go.mod"
	"github.com/alecthomas/colour v0.0.0-20160524082231-60882d9e2721"
	"github.com/alecthomas/colour v0.0.0-20160524082231-60882d9e2721/go.mod"
	"github.com/alecthomas/kong v0.2.4/go.mod"
	"github.com/alecthomas/repr v0.0.0-20180818092828-117648cd9897/go.mod"
	"github.com/alecthomas/repr v0.0.0-20181024024818-d37bc2a10ba1"
	"github.com/alecthomas/repr v0.0.0-20181024024818-d37bc2a10ba1/go.mod"
	"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
	"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
	"github.com/alessio/shellescape v1.2.2"
	"github.com/alessio/shellescape v1.2.2/go.mod"
	"github.com/andybalholm/brotli v1.0.0"
	"github.com/andybalholm/brotli v1.0.0/go.mod"
	"github.com/armon/circbuf v0.0.0-20150827004946-bbbad097214e/go.mod"
	"github.com/armon/consul-api v0.0.0-20180202201655-eb2c6b5be1b6/go.mod"
	"github.com/armon/go-metrics v0.0.0-20180917152333-f0300d1749da/go.mod"
	"github.com/armon/go-radix v0.0.0-20180808171621-7fddfc383310/go.mod"
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
	"github.com/beorn7/perks v1.0.0/go.mod"
	"github.com/bgentry/speakeasy v0.1.0/go.mod"
	"github.com/bketelsen/crypt v0.0.3-0.20200106085610-5cbc8cc4026c/go.mod"
	"github.com/bombsimon/wsl/v3 v3.1.0/go.mod"
	"github.com/cespare/xxhash v1.1.0/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/coreos/bbolt v1.3.2/go.mod"
	"github.com/coreos/etcd v3.3.10+incompatible/go.mod"
	"github.com/coreos/etcd v3.3.13+incompatible/go.mod"
	"github.com/coreos/go-semver v0.2.0/go.mod"
	"github.com/coreos/go-semver v0.3.0/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e/go.mod"
	"github.com/coreos/pkg v0.0.0-20180928190104-399ea9e2e55f/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/daixiang0/gci v0.2.4/go.mod"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/denis-tingajkin/go-header v0.3.1/go.mod"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible/go.mod"
	"github.com/dgryski/go-sip13 v0.0.0-20181026042036-e10d5fee7954/go.mod"
	"github.com/dlclark/regexp2 v1.2.0"
	"github.com/dlclark/regexp2 v1.2.0/go.mod"
	"github.com/dlclark/regexp2 v1.2.1"
	"github.com/dlclark/regexp2 v1.2.1/go.mod"
	"github.com/dsnet/compress v0.0.1"
	"github.com/dsnet/compress v0.0.1/go.mod"
	"github.com/dsnet/golib v0.0.0-20171103203638-1ea166775780/go.mod"
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/dustin/go-humanize v1.0.0/go.mod"
	"github.com/fatih/color v1.7.0/go.mod"
	"github.com/fatih/color v1.9.0/go.mod"
	"github.com/frankban/quicktest v1.4.0/go.mod"
	"github.com/frankban/quicktest v1.10.0"
	"github.com/frankban/quicktest v1.10.0/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/fsnotify/fsnotify v1.4.9/go.mod"
	"github.com/galdor/go-cmdline v1.1.1"
	"github.com/galdor/go-cmdline v1.1.1/go.mod"
	"github.com/ghodss/yaml v1.0.0/go.mod"
	"github.com/go-critic/go-critic v0.5.2/go.mod"
	"github.com/go-gl/glfw v0.0.0-20190409004039-e6da0acd62b1/go.mod"
	"github.com/go-kit/kit v0.8.0/go.mod"
	"github.com/go-logfmt/logfmt v0.3.0/go.mod"
	"github.com/go-logfmt/logfmt v0.4.0/go.mod"
	"github.com/go-ole/go-ole v1.2.1/go.mod"
	"github.com/go-sql-driver/mysql v1.4.0/go.mod"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/go-toolsmith/astcast v1.0.0/go.mod"
	"github.com/go-toolsmith/astcopy v1.0.0/go.mod"
	"github.com/go-toolsmith/astequal v1.0.0/go.mod"
	"github.com/go-toolsmith/astfmt v1.0.0/go.mod"
	"github.com/go-toolsmith/astinfo v0.0.0-20180906194353-9809ff7efb21/go.mod"
	"github.com/go-toolsmith/astp v1.0.0/go.mod"
	"github.com/go-toolsmith/pkgload v1.0.0/go.mod"
	"github.com/go-toolsmith/strparse v1.0.0/go.mod"
	"github.com/go-toolsmith/typep v1.0.0/go.mod"
	"github.com/go-toolsmith/typep v1.0.2/go.mod"
	"github.com/go-xmlfmt/xmlfmt v0.0.0-20191208150333-d5b6f63a941b/go.mod"
	"github.com/gobwas/glob v0.2.3/go.mod"
	"github.com/gofrs/flock v0.8.0/go.mod"
	"github.com/gogo/protobuf v1.1.1/go.mod"
	"github.com/gogo/protobuf v1.2.1/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20190129154638-5b532d6fd5ef/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/mock v1.2.0/go.mod"
	"github.com/golang/mock v1.3.1/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod"
	"github.com/golang/protobuf v1.4.0/go.mod"
	"github.com/golang/protobuf v1.4.2/go.mod"
	"github.com/golang/snappy v0.0.1"
	"github.com/golang/snappy v0.0.1/go.mod"
	"github.com/golang/snappy v0.0.2"
	"github.com/golang/snappy v0.0.2/go.mod"
	"github.com/golangci/check v0.0.0-20180506172741-cfe4005ccda2/go.mod"
	"github.com/golangci/dupl v0.0.0-20180902072040-3e9179ac440a/go.mod"
	"github.com/golangci/errcheck v0.0.0-20181223084120-ef45e06d44b6/go.mod"
	"github.com/golangci/go-misc v0.0.0-20180628070357-927a3d87b613/go.mod"
	"github.com/golangci/goconst v0.0.0-20180610141641-041c5f2b40f3/go.mod"
	"github.com/golangci/gocyclo v0.0.0-20180528144436-0a533e8fa43d/go.mod"
	"github.com/golangci/gofmt v0.0.0-20190930125516-244bba706f1a/go.mod"
	"github.com/golangci/golangci-lint v1.31.0/go.mod"
	"github.com/golangci/ineffassign v0.0.0-20190609212857-42439a7714cc/go.mod"
	"github.com/golangci/lint-1 v0.0.0-20191013205115-297bf364a8e0/go.mod"
	"github.com/golangci/maligned v0.0.0-20180506175553-b1d89398deca/go.mod"
	"github.com/golangci/misspell v0.0.0-20180809174111-950f5d19e770/go.mod"
	"github.com/golangci/prealloc v0.0.0-20180630174525-215b22d4de21/go.mod"
	"github.com/golangci/revgrep v0.0.0-20180526074752-d9c87f5ffaf0/go.mod"
	"github.com/golangci/unconvert v0.0.0-20180507085042-28b1c447d1f4/go.mod"
	"github.com/google/btree v0.0.0-20180813153112-4030bb1f1f0c/go.mod"
	"github.com/google/btree v1.0.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-cmp v0.5.0/go.mod"
	"github.com/google/go-cmp v0.5.2"
	"github.com/google/go-cmp v0.5.2/go.mod"
	"github.com/google/martian v2.1.0+incompatible/go.mod"
	"github.com/google/pprof v0.0.0-20181206194817-3ea8567a2e57/go.mod"
	"github.com/google/pprof v0.0.0-20190515194954-54271f7e092f/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/google/uuid v1.0.0/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.4/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.5/go.mod"
	"github.com/gookit/color v1.2.5/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
	"github.com/gorilla/websocket v1.4.0/go.mod"
	"github.com/gorilla/websocket v1.4.2/go.mod"
	"github.com/gostaticanalysis/analysisutil v0.0.0-20190318220348-4088753ea4d3/go.mod"
	"github.com/gostaticanalysis/analysisutil v0.0.3/go.mod"
	"github.com/grpc-ecosystem/go-grpc-middleware v1.0.0/go.mod"
	"github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0/go.mod"
	"github.com/grpc-ecosystem/grpc-gateway v1.9.0/go.mod"
	"github.com/hashicorp/consul/api v1.1.0/go.mod"
	"github.com/hashicorp/consul/sdk v0.1.1/go.mod"
	"github.com/hashicorp/errwrap v1.0.0/go.mod"
	"github.com/hashicorp/go-cleanhttp v0.5.1/go.mod"
	"github.com/hashicorp/go-immutable-radix v1.0.0/go.mod"
	"github.com/hashicorp/go-msgpack v0.5.3/go.mod"
	"github.com/hashicorp/go-multierror v1.0.0/go.mod"
	"github.com/hashicorp/go-rootcerts v1.0.0/go.mod"
	"github.com/hashicorp/go-sockaddr v1.0.0/go.mod"
	"github.com/hashicorp/go-syslog v1.0.0/go.mod"
	"github.com/hashicorp/go-uuid v1.0.0/go.mod"
	"github.com/hashicorp/go-uuid v1.0.1/go.mod"
	"github.com/hashicorp/go.net v0.0.1/go.mod"
	"github.com/hashicorp/golang-lru v0.5.0/go.mod"
	"github.com/hashicorp/golang-lru v0.5.1/go.mod"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/hashicorp/logutils v1.0.0/go.mod"
	"github.com/hashicorp/mdns v1.0.0/go.mod"
	"github.com/hashicorp/memberlist v0.1.3/go.mod"
	"github.com/hashicorp/serf v0.8.2/go.mod"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/jingyugao/rowserrcheck v0.0.0-20191204022205-72ab7603b68a/go.mod"
	"github.com/jirfag/go-printf-func-name v0.0.0-20191110105641-45db9963cdd3/go.mod"
	"github.com/jmoiron/sqlx v1.2.0/go.mod"
	"github.com/jmoiron/sqlx v1.2.1-0.20190826204134-d7d95172beb5/go.mod"
	"github.com/jonboulle/clockwork v0.1.0/go.mod"
	"github.com/json-iterator/go v1.1.6/go.mod"
	"github.com/jstemmer/go-junit-report v0.0.0-20190106144839-af01ea7f8024/go.mod"
	"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
	"github.com/julienschmidt/httprouter v1.2.0/go.mod"
	"github.com/kisielk/errcheck v1.1.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/compress v1.4.1/go.mod"
	"github.com/klauspost/compress v1.10.7/go.mod"
	"github.com/klauspost/compress v1.10.10/go.mod"
	"github.com/klauspost/compress v1.11.0"
	"github.com/klauspost/compress v1.11.0/go.mod"
	"github.com/klauspost/cpuid v1.2.0"
	"github.com/klauspost/cpuid v1.2.0/go.mod"
	"github.com/klauspost/pgzip v1.2.4/go.mod"
	"github.com/klauspost/pgzip v1.2.5"
	"github.com/klauspost/pgzip v1.2.5/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.3"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.3/go.mod"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.2.0"
	"github.com/kr/pretty v0.2.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/kyoh86/exportloopref v0.1.7/go.mod"
	"github.com/lib/pq v1.0.0/go.mod"
	"github.com/logrusorgru/aurora v0.0.0-20181002194514-a7b3b318ed4e/go.mod"
	"github.com/magiconair/properties v1.8.0/go.mod"
	"github.com/magiconair/properties v1.8.1/go.mod"
	"github.com/maratori/testpackage v1.0.1/go.mod"
	"github.com/matoous/godox v0.0.0-20190911065817-5d6d842e92eb/go.mod"
	"github.com/mattn/go-colorable v0.0.9/go.mod"
	"github.com/mattn/go-colorable v0.1.4/go.mod"
	"github.com/mattn/go-colorable v0.1.6/go.mod"
	"github.com/mattn/go-colorable v0.1.7/go.mod"
	"github.com/mattn/go-isatty v0.0.3/go.mod"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.11/go.mod"
	"github.com/mattn/go-isatty v0.0.12"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mattn/go-sqlite3 v1.9.0/go.mod"
	"github.com/mattn/goveralls v0.0.2/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
	"github.com/mholt/archiver/v3 v3.3.1"
	"github.com/mholt/archiver/v3 v3.3.1/go.mod"
	"github.com/miekg/dns v1.0.14/go.mod"
	"github.com/mitchellh/cli v1.0.0/go.mod"
	"github.com/mitchellh/colorstring v0.0.0-20190213212951-d06e56a500db/go.mod"
	"github.com/mitchellh/go-homedir v1.0.0/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/mitchellh/go-ps v1.0.0/go.mod"
	"github.com/mitchellh/go-testing-interface v1.0.0/go.mod"
	"github.com/mitchellh/gox v0.4.0/go.mod"
	"github.com/mitchellh/iochan v1.0.0/go.mod"
	"github.com/mitchellh/mapstructure v0.0.0-20160808181253-ca63d7c062ee/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v1.0.1/go.mod"
	"github.com/mozilla/tls-observatory v0.0.0-20200317151703-4fa42e1c2dee/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
	"github.com/nakabonne/nestif v0.3.0/go.mod"
	"github.com/nbutton23/zxcvbn-go v0.0.0-20180912185939-ae427f1e4c1d/go.mod"
	"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e"
	"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e/go.mod"
	"github.com/nishanths/exhaustive v0.0.0-20200811152831-6cf413ae40e0/go.mod"
	"github.com/nwaples/rardecode v1.1.0"
	"github.com/nwaples/rardecode v1.1.0/go.mod"
	"github.com/nxadm/tail v1.4.4/go.mod"
	"github.com/oklog/ulid v1.3.1/go.mod"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.8.0/go.mod"
	"github.com/onsi/ginkgo v1.12.1/go.mod"
	"github.com/onsi/ginkgo v1.13.0/go.mod"
	"github.com/onsi/gomega v1.5.0/go.mod"
	"github.com/onsi/gomega v1.7.1/go.mod"
	"github.com/onsi/gomega v1.10.1/go.mod"
	"github.com/pascaldekloe/goe v0.0.0-20180627143212-57f6aae5913c/go.mod"
	"github.com/pborman/uuid v1.2.0/go.mod"
	"github.com/pelletier/go-toml v1.2.0/go.mod"
	"github.com/phayes/checkstyle v0.0.0-20170904204023-bfd46e6a821d/go.mod"
	"github.com/pierrec/cmdflag v0.0.2/go.mod"
	"github.com/pierrec/lz4/v3 v3.3.2"
	"github.com/pierrec/lz4/v3 v3.3.2/go.mod"
	"github.com/pkg/errors v0.8.0/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/posener/complete v1.1.1/go.mod"
	"github.com/prometheus/client_golang v0.9.1/go.mod"
	"github.com/prometheus/client_golang v0.9.3/go.mod"
	"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
	"github.com/prometheus/common v0.0.0-20181113130724-41aa239b4cce/go.mod"
	"github.com/prometheus/common v0.4.0/go.mod"
	"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
	"github.com/prometheus/procfs v0.0.0-20190507164030-5867b95ac084/go.mod"
	"github.com/prometheus/tsdb v0.7.1/go.mod"
	"github.com/quasilyte/go-consistent v0.0.0-20190521200055-c6f3937de18c/go.mod"
	"github.com/quasilyte/go-ruleguard v0.2.0/go.mod"
	"github.com/quasilyte/regex/syntax v0.0.0-20200407221936-30656e2c4a95/go.mod"
	"github.com/rakyll/magicmime v0.1.0"
	"github.com/rakyll/magicmime v0.1.0/go.mod"
	"github.com/rogpeppe/fastuuid v0.0.0-20150106093220-6724a57986af/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/rogpeppe/go-internal v1.6.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod"
	"github.com/ryancurrah/gomodguard v1.1.0/go.mod"
	"github.com/ryanrolds/sqlclosecheck v0.3.0/go.mod"
	"github.com/ryanuber/columnize v0.0.0-20160712163229-9b3edd62028f/go.mod"
	"github.com/schollz/progressbar/v2 v2.13.2/go.mod"
	"github.com/sclevine/agouti v3.0.0+incompatible/go.mod"
	"github.com/sean-/seed v0.0.0-20170313163322-e2103e2c3529/go.mod"
	"github.com/securego/gosec/v2 v2.4.0/go.mod"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/shazow/go-diff v0.0.0-20160112020656-b6b7b6733b8c/go.mod"
	"github.com/shirou/gopsutil v0.0.0-20190901111213-e4ec7b275ada/go.mod"
	"github.com/shirou/w32 v0.0.0-20160930032740-bb4de0191aa4/go.mod"
	"github.com/shurcooL/go v0.0.0-20180423040247-9e1955d9fb6e/go.mod"
	"github.com/shurcooL/go-goon v0.0.0-20170922171312-37c2f522c041/go.mod"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/sirupsen/logrus v1.2.0/go.mod"
	"github.com/sirupsen/logrus v1.6.0"
	"github.com/sirupsen/logrus v1.6.0/go.mod"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
	"github.com/smartystreets/goconvey v1.6.4/go.mod"
	"github.com/soheilhy/cmux v0.1.4/go.mod"
	"github.com/sonatard/noctx v0.0.1/go.mod"
	"github.com/sourcegraph/go-diff v0.6.0/go.mod"
	"github.com/spaolacci/murmur3 v0.0.0-20180118202830-f09979ecbc72/go.mod"
	"github.com/spf13/afero v1.1.2/go.mod"
	"github.com/spf13/cast v1.3.0/go.mod"
	"github.com/spf13/cobra v1.0.0/go.mod"
	"github.com/spf13/jwalterweatherman v1.0.0/go.mod"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/spf13/viper v1.4.0/go.mod"
	"github.com/spf13/viper v1.7.1/go.mod"
	"github.com/ssgreg/nlreturn/v2 v2.1.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/stretchr/testify v1.6.1"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/subosito/gotenv v1.2.0/go.mod"
	"github.com/tdakkota/asciicheck v0.0.0-20200416190851-d7f85be797a2/go.mod"
	"github.com/tetafro/godot v0.4.8/go.mod"
	"github.com/timakin/bodyclose v0.0.0-20190930140734-f7f2e9bca95e/go.mod"
	"github.com/tmc/grpc-websocket-proxy v0.0.0-20190109142713-0ad062ec5ee5/go.mod"
	"github.com/tommy-muehle/go-mnd v1.3.1-0.20200224220436-e6f9a994e8fa/go.mod"
	"github.com/ugorji/go v1.1.4/go.mod"
	"github.com/ulikunitz/xz v0.5.6"
	"github.com/ulikunitz/xz v0.5.6/go.mod"
	"github.com/ulikunitz/xz v0.5.7/go.mod"
	"github.com/ulikunitz/xz v0.5.8"
	"github.com/ulikunitz/xz v0.5.8/go.mod"
	"github.com/ultraware/funlen v0.0.3/go.mod"
	"github.com/ultraware/whitespace v0.0.4/go.mod"
	"github.com/uudashr/gocognit v1.0.1/go.mod"
	"github.com/valyala/bytebufferpool v1.0.0/go.mod"
	"github.com/valyala/fasthttp v1.15.1/go.mod"
	"github.com/valyala/quicktemplate v1.6.2/go.mod"
	"github.com/valyala/tcplisten v0.0.0-20161114210144-ceec8f93295a/go.mod"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8/go.mod"
	"github.com/xiang90/probing v0.0.0-20190116061207-43a291ad63a2/go.mod"
	"github.com/xordataexchange/crypt v0.0.3-0.20170626215501-b2862e3d0a77/go.mod"
	"github.com/yuin/goldmark v1.1.25/go.mod"
	"github.com/yuin/goldmark v1.1.27/go.mod"
	"github.com/yuin/goldmark v1.1.32/go.mod"
	"go.etcd.io/bbolt v1.3.2/go.mod"
	"go.opencensus.io v0.21.0/go.mod"
	"go.opencensus.io v0.22.0/go.mod"
	"go.uber.org/atomic v1.4.0/go.mod"
	"go.uber.org/multierr v1.1.0/go.mod"
	"go.uber.org/zap v1.10.0/go.mod"
	"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
	"golang.org/x/crypto v0.0.0-20181029021203-45a5f77698d3/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod"
	"golang.org/x/exp v0.0.0-20190306152737-a1d7652674e8/go.mod"
	"golang.org/x/exp v0.0.0-20190510132918-efd6b22b2522/go.mod"
	"golang.org/x/exp v0.0.0-20190829153037-c13cbed26979/go.mod"
	"golang.org/x/exp v0.0.0-20191030013958-a1ab85dbe136/go.mod"
	"golang.org/x/image v0.0.0-20190227222117-0694c2d4d067/go.mod"
	"golang.org/x/image v0.0.0-20190802002840-cff245a6509b/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod"
	"golang.org/x/lint v0.0.0-20190301231843-5614ed5bae6f/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/lint v0.0.0-20190409202823-959b441ac422/go.mod"
	"golang.org/x/lint v0.0.0-20190909230951-414d861bb4ac/go.mod"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de/go.mod"
	"golang.org/x/mobile v0.0.0-20190312151609-d3739f865fa6/go.mod"
	"golang.org/x/mobile v0.0.0-20190719004257-d2bd2a29d028/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.0/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.2.0/go.mod"
	"golang.org/x/mod v0.3.0/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
	"golang.org/x/net v0.0.0-20181023162649-9b4f9f5ad519/go.mod"
	"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod"
	"golang.org/x/net v0.0.0-20181201002055-351d144fa1fc/go.mod"
	"golang.org/x/net v0.0.0-20181220203305-927f97764cc3/go.mod"
	"golang.org/x/net v0.0.0-20190108225652-1e06a53dbb7e/go.mod"
	"golang.org/x/net v0.0.0-20190213061140-3a22650c66bd/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190501004415-9ce7a6920f09/go.mod"
	"golang.org/x/net v0.0.0-20190503192946-f4e77d36d62c/go.mod"
	"golang.org/x/net v0.0.0-20190522155817-f3200d17e092/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b/go.mod"
	"golang.org/x/net v0.0.0-20200520004742-59133d7f0dd7/go.mod"
	"golang.org/x/net v0.0.0-20200602114024-627f9648deb9/go.mod"
	"golang.org/x/net v0.0.0-20200625001655-4c5254603344/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190226205417-e64efc72b421/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20200625203802-6e8e738ad208/go.mod"
	"golang.org/x/sys v0.0.0-20180823144017-11551d06cbcc/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20181026203630-95b1ffbd15a5/go.mod"
	"golang.org/x/sys v0.0.0-20181107165924-66b7b1311ac8/go.mod"
	"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190312061237-fead79001313/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
	"golang.org/x/sys v0.0.0-20190502145724-3ef323f4f1fd/go.mod"
	"golang.org/x/sys v0.0.0-20190507160741-ecd444e8653b/go.mod"
	"golang.org/x/sys v0.0.0-20190606165138-5da285871e9c/go.mod"
	"golang.org/x/sys v0.0.0-20190624142023-c5567b49c5d0/go.mod"
	"golang.org/x/sys v0.0.0-20190904154756-749cb33beabd/go.mod"
	"golang.org/x/sys v0.0.0-20191005200804-aed5e4c7ecf9/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20191120155948-bd437916bb0e/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/sys v0.0.0-20200413165638-669c56c373c4/go.mod"
	"golang.org/x/sys v0.0.0-20200519105757-fe76b779f299/go.mod"
	"golang.org/x/sys v0.0.0-20200602225109-6fdc65e7d980/go.mod"
	"golang.org/x/sys v0.0.0-20200923182605-d9f96fdee20d"
	"golang.org/x/sys v0.0.0-20200923182605-d9f96fdee20d/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/time v0.0.0-20181108054448-85acf8d2951c/go.mod"
	"golang.org/x/time v0.0.0-20190308202827-9d24e82272b4/go.mod"
	"golang.org/x/tools v0.0.0-20180221164845-07fd8470d635/go.mod"
	"golang.org/x/tools v0.0.0-20180525024113-a5b4c53f6e8b/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20190110163146-51295c7ec13a/go.mod"
	"golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod"
	"golang.org/x/tools v0.0.0-20190221204921-83362c3779f5/go.mod"
	"golang.org/x/tools v0.0.0-20190226205152-f727befe758c/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190311215038-5c2858a9cfe5/go.mod"
	"golang.org/x/tools v0.0.0-20190312151545-0bb0c0a6e846/go.mod"
	"golang.org/x/tools v0.0.0-20190312170243-e65039ee4138/go.mod"
	"golang.org/x/tools v0.0.0-20190322203728-c1a832b0ad89/go.mod"
	"golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
	"golang.org/x/tools v0.0.0-20190425150028-36563e24a262/go.mod"
	"golang.org/x/tools v0.0.0-20190506145303-2d16b83fe98c/go.mod"
	"golang.org/x/tools v0.0.0-20190606124116-d0a3d012864b/go.mod"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac/go.mod"
	"golang.org/x/tools v0.0.0-20190628153133-6cdbf07be9d0/go.mod"
	"golang.org/x/tools v0.0.0-20190719005602-e377ae9d6386/go.mod"
	"golang.org/x/tools v0.0.0-20190816200558-6889da9d5479/go.mod"
	"golang.org/x/tools v0.0.0-20190910044552-dd2b5c81c578/go.mod"
	"golang.org/x/tools v0.0.0-20190911174233-4f2ddba30aff/go.mod"
	"golang.org/x/tools v0.0.0-20191012152004-8de300cfc20a/go.mod"
	"golang.org/x/tools v0.0.0-20191108193012-7d206e10da11/go.mod"
	"golang.org/x/tools v0.0.0-20191112195655-aa38f8e97acc/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20191130070609-6e064ea0cf2d/go.mod"
	"golang.org/x/tools v0.0.0-20200117220505-0cba7a3a9ee9/go.mod"
	"golang.org/x/tools v0.0.0-20200321224714-0d839f3cf2ed/go.mod"
	"golang.org/x/tools v0.0.0-20200324003944-a576cf524670/go.mod"
	"golang.org/x/tools v0.0.0-20200414032229-332987a829c3/go.mod"
	"golang.org/x/tools v0.0.0-20200422022333-3d57cf2e726e/go.mod"
	"golang.org/x/tools v0.0.0-20200519015757-0d0afa43d58a/go.mod"
	"golang.org/x/tools v0.0.0-20200625211823-6506e20df31f/go.mod"
	"golang.org/x/tools v0.0.0-20200626171337-aa94e735be7f/go.mod"
	"golang.org/x/tools v0.0.0-20200701041122-1837592efa10/go.mod"
	"golang.org/x/tools v0.0.0-20200724022722-7017fd6b1305/go.mod"
	"golang.org/x/tools v0.0.0-20200812195022-5ae4c3c160a0/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"google.golang.org/api v0.4.0/go.mod"
	"google.golang.org/api v0.7.0/go.mod"
	"google.golang.org/api v0.8.0/go.mod"
	"google.golang.org/api v0.9.0/go.mod"
	"google.golang.org/api v0.13.0/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/appengine v1.5.0/go.mod"
	"google.golang.org/appengine v1.6.1/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20190307195333-5fe7a883aa19/go.mod"
	"google.golang.org/genproto v0.0.0-20190418145605-e7d98fc518a7/go.mod"
	"google.golang.org/genproto v0.0.0-20190425155659-357c62f0e4bb/go.mod"
	"google.golang.org/genproto v0.0.0-20190502173448-54afdca5d873/go.mod"
	"google.golang.org/genproto v0.0.0-20190801165951-fa694d86fc64/go.mod"
	"google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55/go.mod"
	"google.golang.org/genproto v0.0.0-20190911173649-1774047e7e51/go.mod"
	"google.golang.org/genproto v0.0.0-20191108220845-16a3f7862a1a/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.20.1/go.mod"
	"google.golang.org/grpc v1.21.0/go.mod"
	"google.golang.org/grpc v1.21.1/go.mod"
	"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod"
	"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod"
	"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod"
	"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod"
	"google.golang.org/protobuf v1.21.0/go.mod"
	"google.golang.org/protobuf v1.23.0/go.mod"
	"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f"
	"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/ini.v1 v1.51.0/go.mod"
	"gopkg.in/resty.v1 v1.12.0/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/yaml.v2 v2.0.0-20170812160011-eb3733d160e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.2.8/go.mod"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod"
	"honnef.co/go/tools v0.0.0-20190418001031-e561f6794a2a/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
	"honnef.co/go/tools v0.0.1-2020.1.5/go.mod"
	"mvdan.cc/gofumpt v0.0.0-20200709182408-4fd085cb6d5f/go.mod"
	"mvdan.cc/interfacer v0.0.0-20180901003855-c20040233aed/go.mod"
	"mvdan.cc/lint v0.0.0-20170908181259-adc824a0674b/go.mod"
	"mvdan.cc/unparam v0.0.0-20190720180237-d51796306d8f/go.mod"
	"rsc.io/binaryregexp v0.2.0/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/doronbehar/pistol/archive/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(LICENSE NEWS.adoc README.adoc)

S="${WORKDIR}/${P}"

src_install() {
	dobin ${PN}
	einstalldocs
}