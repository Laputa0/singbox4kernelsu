#
ASH_STANDALONE=1

MODDIR=${0%/*}
BIN_DIR="${MODDIR}/bin"
CONF_DIR="${MODDIR}/etc"
ASSET_DIR="${MODDIR}/var"

${BIN_DIR}/sing-box -C $CONF_DIR -D $ASSET_DIR run &> ${MODDIR}/log.txt

