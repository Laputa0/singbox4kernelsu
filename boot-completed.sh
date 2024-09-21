ASH_STANDALONE=1
set -x

MODDIR=${0%/*}
BIN_DIR="${MODDIR}/bin"
RUN_DIR="${MODDIR}/run"
LOG_DIR="${MODDIR}/logs"
CONF_DIR="${MODDIR}/etc"
RULES_DIR="${MODDIR}/rulesets"

# modify rulesets path
rule_sets_file=$CONF_DIR/rulesets.json
cat $rule_sets_file | grep RULE_SETS_PATH
if [[ $? -eq 0 ]]; then
    sed -i "s#RULE_SETS_PATH#${RULES_DIR}#g" $rule_sets_file
fi
# modify sing-box log path
box_log_file=$CONF_DIR/log.json
cat $box_log_file | grep BOX_LOG_PATH
if [[ $? -eq 0 ]]; then
    sed -i "s#BOX_LOG_PATH#${LOG_DIR}/sing-box.log#g" $box_log_file
fi


while true; do
sleep 5
date
pidof sing-box
service_status=$?
if [[ ! -e "${MODDIR}/disable" ]] && [[ $service_status -ne 0 ]]; then
    $BIN_DIR/sing-box -C $CONF_DIR -D $RUN_DIR run &
elif [[ -e "${MODDIR}/disable" ]] && [[ $service_status -eq 0 ]]; then
    (pkill sing-box && date) &> $LOG_DIR/pkill.log
fi
done &> $LOG_DIR/loop.log
