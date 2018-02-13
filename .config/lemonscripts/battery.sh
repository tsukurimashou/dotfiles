#!/usr/bin/bash

Battery() {
	BATCOUNT=$(acpi --battery | wc -l)
    OUTPUT=""
    for ((i=0;i<$BATCOUNT;i++)) {
        NUM=$(($i+1))
        BATPERC=$(acpi --battery | cut -d, -f2 | cut -d% -f1 | cut -d" " -f2 | sed -n "$NUM p")
        BATSTATUS=$(acpi --battery | cut -d, -f1 | cut -d: -f2 | cut -d" " -f2 | sed -n "$NUM p")

        if [ "$BATSTATUS" == "Full" ]; then
            BATICON="";
        elif [ "$BATSTATUS" == "Discharging" ]; then
            if [ "$BATPERC" -ge 75 ]; then
                BATICON="";
            elif [ "$BATPERC" -ge 50 ]; then
                BATICON="";
            elif [ "$BATPERC" -ge 25 ]; then
                BATICON="";
            else
                BATICON="";
            fi
        elif [ "$BATSTATUS" == "Unknown" ]; then
            BATICON="";
        elif [ "$BATSTATUS" == "Charging" ]; then
            BATICON=""
        else
		    BATICON="?";
	    fi
	    if ["$BATCOUNT" -eq "1" ]; then
        OUTPUT="BAT $BATPERC% ";
      else
        OUTPUT+="BAT$i $BATPERC% ";
      fi
    }
    echo $OUTPUT
}

while true; do
	echo "B$(Battery)"
	sleep 1;
done
