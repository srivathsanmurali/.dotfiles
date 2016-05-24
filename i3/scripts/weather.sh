#!/usr/bin/env bash

################################
# Shows info about the weather (in Cincinnati) from accuweather.com
#
# TODO: completely rewrite, probably using openweather APIs
# TODO: make location configurable
# TODO: make temperature unit configurable
#
# @return {Number(degrees Fahrenheit)}: Current temperature in Cincinnati
################################

dir=$(dirname $0)
source $dir/util.sh

full=""
short=""
status=0

URL='http://www.accuweather.com/en/ch/zurich/316622/weather-forecast/316622'
SITE="$(curl -s "$URL")"

weather="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $14 }'| head -1)"
temp="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12 }'| head -1)"

if [[ $weather == *thunder* || $weather == *Thunder* ]]; then
    icon=""
else
    if [[ $weather == *rain* || $weather == *Rain* ]]; then
        icon=""
    else
        if [[ $weather == *cloud* || $weather == *Cloud* ]]; then
            icon=""
        else
            icon=""
        fi
    fi
fi

full="$icon $temp°"
short="$temp°"

echo $full
echo $short
exit $status
