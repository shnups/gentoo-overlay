# Copyright-1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Simple clipboard manager to be integrated with rofi"
HOMEPAGE="https://github.com/erebe/greenclip"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
# RESTRICT="mirror"
# DOCS=(LICENSE README.md changelog)

    # base >= 4 && < 5
    # bytestring
    # directory
    # protolude
    # unix
    # wordexp

RDEPEND="dev-haskell/exceptions:=[profile?]
    dev-haskell/text:=[profile?]
    dev-haskell/vector:=[profile?]
    dev-haskell/hashable:=[profile?]
    dev-haskell/binary:=[profile?]
    dev-haskell/microlens:=[profile?]
    dev-haskell/microlens-mtl:=[profile?]
    >=dev-haskell/X11-1.6:=[profile?]
    >=dev-lang/ghc-8.0.1:=
"
DEPEND="${RDEPEND}
    >=dev-haskell/cabal-1.10
"

src_prepare() {
    # default
	# cabal_chdeps \
	# 	'base                  >=4.0       && <5.0' 'base                  >=4.0'
        # 'base                  >=4.7       && <4.11' 'base                  >=4.7' \
		# 'base-compat           >=0.9.1     && <0.10' 'base-compat           >=0.9.1' \
		# 'exceptions            >=0.8.0.2   && <0.9' 'exceptions            >=0.8.0.2' \
		# 'aeson                 >=0.7.0.6   && <1.3' 'aeson                 >=0.7.0.6' \
		# 'http-types            >=0.8.6     && <0.11' 'http-types            >=0.8.6' \
		# 'transformers-compat   >=0.4.0.3   && <0.6' 'transformers-compat   >=0.4.0.3'

    # cabal_chdeps 'base >=4.0 && <5.0' 'base >=4.0'
	cabal-mksetup
    eapply_user
}

# Notes
# greenclip is dev and built with stack (https://docs.haskellstack.org/en/stable/README/)
# In portage, an ebuild class is only available for haskell when using cabal
# Making this ebuild work might end up being a major workload / difficult
