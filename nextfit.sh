#!/bin/bash


function insertNextFit(){
    seekName=$1 #der zu speichernde Name des Prozesses
    seekGroesse=$2 #die zu speichernde Groesse des Prozesses
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt

    echo ">>>Das ist seekName: $seekName ;;; Das ist seekGroesse: $seekGroesse"

    for i in ${groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
	let summe+=$i
    done

    if [[ $((summe+$seekGroesse)) -gt $speicherplatz ]]; then #Wenn die Füllung+neue Zuweisung die Speicherkapazität überschreiten -> Abbrechen
	echo "zu gross bei $seekName $seekGroesse"
	return 0
    fi

    seekCounter=0 #Counter der die freien Plätze beinhaltet
    for (( i=$start; i<=$speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
	if [[ -z "${speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
	    seekCounter=$((seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
	    if [[ $seekCounter -ge $seekGroesse ]]; then #Wenn der counter der leeren Plätze größer/gleich der unterzubnrGröße 
		index=$(($i-($seekCounter-1)))
		#groesse[$index]=$seekGroesse #Größe an der Stelle im Array einfügen
		for (( y=$index; y<$((index+$seekGroesse)); y++ ))
		do
		    speicher[$y]=$seekGroesse
		done
		groesse[$index]=$seekGroesse #Größe an der Stelle im Array einfügen
		name[$index]=$seekName #Name an der Stelle im Array einfügen

		if [[ $((i+1)) -le $speicherplatz ]]; then
		    start=$((i+1))
		else
		    start=0
		fi

		return 1 #Erfolgreich -> Raus
	    fi
	else
	    seekCounter=0
	fi
    done
    return 0 #Nicht erfolgreich -> Ciao!
}


#speicherplatz=${array_gesamte_groesse} #größe des Speichers
speicherplatz=10
echo ">>>Speicherplatz: $speicherplatz"
start=0
#unset name
#unset groesse
#unset speicher
insertNextFit "HALLOWELT" 1
insertNextFit "NEUEWELT" 3
insertNextFit "3Stelle" 5
speicher[1]=
speicher[2]=
speicher[3]=
groesse[1]=
name[1]=
insertNextFit "amende" 1
#insertFirstFit "META" 5
#createPartitionsName=${createPartitionsName/ c*/}
#${createPartitionsGroesse/ c*/}
#echo "TEST: $createPartitionsName ;;; $createPartitionsGroesse"
#insertFirstFit ${createPartitionsName/ c*/} ${createPartitionsGroesse/ c*/}
echo "Speicher:"
echo ${speicher[*]}
echo "--------"
echo "--------"
echo "Groesse:"
echo ${groesse[*]}
echo "++++++++"
echo "++++++++"
echo "Name:"
echo ${name[*]}
