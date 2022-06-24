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
    bereicheStelle=0 #Index
    unset potentialStart
    unset potentialEnd

    for (( i=0; i<$save_speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
        if [[ -z "${save_speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
            seekCounter=$(($seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
        else
            if [[ $seekCounter -gt 0 ]]; then
                potentialStart[$bereicheStelle]=$(($i-$seekCounter)) #Start - Wenn der jetzige Platz belegt ist, aber der Counter bereits erhöht wurde
                potentialEnd[$bereicheStelle]=$(($i-1)) #Ende - Wenn der jetzige Platz belegt ist, aber der Counter bereits erhöht wurde
                bereicheStelle=$(($bereicheStelle+1)) #Index
            fi
	    seekCounter=0 #Counter zurücksetzen
        fi
    done

    if [[ $seekCounter -gt 0 ]] && [[ $i -eq $save_speicherplatz ]]; then #Counter wurde nicht zurückgesetzt und der Index gleicht der Speichergröße
	potentialStart[$bereicheStelle]=$(($i-$seekCounter)) #Berechnung Start
	potentialEnd[$bereicheStelle]=$save_speicherplatz #Berechnung Ende
    fi

    kleinsteDifferenz=$(($save_speicherplatz+1)) #Auf einen unmöglichen Wert setzen
    for (( i=0; i<${#potentialStart[*]}; i++ ))
    do
	for (( y=${potentialEnd[$i]}; y>=${potentialStart[$i]}; y-- ))
	do
	    platzGroesse=$(($platzGroesse+1)) #Berechnung der verfügbaren Größe
	done
	if [[ $platzGroesse -ge $seekGroesse ]]; then
	    differenz=$(($platzGroesse-seekGroesse)) #Differenz zwischen verfügbarer Größe und der zu speichernden Größe
	    if [[ $differenz -lt $kleinsteDifferenz ]]; then #Beim Erstaufruf immer legitim, da vorher unmöglich
		kleinsteDifferenz=$differenz #Abspeichern der Differenz
		kleinsteDifferenzStelle=${potentialStart[$i]} #Start-Stelle notieren
		platzGroesse=0 #Reset der verfügbaren Größe
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
    return 1
}