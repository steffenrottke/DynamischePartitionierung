#!/bin/bash
function insertBestFit(){
    save_speicherplatz=$1
    seekName=$2
    seekGroesse=$3
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt

    #echo ">>>Das ist speicherplatz: $save_speicherplatz ;;; seekName: $seekName ;;; Das ist seekGroesse: $seekGroesse"

    for i in ${save_groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
	let summe+=$i
    done

    if [[ $(($summe+$(($seekGroesse)))) -gt $save_speicherplatz ]]; then #Wenn die Füllung+neue Zuweisung die Speicherkapazität überschreiten -> Abbrechen
	echo "zu gross bei $seekName $(($seekGroesse))"
	return 0
    fi

    seekCounter=0 #Counter der die freien Plätze beinhaltet
    bereicheStelle=0
    unset potentialStart
    unset potentialEnd

    for (( i=0; i<$save_speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
        if [[ -z "${save_speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
            seekCounter=$(($seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
        else
	    seekCounter=0
        fi
    done

    if [[ $seekCounter -gt 0 ]] && [[ $i -eq $save_speicherplatz ]]; then
	potentialStart+=$(($i-$seekCounter))
	potentialEnd+=$save_speicherplatz
    fi

    kleinsteDifferenz=$(($save_speicherplatz+1))
    for (( i=0; i<${#potentialStart}; i++ ))
    do
	#echo "pE: ${potentialEnd[$i]} ;;; pS: ${potentialStart[$i]}"
	for (( y=${potentialEnd[$i]}; y>=${potentialStart[$i]}; y-- ))
	do
	    platzGroesse=$(($platzGroesse+1))
	done
	if [[ $platzGroesse -ge $seekGroesse ]]; then
	    differenz=$(($platzGroesse-seekGroesse))
	    if [[ $differenz -lt $kleinsteDifferenz ]]; then
		kleinsteDifferenz=$differenz
		kleinsteDifferenzStelle=${potentialStart[$i]}
		platzGroesse=0
	    fi
	fi
    done

    counter=0
    for (( y=$kleinsteDifferenzStelle; $counter<$(($seekGroesse)); y++ ))
    do
        save_speicher[$y]=$(($seekGroesse))
	counter=$((counter+1))
    done
    save_groesse[$kleinsteDifferenzStelle]=$(($seekGroesse)) #Größe an der Stelle im Array einfügen
    save_name[$kleinsteDifferenzStelle]=$seekName #Name an der Stelle im Array einfügen
    counter=0



#    echo "--------"
#    echo "Speicher:"
#    unset $speicherout
#    for (( i=0; i<$save_speicherplatz; i++ ))
#    do
#        if [[ -z "${save_speicher[$i]}" ]]; then
#        $speicherout[$i]="X"
#        else
#        $speicherout[$i]=${save_speicher[$i]}
#        fi
#    done
    return 1 #Erfolgreich -> Raus
}