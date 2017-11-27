# This hook is neccesary for automatic updating of the cfg-update index, please do not modify it!
pre_pkg_setup() {
	[[ $ROOT = / ]] && cfg-update --index
}


source /etc/portage/portage-hooks


if [[ ${FEATURES} == *ccache* && ${EBUILD_PHASE_FUNC} == src_* ]]; then
        export CCACHE_DIR="/data/ccache/${PN}/${SLOT}"
	export CCACHE_COMPRESS=1
        mkdir -p "${CCACHE_DIR}" || die
fi
