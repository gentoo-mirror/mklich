# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_{6,7} python3_{3,4} )

inherit distutils-r1

DESCRIPTION="This package provides cross-platform cross-python shutil.which functionality."
HOMEPAGE="http://pypi.python.org/pypi/whichcraft https://github.com/pydanny/whichcraft"
SRC_URI="https://pypi.python.org/packages/source/w/whichcraft/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="test"

DEPEND="
    dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )"


DOCS=( README.rst )

python_test() {
	py.test || die "Tests fail with ${EPYTHON}"
}
