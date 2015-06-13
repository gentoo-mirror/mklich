# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 python3_{3,4} pypy )

inherit distutils-r1

DESCRIPTION="A command-line utility that creates projects from cookiecutters (project templates)"
HOMEPAGE="http://pypi.python.org/pypi/cookiecutter https://github.com/audreyr/cookiecutter"
SRC_URI="https://github.com/audreyr/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
SLOT="0"
IUSE="doc test"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
        dev-python/pytest[${PYTHON_USEDEP}]
    )"


DOCS=( docs/index.rst )

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	py.test || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( "${S}"/docs/_build/html/. )
	distutils-r1_python_install_all
}
