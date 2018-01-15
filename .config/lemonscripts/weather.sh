#!/usr/bin/bash
Weather() {
  MIN=$(cat $HOME/startpage/weather.json | jq -r '.day_1 .mintemp_c')
  MAX=$(cat $HOME/startpage/weather.json | jq -r '.day_1 .maxtemp_c')
  AVG=$(cat $HOME/startpage/weather.json | jq -r '.day_1 .avgtemp_c')
  TXT=$(cat $HOME/startpage/weather.json | jq -r '.day_1 .condition .text')
  printf "YMIN#%.0f:" "$MIN"
  printf "MAX#%.0f:" "$MAX"
  printf "AVG#%.0f:" "$AVG"
  printf "TXT#$TXT\n"
}

while true; do
  echo "$(Weather)"
  sleep 1;
done

