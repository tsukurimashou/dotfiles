#!/bin/bash
API_KEY="6510b92495fd472ca30155709172803";

get_location() {
	URL="http://ip-api.com/json";
	CITY=$(curl -s $URL | jq -r '.city');
	echo "$CITY";
}

LOCATION="$(get_location)"

get_current_weather() {
	NOW=$(date +%s)
    URL="https://api.apixu.com/v1/forecast.json?key=$API_KEY&q=$1&days=2"
	RESULT=$(curl -s $URL | jq -r '.forecast.forecastday[0].day, .forecast.forecastday[1].day');
	echo "$RESULT"
    echo -e "{\n  \"time\": $NOW\n}"
}

get_current_weather $LOCATION
