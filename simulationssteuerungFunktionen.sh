#!/bin/bash

#Funktion zum ueberpruefen, dass keine Zeichen in der Eingabe vorhanden sind, die Eingabe mit c bestaetigt wurde und die Eingabe groesser 0 ist
keineZeichenBestaetigtGroesserNull () {
	if [ ! -n "$(printf '%s\n' "${groesse/ c*/}" | sed 's/[0-9]//g')" ] && [[ "$groesse" =~ " c" ]] && [[ ${groesse/ c*/} -gt 0 ]]; then
		echo ${groesse/ c*/}
	fi
}

#Funktion zum ueberpruefen, dass keine Zeichen vorhanden sind, die Eingabe bestaetigt wurde, aber die Eingabe nicht groesser als 0 ist
keineZeichenBestaetigtNichtGroesserNull () {
	if [ ! -n "$(printf '%s\n' "${groesse/ c*/}" | sed 's/[0-9]//g')" ] && [[ "$groesse" =~ " c" ]] && [[ ! ${groesse/ c*/} -gt 0 ]]; then
		echo 'Die Eingabe ist nicht groesser als 0. Bitte geben Sie erneut eine Groesse ein und bestaetigen sie mit " c".'
	fi
}

#Funktion zum ueberpruefen, dass keine Zeichen vorhanden sind, die Eingabe aber nicht bestaetigt wurde, aber groesser als 0 ist
keineZeichenNichtBestaetigtGroesserNull () {
	if [ ! -n "$(printf '%s\n' "$groesse" | sed 's/[0-9]//g')" ] && [[ ! "$groesse" =~ " c" ]] && [[ $groesse -gt 0 ]]; then
		echo  'Die Eingabe wurde nicht mit c bestaetigt. Bitte geben Sie erneut eine Groesse ein und bestaetigen Sie mit " c".'
	fi
}

#Funktion zum ueberpruefen, dass keine Zeichen vorhanden sind, die Eingabe aber nicht bestaetigt wurde und nicht groesser als 0 ist
keineZeichenNichtBestaetigtNichtGroesserNull () {
	if [ ! -n "$(printf '%s\n' "$groesse" | sed 's/[0-9]//g')" ] && [[ ! "$groesse" =~ " c" ]] && [[ ! $groesse -gt 0 ]]; then
		echo  'Die Eingabe wurde nicht mit c bestaetigt und ist nicht groesser als 0. Bitte geben Sie erneut eine Groesse ein und bestaetigen Sie mit " c".'
	fi
}

#Funktion zum ueberpruefen, dass weitere Zeichen ausser Zahlen enthalten sind, die Eingabe aber bestaetigt wurde
zeichenBestaetigt () {
	if [ -n "$(printf '%s\n' "${groesse/ c*/}" | sed 's/[0-9]//g')" ] && [[ "$groesse" =~ " c" ]]; then
		echo 'Die Eingabe enthaelt noch andere Zeichen ausser Zahlen. Bitte geben Sie erneut eine Groesse ein und bestaetigen Sie mit " c".'
	fi
}

#Funktion zum ueberpruefen, dass weitere Zeichen ausser Zahlen enthalten sind und die Eingabe nicht bestaetigt wurde
zeichenNichtBestaetigt () {
	if [ -n "$(printf '%s\n' "$groesse" | sed 's/[0-9]//g')" ] && [[ ! "$groesse" =~ " c" ]]; then
		echo 'Die Eingabe enthaelt noch andere Zeichen ausser Zahlen und wurde nicht mit c bestaetigt. Bitte geben Sie erneut eine Groesse ein und bestaetigen Sie mit " c".'
	fi
}

#Funktion zum ueberpruefen, dass der eingegebene Name bestaetigt wurde
frageNachNameBestaetigt () {
	if [[ "$name" =~ " c" ]]; then
	echo ${name/ c*/}
	fi
}

#Funktion zum ueberpruefen, dass der eingegebene Name nicht bestaetigt wurde
frageNachNameNichtBestaetigt () {
	if [[ ! "$name" =~ " c" ]]; then
	echo 'Die Eingabe wurde nicht mit c bestaetigt, bitte geben Sie erneut einen Namen ein und bestaetigen Sie mit " c".'
	fi
}
