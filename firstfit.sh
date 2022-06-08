#!/bin/bash


function insertFirstFit(){
    seekName=$1 #der zu speichernde Name des Prozesses
    seekGroesse=$2 #die zu speichernde Groesse des Prozesses
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt

#    summeNeu=0
#    wastedCounter=0
#    secCounter=1
#    for i in ${groesse[@]}
#    do
#	if [[ $i -ne $wastedCounter || $secCounter -eq $i ]]; then
#	    let summeNeu+=$i
#	    secCounter=$((secCounter+1))
#	fi
#	echo "sNeu: $summeNeu"
#	#echo "i: $i"
#    done



    for i in ${groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
	let summe+=$i
    done

    if [[ $((summe+$seekGroesse)) -gt $speicherplatz ]]; then #Wenn die Füllung+neue Zuweisung die Speicherkapazität überschreiten -> Abbrechen
	echo "zu gross bei $seekName $seekGroesse"
	return 0
    fi

    seekCounter=0 #Counter der die freien Plätze beinhaltet
    for (( i=0; i<=$speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
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
		return 1 #Erfolgreich -> Raus
	    fi
	else
	    seekCounter=0
	fi
    done
    return 0 #Nicht erfolgreich -> Ciao!
}
speicherplatz=10 #größe des Speichers
unset name
unset groesse
unset speicher
insertFirstFit "HALLOWELT" 1
insertFirstFit "NEUEWELT" 3
insertFirstFit "3Stelle" 5
#insertFirstFit "META" 5
insertFirstFit "testerrr" 1
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
