# update all rule sets
ruleset_links=(
'https://raw.githubusercontent.com/SagerNet/sing-geoip/rule-set/geoip-cn.srs'
'https://raw.githubusercontent.com/Loyalsoldier/geoip/release/srs/telegram.srs'
'https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-cn.srs'
'https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-geolocation-!cn.srs'
'https://raw.githubusercontent.com/SagerNet/sing-geoip/rule-set/geoip-ad.srs'
'https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-adblockplus.srs'
'https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-google.srs'
'https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-openai.srs'
'https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-youtube.srs'
'https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-microsoft.srs'
'https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-telegram.srs'
)

for rule_link in ${ruleset_links[@]}; do
    curl -4 -O $rule_link
done
