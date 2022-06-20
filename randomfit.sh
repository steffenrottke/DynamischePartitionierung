#!/bin/bash
function insertRandomFit(){
    save_speicherplatz=$1
    seekName=$2 #der zu speichernde Name des Prozesses
    seekGroesse=$3 #die zu speichernde Groesse des Prozesses
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt
    unset bereiche

    #echo ">>>Das ist seekName: $seekName ;;; Das ist seekGroesse: $(($seekGroesse))"

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
    for (( i=0; i<$save_speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
        if [[ -z "${save_speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
            seekCounter=$(($seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
            if [[ $seekCounter -ge $seekGroesse ]]; then #Wenn der counter der leeren Plätze größer/gleich der unterzubnrGröße 
        	    #Freier Bereich gefunden -> Abspeichern
        	    bereiche[$bereicheStelle]=$(($i-($seekCounter-1))) #Start vom freien Bereich
        	    bereicheStelle=$((bereicheStelle+1)) #Bereiche-Array+1
        	    seekCounter=$((seekCounter-1))
            fi
        else
            seekCounter=0
        fi
    done
    bbereiche=${#bereiche[@]}
    if [[ $bbereiche -ne 0 ]]; then
        iindex=$(($RANDOM % $bbereiche))
        startAt=${bereiche[$iindex]}
        counter=0
    for (( y=$startAt; $counter<$seekGroesse; y++ ))
    do
        save_speicher[$y]=$seekGroesse
        counter=$((counter+1))
    done
    save_groesse[$startAt]=$seekGroesse #Größe an der Stelle im Array einfügen
    save_name[$startAt]=$seekName #Name an der Stelle im Array einfügen
    counter=0
    fi


#echo "Speicher:"
#unset $speicherout
#for (( i=0; i<$save_speicherplatz; i++ ))
#do
#    if [[ -z "${save_speicher[$i]}" ]]; then
#    $speicherout[$i]="X"
#    else
#    $speicherout[$i]=${save_speicher[$i]}
#    fi
#done

    return 1 #Erfolgreich -> Raus
}