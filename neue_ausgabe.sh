#!/bin/bash
function neue_ausgabe(){

# Dieser Teil war ursprünglich Bestandteil einer vorherigen Version des Realisieungskonzeptes bestfit (Dieses stand mir am 23.06 zur Verfügung) 
# und wurde in der finalen Version (vom 24.06.22) vom Entwickler wieder entfernt.
# Hiermit wurde der 2. Programmmentwurf der visuellen Ausgabe umgesetzt, da das urspruengliche Array "groesse" nicht, wie vereinbart die notwendigen Daten enthalten hatte.
# 
# Die notwendigen Daten für die Ermittlung der Gesamtspeichergroesse werden jetzt aus save_speicherplatz entnommen. Die tatsächliche Belegung wird aus dem Array save_speicher gezogen.
    echo "Speicher:"
    unset speicherout
    for (( i=0; i<$save_speicherplatz; i++ ))
    do
        if [[ -z "${save_speicher[$i]}" ]]; then
        speicherout[$i]="X"
        else
        speicherout[$i]=${save_speicher[$i]}
        fi
    done
# nachfolgend Auflistung weiterer uebernommener Parameter:
# seekGroesse: Uebergabe Parameter, Groesse der Partition
# summe: Summe der belegten Speicherbloecke
# Da die Werte bereits in der vorauslaufenden Funktion vorhanden sind werden diese hier fuer die weitere Berechnung uebernommen und zur spaeteren Bildschirmausgabe vorbereitet.
belegterSpeicher=$(expr $summe + $seekGroesse)

# Anhand der vorliegenden Speicherbelegung und Speichergroesse kann der Grad der Speicherbelegung berechnet werden und wird fuer die spaetere Bildschirmausgabe vorbereitet.
belegterSpeicherProzent=$(awk -v "a=$belegterSpeicher" -v "b=$save_speicherplatz" 'BEGIN {printf "%.0f\n", ((a/b)*100)}')

# Die Speicherbelegung wird an die Variable "elements" uebergeben um eine uebersichtliche Darstellung in den Schleifen zu gewaehrleisten
# Speicherout enthält ebenfalls nochmal den zur Verfuegung stehenden Speicherplatz des Systems.
elements=${#speicherout[@]}
# save_name: Die Menge der enthaltenen Partitionsnamen wird an die Variable partitions uebergeben, da diese wiederholt im weiteren Verlauf genutzt wird und die Programmierung übersichtlicher gestaltet.
partitions=${#save_name[@]}

# In save_groesse wird anhand aller enthaltenen Elemente ermittelt, wie gross die am groessten enthaltene Partition ist und das Ergebnis an die Variable max uebergeben.
## berechne groesster Block ##
max=0
for pos in ${save_groesse[*]}
do
  if [ $pos -gt $max ]
  then
    max=$pos
  fi
done

#In save_groesse wird anhand aller enthaltenen Elemente ermittelt, wie gross die am kleinsten enthaltene Partition ist und das Ergebnis an die Variable min uebergeben.
## berechne kleinster Block ##
#min=${save_groesse[0]}
# Wegen ungesetzen Werten in ${save_groesse[0]} kam es zu mehreren Fehlern bei bestimmten Realisierungskonzepten.
# So wurde z.B. [./neue_ausgabe.sh: line 147: [: 22: unary operator expected ] ausgegeben. Daher wurde der Intialwert auf "MAX INT" gesetzt.
min=2147483647
for pos in ${save_groesse[*]}
do
  if [ $pos -lt $min ]
  then
    min=$pos
  fi
done
# Wird keine Partition gefunden, wird der Wert auf "0" gesetzt.
if [ $min -eq 2147483647 ]; then min=0; fi

# Im Arrays speicherout sind die einzelnen Speicherplaetze, wenn sie belegt sind als Ziffern (int), oder wenn sie nicht belegt sind als X (char) dargestellt.
# Diese werden dann in der Gesamheit gezaehlt und an anzahlBloecke und freieBloecke uebergeben.
anzahlBloecke=0
freieBloecke=0
for (( i=0; i<$elements; i++ ))
do
  pos=${speicherout[$i]}
  if [ $pos != "X" ]
  then
    anzahlBloecke=$(expr $anzahlBloecke + 1 )
  else
    freieBloecke=$(expr $freieBloecke + 1)
  fi
done

############# Ermittlung - Grad der externen Fragmentierung  ############
## berechne groessten freien Block ##
# Um die externe Fragmentierung berechnen zu koennen muss ermittelt werden, welcher der groesste freie Block innerhalbn der Speicherbelegung ist.
# In der Variable tempmax_fB wird jeder gefundene Bereich hochgezaehlt und beim Erreichen einer neuen Partition gegen den Startwert 0 
# oder gegen eine bisher ermittelte max groesse verglichen.
max_fB=0		# Groesster freier Wert innerhalb der Speicherbelegung
tempmax_fB=0	# Hier wird der Wert einer Luecke hochgezaehlt 
for (( i=0; i<$elements; i++ ))
	do
	pos=${speicherout[$i]}
	if [ $pos = "X" ]
	then
	tempmax_fB=$(expr $tempmax_fB + 1)
	fi
	if [ $pos != "X" ] && [ $tempmax_fB -ge $max_fB ]
	then
 	max_fB=$tempmax_fB
	tempmax_fB=0
	fi
	
done
#----------------------------------------------------------------------------
# Hier wird der letzte gezaehlte Block am Ende des Speicherbelegung 
# gegen die bisher ermittlte groesste Luecke (max_fB) abgeglichen, 
# da dort die Bedingung für die Erfuellug der for-Schleife nicht mehr abgefragt werden kann.
	if [ $tempmax_fB -ge $max_fB ]
	then
 	groessterfreierBlock=$tempmax_fB
	else
 	groessterfreierBlock=$max_fB
	fi
	
# Hier erfolgt die Berechnung der externen Fragmentierung und wird fuer die spaetere Bildschirmausgabe vorbereitet.

	GradexternenFragmentierung_awk=$(awk -v "a=$freieBloecke" -v "b=$groessterfreierBlock" 'BEGIN {printf "%.0f\n", (((a-b)/a)*100)}')

# Erstellung der Variablen für die Farbausgabe der Speicherbelegung:
# weiss
c1="\e[30;107m"
# blau
c2="\e[97;44m"
# rot
c3="\e[97;41m"
# gruen
c4="\e[30;42m"
# default
c0="\e[0m"

# Fuer die farbliche Darstellung des Speichersystems wird das Array farbe genutzt. 
# Dort kann jeder belegte oder unbelegte Speicherplatz mit den dazugehoerigen Farbinformationen abgespeichert werden.
# Um die Inhalte des Arrays speicherout bezueglich ihrer Farbzugehoerigkeit "Blockgroesse" 
# und der dazugehoerigen Farbe zu qualifizieren, wird eine Speichereinheit als + eingefuegt und dieser der notwendige Farbdarstellungs- 
# Paramenter vorangestellt. 
unset farbe
# Der im Array speicherout enthaltene Wert wird nachfolgend gegen die ermittelten maximal($max), minimal($min) Werte verglichen.
# Je nachdem welche Bedingung erfuellt ist, wird diesem dann ein Farbwert zugeordnet.

for (( i=0; i<$elements; i++ ))
do
  pos=${speicherout[$i]}
  if [ $pos == "X" ]
  then
    farbe[$i]=$( echo -e $c1"+" )
  else
    if [ $pos -eq $max ] &&  [ $pos -ne $min ]
    then
      farbe[$i]=$( echo -e $c3"+" )
    fi
    if [ $pos -eq $min ] && [ $pos -ne $max ]
    then
      farbe[$i]=$( echo -e $c4"+" )
    fi
    if [ $pos -eq $min ] && [ $pos -eq $max ]
    then
      farbe[$i]=$( echo -e $c2"+" )
    fi
    if [ $pos -ne $max ] && [ $pos -ne $min ]
    then
      farbe[$i]=$( echo -e $c2"+" )
    fi
  fi
done
# Der komplette entstandene String wird dann dem Array zugewiesen.
# Durch die Mitgabe der -e option im echo Ausgabebefehl wird das Parsen der Escape-Sequenzen im String bei der Bildschirmausgabe aktiviert.
farbe[$elements]=$( echo -e $c0 )

clear

echo "======================================================="
echo " Visuelle Darstellung der Speicherbelegung" "[ $save_speicherplatz ]"
echo "======================================================="
echo 
# Hier wird jetzt das Array farbe im Bildschirm ausgegeben.
echo ${farbe[*]}
echo
# Ausgabe der Legende
echo -e $c1"freie Bloecke"$c0" "$c2"belegte Bloecke"$c0" "$c3"groesste belegte Bloecke"$c0" "$c4"kleinste belegte Bloecke"$c0
echo
# Ab hier beginnt die Ausgabe der Partitionen als Liste. 
# Im Array save_name wird geprueft ob dort ein Partitionsname angegeben ist. 
# Wenn dies der Fall ist, wird dieser ausgegeben und im Array speicherout die dazugehoerige groesse abgefragt und ausgeben.
echo " Anzahl Partitions: $partitions"
echo
echo " Name   -   Groesse "
echo "---------------------------------------------------------------"

for (( i=0; i<$save_speicherplatz; i++ ))
do
  if [ "${save_name[$i]}" != "" ]
  then
    echo " ${save_name[$i]}   -     ${speicherout[$i]}"
  fi
done

echo
echo "---------------------------------------------------------------"
echo " Gesamter zur Verfuegung stehender Speicher    :" $save_speicherplatz
echo " Summe des belegten Speichers                  :" $belegterSpeicher
echo " belegter Speicher in Prozent                  :" $belegterSpeicherProzent" %"
echo " Grad der externen Fragmentierung              :" $GradexternenFragmentierung_awk" %"
echo " Gesamtzahl der belegten Bloecke im Adressraum :" $anzahlBloecke
echo " Gesamtzahl der freien Bloecke im Adressraum   :" $freieBloecke
echo " groesster Block                               :" $max
echo " kleinster Block                               :" $min
echo "---------------------------------------------------------------"
echo
echo "###############################################################################"
echo

}