# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GIT_COMMIT="22b84dbc5f2e0c8ab4ade2cfd820f9973565f5e5"
EGO_PN="github.com/tilt-dev/tilt/"
EGO_VENDOR=(
	"github.com/adrg/xdg v0.4.0"
	"github.com/akutz/memconn v0.1.0"
	"github.com/alessio/shellescape v1.4.1"
	"github.com/blang/semver v3.5.1"
	"github.com/compose-spec/compose-go v1.18.4"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/distribution/reference v0.5.0"
	"github.com/docker/cli v24.0.5"
	"github.com/docker/docker v24.0.5"
	"github.com/docker/go-connections v0.4.0"
	"github.com/docker/go-units v0.5.0"
	"github.com/fatih/color v1.13.0"
	"github.com/fsnotify/fsevents v0.1.1"
	"github.com/gdamore/tcell v1.1.3"
	"github.com/go-logr/logr v1.2.4"
	"github.com/gogo/protobuf v1.3.2"
	"github.com/golang/protobuf v1.5.3"
	"github.com/google/go-cmp v0.5.9"
	"github.com/google/uuid v1.3.0"
	"github.com/google/wire v0.5.0"
	"github.com/gorilla/mux v1.8.0"
	"github.com/gorilla/websocket v1.5.0"
	"github.com/grpc-ecosystem/grpc-gateway v1.16.0"
	"github.com/jonboulle/clockwork v0.3.0"
	"github.com/json-iterator/go v1.1.12"
	"github.com/kballard/go-shellquote 95032a82bc51"
	"github.com/looplab/tarjan v0.1.0"
	"github.com/mattn/go-colorable v0.1.13"
	"github.com/mattn/go-isatty v0.0.17"
	"github.com/mattn/go-jsonpointer v0.0.1"
	"github.com/mattn/go-tty v0.0.4"
	"github.com/moby/buildkit v0.11.6"
	"github.com/modern-go/reflect2 v1.0.2"
	"github.com/opencontainers/go-digest v1.0.0"
	"github.com/phayes/freeport 74d24b5ae9f5"
	"github.com/pkg/browser 681adbf594b8"
	"github.com/pkg/errors v0.9.1"
	"github.com/rivo/tview bc39bf8d245d"
	"github.com/schollz/closestmatch v2.1.0"
	"github.com/spf13/cobra v1.7.0"
	"github.com/spf13/pflag v1.0.5"
	"github.com/stretchr/testify v1.8.4"
	"github.com/tilt-dev/clusterid v0.1.5"
	"github.com/tilt-dev/dockerignore v0.1.1"
	"github.com/tilt-dev/fsnotify fff9c274a375"
	"github.com/tilt-dev/go-get v0.2.3"
	"github.com/tilt-dev/localregistry-go ffc4c827f097"
	"github.com/tilt-dev/probe v0.3.1"
	"github.com/tilt-dev/starlark-lsp 84c13fe0ff94"
	"github.com/tilt-dev/tilt-apiserver v0.10.0"
	"github.com/tilt-dev/wmclient 1839d0355fbc"
	"github.com/tonistiigi/fsutil a3696a2f1f27"
	"github.com/tonistiigi/units 6950e57a87ea"
	"github.com/whilp/git-urls v1.0.0"
	"go.lsp.dev/protocol v0.11.2 github.com/go-language-server/protocol"
	"go.lsp.dev/uri v0.3.0 github.com/go-language-server/uri"
	"go.opentelemetry.io/otel v1.14.0 github.com/open-telemetry/opentelemetry-go"
	"go.opentelemetry.io/otel v1.14.0 github.com/open-telemetry/opentelemetry-go"
	"go.opentelemetry.io/otel v1.14.0 github.com/open-telemetry/opentelemetry-go"
	"go.starlark.net a134d8f9ddca github.com/google/starlark-go"
	"go.uber.org/atomic v1.10.0 github.com/uber-go/atomic"
	"golang.org/x/exp 613f0c0eb8a1 github.com/golang/exp"
	"golang.org/x/mod v0.11.0 github.com/golang/mod"
	"golang.org/x/sync v0.3.0 github.com/golang/sync"
	"golang.org/x/term v0.13.0 github.com/golang/term"
	"golang.org/x/xerrors 04be3eba64a2 github.com/golang/xerrors"
	"google.golang.org/genproto/googleapis/api dd9d682886f9 github.com/googleapis/go-genproto"
	"google.golang.org/grpc v1.54.0 github.com/grpc/grpc-go"
	"google.golang.org/protobuf v1.30.0 github.com/protocolbuffers/protobuf-go"
	"gopkg.in/d4l3k/messagediff.v1 v1.2.1 github.com/d4l3k/messagediff"
	"gopkg.in/yaml.v2 v2.4.0 github.com/go-yaml/yaml"
	"gopkg.in/yaml.v3 v3.0.1 github.com/go-yaml/yaml"
	"helm.sh/helm/v3 v3.12.1 github.com/helm/helm"
	"k8s.io/api v0.28.1 github.com/kubernetes/api"
	"k8s.io/apimachinery v0.28.1 github.com/kubernetes/apimachinery"
	"k8s.io/apiserver v0.28.1 github.com/kubernetes/apiserver"
	"k8s.io/cli-runtime v0.28.1 github.com/kubernetes/cli-runtime"
	"k8s.io/client-go v0.28.1 github.com/kubernetes/client-go"
	"k8s.io/code-generator v0.28.1 github.com/kubernetes/code-generator"
	"k8s.io/klog/v2 v2.100.1 github.com/kubernetes/klog"
	"k8s.io/kube-openapi 2695361300d9 github.com/kubernetes/kube-openapi"
	"k8s.io/kubectl v0.28.1 github.com/kubernetes/kubectl"
	"k8s.io/utils d93618cff8a2 github.com/kubernetes/utils"
	"sigs.k8s.io/controller-runtime v0.16.2 github.com/kubernetes-sigs/controller-runtime"
	"sigs.k8s.io/kustomize/api 6ce0bf390ce3 github.com/kubernetes-sigs/kustomize"
	"sigs.k8s.io/yaml v1.3.0 github.com/kubernetes-sigs/yaml"
	"github.com/Azure/go-ansiterm d185dfc1b5a1" # indirect
	"github.com/MakeNowJust/heredoc v1.0.0" # indirect
	"github.com/Microsoft/go-winio v0.6.0" # indirect
	"github.com/NYTimes/gziphandler v1.1.1" # indirect
	"github.com/agext/levenshtein v1.2.3" # indirect
	"github.com/agl/ed25519 5312a6153412" # indirect
	"github.com/antlr/antlr4 8188dc5388df" # indirect
	"github.com/asaskevich/govalidator 21a406dcc535" # indirect
	"github.com/beorn7/perks v1.0.1" # indirect
	"github.com/blang/semver v4.0.0" # indirect
	"github.com/bugsnag/bugsnag-go v1.5.3" # indirect
	"github.com/bugsnag/panicwrap v1.2.0" # indirect
	"github.com/cenkalti/backoff v2.2.1" # indirect
	"github.com/cenkalti/backoff v4.2.1" # indirect
	"github.com/cespare/xxhash v2.2.0" # indirect
	"github.com/chai2010/gettext-go v1.0.2" # indirect
	"github.com/cloudflare/cfssl v1.4.1" # indirect
	"github.com/containerd/console v1.0.3" # indirect
	"github.com/containerd/containerd v1.7.0" # indirect
	"github.com/containerd/continuity 2a963a2f56e8" # indirect
	"github.com/containerd/typeurl v1.0.2" # indirect
	"github.com/containerd/typeurl v2.1.0" # indirect
	"github.com/coreos/go-semver v0.3.1" # indirect
	"github.com/coreos/go-systemd v22.5.0" # indirect
	"github.com/cpuguy83/go-md2man v2.0.2" # indirect
	"github.com/d4l3k/messagediff v1.2.1" # indirect
	"github.com/denisbrodbeck/machineid v1.0.0" # indirect
	"github.com/docker/distribution v2.8.2" # indirect
	"github.com/docker/docker-credential-helpers v0.7.0" # indirect
	"github.com/docker/go v1.5.1-1" # indirect
	"github.com/docker/go-metrics v0.0.1" # indirect
	"github.com/docker/libtrust aabc10ec26b7" # indirect
	"github.com/emicklei/go-restful v3.10.1" # indirect
	"github.com/evanphx/json-patch v5.6.0" # indirect
	"github.com/evanphx/json-patch v5.6.0" # indirect
	"github.com/exponent-io/jsonpath d6023ce2651d" # indirect
	"github.com/fatih/camelcase v1.0.0" # indirect
	"github.com/felixge/httpsnoop v1.0.3" # indirect
	"github.com/francoispqt/gojay v1.2.13" # indirect
	"github.com/fsnotify/fsnotify v1.6.0" # indirect
	"github.com/fvbommel/sortorder v1.1.0" # indirect
	"github.com/gdamore/encoding v1.0.0" # indirect
	"github.com/go-errors/errors v1.4.2" # indirect
	"github.com/go-logr/stdr v1.2.2" # indirect
	"github.com/go-openapi/jsonpointer v0.19.6" # indirect
	"github.com/go-openapi/jsonreference v0.20.2" # indirect
	"github.com/go-openapi/swag v0.22.3" # indirect
	"github.com/go-sql-driver/mysql v1.4.1" # indirect
	"github.com/gofrs/flock v0.8.1" # indirect
	"github.com/gofrs/uuid v4.0.0" # indirect
	"github.com/gogo/googleapis v1.4.1" # indirect
	"github.com/golang/groupcache 41bb18bfe9da" # indirect
	"github.com/google/btree v1.0.1" # indirect
	"github.com/google/cel-go v0.16.0" # indirect
	"github.com/google/gnostic-models v0.6.8" # indirect
	"github.com/google/gofuzz v1.2.0" # indirect
	"github.com/google/shlex e7afc7fbc510" # indirect
	"github.com/gregjones/httpcache 901d90724c79" # indirect
	"github.com/grpc-ecosystem/go-grpc-middleware v1.3.0" # indirect
	"github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0" # indirect
	"github.com/grpc-ecosystem/grpc-gateway v2.7.0" # indirect
	"github.com/hailocab/go-hostpool e80d13ce29ed" # indirect
	"github.com/hashicorp/errwrap v1.1.0" # indirect
	"github.com/hashicorp/go-multierror v1.1.1" # indirect
	"github.com/imdario/mergo v0.3.16" # indirect
	"github.com/inconshreveable/mousetrap v1.1.0" # indirect
	"github.com/jinzhu/gorm v1.9.12" # indirect
	"github.com/josharian/intern v1.0.0" # indirect
	"github.com/kardianos/osext 2bc1f35cddc0" # indirect
	"github.com/liggitt/tabwriter 89fcab3d43de" # indirect
	"github.com/lucasb-eyer/go-colorful v1.0.2" # indirect
	"github.com/mailru/easyjson v0.7.7" # indirect
	"github.com/mattn/go-runewidth v0.0.9" # indirect
	"github.com/mattn/go-shellwords v1.0.12" # indirect
	"github.com/matttproud/golang_protobuf_extensions v1.0.4" # indirect
	"github.com/miekg/pkcs11 v1.1.1" # indirect
	"github.com/mitchellh/go-homedir v1.1.0" # indirect
	"github.com/mitchellh/go-wordwrap v1.0.1" # indirect
	"github.com/mitchellh/mapstructure v1.5.0" # indirect
	"github.com/moby/patternmatcher v0.5.0" # indirect
	"github.com/moby/spdystream v0.2.0" # indirect
	"github.com/moby/sys/sequential v0.5.0 github.com/moby/sys/tree/sequential/v0.5.0" # indirect
	# "github.com/moby/sys/signal v0.7.0" # indirect
	# "github.com/moby/term 1aeaba878587" # indirect
	"github.com/modern-go/concurrent bacd9c7ef1dd" # indirect
	"github.com/monochromegane/go-gitignore 205db1a8cc00" # indirect
	"github.com/morikuni/aec v1.0.0" # indirect
	"github.com/munnerz/goautoneg a7dc8b61c822" # indirect
	"github.com/mxk/go-flowrate cca7078d478f" # indirect
	"github.com/opencontainers/image-spec 3a7f492d3f1b" # indirect
	"github.com/peterbourgon/diskv v2.0.1" # indirect
	"github.com/pmezard/go-difflib v1.0.0" # indirect
	"github.com/prometheus/client_golang v1.16.0" # indirect
	"github.com/prometheus/client_model v0.4.0" # indirect
	"github.com/prometheus/common v0.44.0" # indirect
	"github.com/prometheus/procfs v0.10.1" # indirect
	"github.com/russross/blackfriday v2.1.0" # indirect
	"github.com/segmentio/encoding v0.2.7" # indirect
	"github.com/sirupsen/logrus v1.9.0" # indirect
	"github.com/smacker/go-tree-sitter 0d3022e933c3" # indirect
	"github.com/stoewer/go-strcase v1.2.0" # indirect
	"github.com/theupdateframework/notary v0.6.1" # indirect
	"github.com/tonistiigi/vt100 8066bb97264f" # indirect
	"github.com/xeipuuv/gojsonpointer 02993c407bfb" # indirect
	"github.com/xeipuuv/gojsonreference bd5ef7bd5415" # indirect
	"github.com/xeipuuv/gojsonschema v1.2.0" # indirect
	"github.com/xlab/treeprint v1.2.0" # indirect
	"go.etcd.io/etcd/api v3.5.9 github.com/etcd-io/etcd" # indirect
	"go.etcd.io/etcd/client v3.5.9 github.com/etcd-io/etcd" # indirect
	"go.etcd.io/etcd/client v3.5.9 github.com/etcd-io/etcd" # indirect
	"go.lsp.dev/jsonrpc2 v0.9.0 github.com/go-language-server/jsonrpc2" # indirect
	"go.lsp.dev/pkg f7deec69b52e github.com/go-language-server/pkg" # indirect
	# "go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.40.0 github.com/open-telemetry/opentelemetry-go-contrib" # indirect
	# "go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.35.1 github.com/open-telemetry/opentelemetry-go-contrib" # indirect
	# "go.opentelemetry.io/otel/exporters/otlp/internal/retry v1.14.0 github.com/open-telemetry/opentelemetry-go" # indirect
	# "go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.14.0 github.com/open-telemetry/opentelemetry-go" # indirect
	# "go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.14.0 github.com/open-telemetry/opentelemetry-go" # indirect
	# "go.opentelemetry.io/otel/metric v0.37.0 github.com/open-telemetry/opentelemetry-go" # indirect
	# "go.opentelemetry.io/proto/otlp v0.19.0" # indirect
	"go.uber.org/multierr v1.11.0 github.com/uber-go/multierr" # indirect
	"go.uber.org/zap v1.25.0 github.com/uber-go/zap" # indirect
	"golang.org/x/crypto v0.14.0 github.com/golang/crypto" # indirect
	"golang.org/x/net v0.17.0 github.com/golang/net" # indirect
	"golang.org/x/oauth2 v0.8.0 github.com/golang/oauth2" # indirect
	"golang.org/x/sys v0.13.0 github.com/golang/sys" # indirect
	"golang.org/x/text v0.13.0 github.com/golang/text" # indirect
	"golang.org/x/time v0.3.0 github.com/golang/time" # indirect
	"golang.org/x/tools v0.9.3 github.com/golang/tools" # indirect
	"gomodules.xyz/jsonpatch v2.4.0 github.com/gomodules/jsonpatch" # indirect
	"google.golang.org/appengine v1.6.7 github.com/golang/appengine" # indirect
	"google.golang.org/genproto 0005af68ea54 github.com/googleapis/go-genproto" # indirect
	"google.golang.org/genproto 28d5490b6b19 github.com/googleapis/go-genproto" # indirect
	"gopkg.in/dancannon/gorethink.v3 v3.0.5 github.com/rethinkdb/rethinkdb-go" # indirect
	# "gopkg.in/fatih/pool.v2 v2.0.0 github.com/fatih/pool" # indirect
	"gopkg.in/gorethink/gorethink.v3 v3.0.5 github.com/rethinkdb/rethinkdb-go" # indirect
	"gopkg.in/inf.v0 v0.9.1 github.com/go-inf/inf" # indirect
	"k8s.io/apiextensions-apiserver v0.28.0 github.com/kubernetes/apiextensions-apiserver" # indirect
	"k8s.io/component-base v0.28.1 github.com/kubernetes/component-base" # indirect
	"k8s.io/gengo c0856e24416d github.com/kubernetes/gengo" # indirect
	"sigs.k8s.io/apiserver-network-proxy v0.1.2 github.com/kubernetes-sigs/apiserver-network-proxy" # indirect
	"sigs.k8s.io/json bc3834ca7abd github.com/kubernetes-sigs/json" # indirect
	"sigs.k8s.io/kustomize 6ce0bf390ce3 github.com/kubernetes-sigs/kustomize" # indirect
	"sigs.k8s.io/structured-merge-diff v4.2.3 github.com/kubernetes-sigs/structured-merge-diff/" # indirect
)

# replace (
# 	// Fixes a bug where the apiserver treats
# 	// "/apis/tilt.dev/v1alpha1" and "/apis/tilt.dev/v1alpha1/"
# 	// as different urls
# 	github.com/emicklei/go-restful/v3 => github.com/emicklei/go-restful/v3 v3.9.0

# 	// can remove if/when https://github.com/pkg/browser/pull/30 is merged
# 	github.com/pkg/browser => github.com/tilt-dev/browser v0.0.1

# 	// needed by helm
# 	go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc => go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.35.0
# 	go.opentelemetry.io/otel/metric => go.opentelemetry.io/otel/metric v0.31.0

# 	k8s.io/apimachinery => github.com/tilt-dev/apimachinery v0.28.1-tilt-20230921
# )

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Define your dev environment as code. For microservice apps on Kubernetes"
HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz ${EGO_VENDOR_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md SECURITY.md)  # docs directory

DEPEND="
	>=app-containers/docker-1.13
	>=app-containers/docker-compose-1.23.2
"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.20"

# G="${WORKDIR}/${P}"
# S="${G}/src/${EGO_PN}"

# src_compile() {
# 	local DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
# 	local ldflags=(
# 		-X "main.commit=${GIT_COMMIT}"
# 		-X "main.version=${PV}"
# 		-X "main.date=${DATE}"
# 		-X "main.buildSource=portage"
# 	)

# 	GOPATH="${G}" go build -v -work -x -ldflags "${ldflags[*]}" "${EGO_PN}" || die
# }

# src_install() {
# 	dobin ${PN}
# 	einstalldocs
# }
