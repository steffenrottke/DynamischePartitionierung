#!/bin/bash

#Funktion fuer Partitionen zum ueberpruefen, dass keine Zeichen in der Eingabe vorhanden sind, die Eingabe mit c bestaetigt wurde und die Eingabe groesser 0 ist
keineZeichenBestaetigtGroesserNull () {
	if [ ! -n "$(printf '%s\n' "${groesse/ c*/}" | sed 's/[0-9]//g')" ] && [[ "$groesse" =~ " c" ]] && [[ ${groesse/ c*/} -gt 0 ]]; then
		echo ${groesse/ c*/}
	fi
}

#Funktion fuer Partitionen zum ueberpruefen, dass keine Zeichen vorhanden sind, die Eingabe bestaetigt wurde, aber die Eingabe nicht groesser als 0 ist
keineZeichenBestaetigtNichtGroesserNull () {
	if [ ! -n "$(printf '%s\n' "${groesse/ c*/}" | sed 's/[0-9]//g')" ] && [[ "$groesse" =~ " c" ]] && [[ ! ${groesse/ c*/} -gt 0 ]]; then
		echo 'Die Eingabe ist nicht groesser als 0. Bitte geben Sie erneut eine Groesse ein und bestaetigen sie mit " c".'
	fi
}

#Funktion fuer Partitionen zum ueberpruefen, dass keine Zeichen vorhanden sind, die Eingabe aber nicht bestaetigt wurde, aber groesser als 0 ist
keineZeichenNichtBestaetigtGroesserNull () {
	if [ ! -n "$(printf '%s\n' "$groesse" | sed 's/[0-9]//g')" ] && [[ ! "$groesse" =~ " c" ]] && [[ $groesse -gt 0 ]]; then
		echo  'Die Eingabe wurde nicht mit c bestaetigt. Bitte geben Sie erneut eine Groesse ein und bestaetigen Sie mit " c".'
	fi
}

#Funktion fuer Partitionen zum ueberpruefen, dass keine Zeichen vorhanden sind, die Eingabe aber nicht bestaetigt wurde und nicht groesser als 0 ist
keineZeichenNichtBestaetigtNichtGroesserNull () {
	if [ ! -n "$(printf '%s\n' "$groesse" | sed 's/[0-9]//g')" ] && [[ ! "$groesse" =~ " c" ]] && [[ ! $groesse -gt 0 ]]; then
		echo  'Die Eingabe wurde nicht mit c bestaetigt und ist nicht groesser als 0. Bitte geben Sie erneut eine Groesse ein und bestaetigen Sie mit " c".'
	fi
}

#Funktion fuer Partitionen zum ueberpruefen, dass weitere Zeichen ausser Zahlen enthalten sind, die Eingabe aber bestaetigt wurde
zeichenBestaetigt () {
	if [ -n "$(printf '%s\n' "${groesse/ c*/}" | sed 's/[0-9]//g')" ] && [[ "$groesse" =~ " c" ]]; then
		echo 'Die Eingabe enthaelt noch andere Zeichen ausser Zahlen. Bitte geben Sie erneut eine Groesse ein und bestaetigen Sie mit " c".'
	fi
}

#Funktion fuer Partitionen zum ueberpruefen, dass weitere Zeichen ausser Zahlen enthalten sind und die Eingabe nicht bestaetigt wurde
zeichenNichtBestaetigt () {
	if [ -n "$(printf '%s\n' "$groesse" | sed 's/[0-9]//g')" ] && [[ ! "$groesse" =~ " c" ]]; then
		echo 'Die Eingabe enthaelt noch andere Zeichen ausser Zahlen und wurde nicht mit c bestaetigt. Bitte geben Sie erneut eine Groesse ein und bestaetigen Sie mit " c".'
	fi
}

#Funktion fuer Partitionen zum ueberpruefen, dass der eingegebene Name bestaetigt wurde
frageNachNameBestaetigt () {
	if [[ "$name" =~ " c" ]]; then
		echo ${name/ c*/}
	fi
}

#Funktion fuer Partitionen zum ueberpruefen, dass der eingegebene Name nicht bestaetigt wurde
frageNachNameNichtBestaetigt () {
	if [[ ! "$name" =~ " c" ]]; then
		echo 'Die Eingabe wurde nicht mit c bestaetigt, bitte geben Sie erneut einen Namen ein und bestaetigen Sie mit " c".'
	fi
}

#Funktion fuer Gesamtspeicher zum ueberpruefen, dass die eingegebene Groesse groesser null ist und keine Zeichen enthaelt
keineZeichenGroesserNull () {
	if [ ! -n "$(printf '%s\n' "$speichergroesse" | sed 's/[0-9]//g')" ] && [[ $speichergroesse -gt 0 ]]; then
                echo $speichergroesse
	fi
}

#Funktion fuer Gesamtspeicher zum ueberpruefen, dass die eingegebene Groesse nicht groesser null ist und keine Zeichen enthaelt
keineZeichenNichtGroesserNull () {
	if [ ! -n "$(printf '%s\n' "$speichergroesse" | sed 's/[0-9]//g')" ] && [[ ! $speichergroesse -gt 0 ]]; then
                echo 'Die Eingabe ist nicht groesser als 0. Bitte geben Sie erneut eine Groesse ein.'
        fi
}
#Funktion fuer Gesamtspeicher zum ueberpruefen, dass die Eingabe andere Zeichen ausser Zahlen enthaelt
zeichen () {
	if [ -n "$(printf '%s\n' "$speichergroesse" | sed 's/[0-9]//g')" ]; then
                echo 'Die Eingabe enthaelt noch andere Zeichen ausser Zahlen. Bitte geben Sie erneut eine Groesse ein.'
        fi
}

#Funktion fuer Realisierungskonzept zum ueberpruefen, dass die Eingabe kein gueltiges Realisierungskonzept enthaelt
ungueltigesRealisierungskonzept () {
	if ! { [ "$konzept" = "f" ] || [ "$konzept" = "b" ] || [ "$konzept" = "n" ] || [ "$konzept" = "w" ] || [ "$konzept" = "r" ] || [ "$konzept" = "l" ]; }; then
		echo "Die Eingabe enthaelt nicht eins der sechs aufgelisteten Realisierungskonzepte. Bitte waehlen Sie erneut ein Realisierungskonzept aus."
	fi
}

#Funktion fuer Ablauf des Realisierungskonzepts, das ueberprueft, dass kein q eingegeben wurde und daher solange die Simulationssteuerung neu startet, indem die Funktion simulationssteuerung der Datei ./simulationssteuerung.sh wiederholt aufgerufen wird. Dieser wird der Wert befehl uebergeben
ablaufRealisierungskonzept () {
	source ./simulationssteuerung.sh
	if [ ! "$befehl" = "q" ]; then
		simulationssteuerung befehl
	fi
}

#Funktion zum ueberpruefen, welcher Befehl der Simulationssteuerung ausgefuehrt werden soll
abfrageAktion () {
echo ""
echo ""
#Benutzer kann zwischen den Befehlen mit den Shortcuts d,c,n und q auswaehlen
echo "Bitte geben Sie einen Befehl ein. Es stehen diese Befehle zur Verfuegung:
-> d (delete, Partition loeschen)
-> c (create, Partition anlegen)
-> n (new, Speicherbelegeung zuruecksetzen)
-> q (quit, Simulation beenden)"
}

#Funktion, um gesamten Speicher zurueckzusetzen
speicherZuruecksetzen () {
	unset name
	unset groesse
	unset speicher
}
