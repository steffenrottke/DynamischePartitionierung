#!/bin/bash
function insertWorstFit(){
    save_speicherplatz=$1
    seekName=$2
    seekGroesse=$3
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt

    #echo ">>>Das ist speicherplatz: $speicherplatz ;;; seekName: $seekName ;;; Das ist seekGroesse: $(($seekGroesse))"

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
    platzGroesse=0

    for (( i=0; i<$save_speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
        if [[ -z "${save_speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
            seekCounter=$(($seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
        else
            if [[ $seekCounter -gt 0 ]]; then
                potentialStart[$bereicheStelle]=$(($i-$seekCounter))
                potentialEnd[$bereicheStelle]=$(($i-1))
                bereicheStelle=$(($bereicheStelle+1))
            fi
            seekCounter=0
        fi
    done


    if [[ $seekCounter -gt 0 ]] && [[ $i -eq $save_speicherplatz ]]; then
        potentialStart[$bereicheStelle]=$(($i-$seekCounter))
        potentialEnd[$bereicheStelle]=$(($save_speicherplatz-1))
    fi

    echo "${#potentialStart[*]} Potentialdaten"
    echo "Starts: ${potentialStart[*]}"
    echo " Enden: ${potentialEnd[*]}"

    #groessteDifferenz=$(($save_speicherplatz+1))
    groessteDifferenz=0
    unset groessteDifferenzStelle
    for (( i=0; i<${#potentialStart[*]}; i++ ))
    do
        #for (( y=${potentialEnd[$i]}; y>=${potentialStart[$i]}; y-- ))
        #do
        #    platzGroesse=$(($platzGroesse+1)) #GroesseLeerBereich
        #done
        unset platzGroesse
        platzGroesse=$((${potentialEnd[$i]}-${potentialStart[$i]}+1))
        if [[ $platzGroesse -ge $seekGroesse ]]; then
            differenz=$(($platzGroesse-$seekGroesse)) #Differenz
            if [[ $differenz -gt $groessteDifferenz ]]; then
                groessteDifferenz=$differenz
                groessteDifferenzStelle=${potentialStart[$i]} #StartLeerBereich
            fi
            #break
        fi
    done
    #echo "GDS: $groessteDifferenzStelle"
    #echo "Differenz: $groessteDifferenz"

    saveAt=$(($groessteDifferenzStelle+($differenz/2)))
    #echo "Speichere bei $saveAt"

    counter=0
    for (( y=$saveAt; $counter<$seekGroesse; y++ ))
    do
        save_speicher[$y]=$seekGroesse
        counter=$(($counter+1))
    done
    save_groesse[$saveAt]=$seekGroesse #Größe an der Stelle im Array einfügen
    save_name[$saveAt]=$seekName #Name an der Stelle im Array einfügen
    counter=0


#echo "--------"
echo "Speicher:"
unset $speicherout
for (( i=0; i<$save_speicherplatz; i++ ))
do
    if [[ -z "${save_speicher[$i]}" ]]; then
    speicherout[$i]="X"
    else
    speicherout[$i]=${save_speicher[$i]}
    fi
done
echo "Speicher: ${speicherout[*]}"


    return 1 #Erfolgreich -> Raus    return 0 #Nicht erfolgreich -> Ciao!
}
