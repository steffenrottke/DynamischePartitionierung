#!/bin/bash
function insertWorstFit(){
    save_speicherplatz=$1
    seekName=$2
    seekGroesse=$3
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt

    for i in ${save_groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
        let summe+=$i
    done

    if [[ $(($summe+$(($seekGroesse)))) -gt $save_speicherplatz ]]; then #Wenn die Füllung+neue Zuweisung die Speicherkapazität überschreiten -> Abbrechen
	echo "Der Wert zu $seekName (Größe $(($seekGroesse))) ist zu groß für den verfügbaren Speicherplatz!"
        return 0
    fi

    seekCounter=0 #Counter der die freien Plätze beinhaltet
    bereicheStelle=0 #Index
    unset potentialStart
    unset potentialEnd
    platzGroesse=0 #Speichergröße

    for (( i=0; i<$save_speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
        if [[ -z "${save_speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
            seekCounter=$(($seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
        else
            if [[ $seekCounter -gt 0 ]]; then
                potentialStart[$bereicheStelle]=$(($i-$seekCounter)) #Potenzieller Start
                potentialEnd[$bereicheStelle]=$(($i-1)) #Potenzielles Ende
                bereicheStelle=$(($bereicheStelle+1)) #Index
            fi
            seekCounter=0 #Zurücksetzen
        fi
    done


    if [[ $seekCounter -gt 0 ]] && [[ $i -eq $save_speicherplatz ]]; then
        potentialStart[$bereicheStelle]=$(($i-$seekCounter)) #Potenzieller Start
        potentialEnd[$bereicheStelle]=$(($save_speicherplatz-1)) #Potenzielles Ende
    fi

    groessteDifferenz=-1 #Unmöglicher Startwert
    unset groessteDifferenzStelle
    for (( i=0; i<${#potentialStart[*]}; i++ ))
    do
        unset platzGroesse
        platzGroesse=$((${potentialEnd[$i]}-${potentialStart[$i]}+1)) #Berechnung der Größe des verfügbaren Speicherplatzes
        if [[ $platzGroesse -ge $seekGroesse ]]; then
            differenz=$(($platzGroesse-$seekGroesse)) #Differenz zwischen Speicherplatzgröße und der zu speichernden Größe
            if [[ $differenz -gt $groessteDifferenz ]]; then
                groessteDifferenz=$differenz #Größte Differenz
                groessteDifferenzStelle=${potentialStart[$i]} #Startindex
            fi
        fi
    done

    saveAt=$(($groessteDifferenzStelle+($differenz/2))) #Index für die Mitte des freien Speicherplatzes
    counter=0
    for (( y=$saveAt; $counter<$seekGroesse; y++ ))
    do
        save_speicher[$y]=$seekGroesse #Abspeichern der Größe
        counter=$(($counter+1))
    done
    save_groesse[$saveAt]=$seekGroesse #Größe an der Stelle im Array einfügen
    save_name[$saveAt]=$seekName #Name an der Stelle im Array einfügen
    counter=0
    return 1
}