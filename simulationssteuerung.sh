#!/bin/bash
#Die im folgenden Teil verwendeten Dateien werden als Quellen definiert
source ./simulationssteuerungFunktionen.sh
source ./unsetElement.sh

#Funktion fuer Steuerung des Simulators bei der Eingabe von c,d oder n
simulationssteuerung () {
       #Das case-Statement ueberprueft, welcher Befehl ausgefuehrt werden soll
       case  "$befehl" in
       "c")
                #Wenn der Befehl create entspricht, wird nun die Abfrage nach dem Namen und anschliessend nach der Groesse gestartet
                #Die Variablen createPartitionsName und createPartitionsGroesse speichern den Namen bzw. die jeweilige Groesse bis zu dem eingegebenen c
                echo 'Bitte geben Sie einen Namen für die Partition ein und bestaetigen Sie mit: " c".'
			read -r name
				#Nachdem der Name eingelesen wurde wird ueberprueft, ob die Einagbe mit einem c bestaetigt wurde oder nicht
				#Wenn nicht, wird solange nach dem Namen gefragt, bis mit c bestaetigt wurde
				#Die Funktionen zur Ueberpruefung befinden sich in simulationssteuerungFunktionen.sh
					while [[ ! "$name" =~ " c" ]]
					do
						frageNachNameNichtBestaetigt name
						read -r name
					done
					createPartitionsName=$(frageNachNameBestaetigt)
					#Die Funktion pruefenAufGleichenNamen ueberprueft, dass eine erstellte Partition nicht den gleichen Namen hat wie eine bereits erstellte
					pruefenAufGleichenNamen $(frageNachNameBestaetigt)
                echo 'Bitte geben Sie eine Groesse für die Partition ein und bestaetigen Sie mit: " c".'
                        	read -r groesse
				#Nachdem die Groesse eingelesen wurde wird ueberprueft, ob die Eingabe mit einem c bestaetigt wurde oder nicht und ob es sich um eine Zahl groesser 0 handelt, die eingegeben wurde
				#Wenn nicht, wird solange nach der Groesse gefragt, bis mit c bestaetigt wurde und die Eingabe nur Zahlen groesser 0 enthaelt
				#Die Funktionen zur Ueberpruefung befinden sich in simulationssteuerungFunktionen.sh
					while [ -n "$(printf '%s\n' "${groesse/ c*/}" | sed 's/[0-9]//g')" ] || [[ ! "$groesse" =~ " c" ]] || [[ ! ${groesse/ c*/} -gt 0 ]]
					do
						zeichenBestaetigt groesse
						zeichenNichtBestaetigt groesse
						keineZeichenBestaetigtNichtGroesserNull groesse
						keineZeichenBestaetigtGroesserNull groesse
						keineZeichenNichtBestaetigtNichtGroesserNull groesse
						keineZeichenNichtBestaetigtGroesserNull groesse
						read -r groesse
					done
				createPartitionsGroesse=$(keineZeichenBestaetigtGroesserNull)
                echo "Der eingegebene Name für die Partition ist: $createPartitionsName und die gewaehlte Groesse ist: $createPartitionsGroesse."
                #Die Speicherbelegung wird nun ausgegeben
                echo "Die Speicherbelegung sieht wie folgt aus: "
                #Visuelle Ausgabe des Speichers und die Informationen zur Speicherbelegung
		./ausgabetest.sh
		;;
	#Wenn der Befehl delete gewaehlt wurde, wird nun gefragt, wie der zu loeschende Partitionsname ist
	"d")
                echo 'Bitte geben Sie den Namen der zu loeschenden Partition ein und bestaetigen Sie mit " c".'
                #Die Variable deletePartitionsName speichert den Namen bis zu dem eingegebenen c
                        read -r name
			#Nachdem der Name eingelesen wurde, wird geprueft, ob mit c bestaetigt wurde oder nicht
			#Wenn nicht, wird solange nach dem Namen gefragt, bis mit c bestaetigt wurde
			#Die Funktionen zur Ueberpruefung befinden sich in simulationssteuerungFunktionen.sh
				while [[ ! "$name" =~ " c" ]]
				do
					frageNachNameNichtBestaetigt name
					read -r name
				done
			deletePartitionsName=$(frageNachNameBestaetigt)
                echo "Die ausgewaehlte Partition ist: $deletePartitionsName."
		#Die Datei unsetElement wird aufgruefen, die wiederum die Funktion unsetElement beinhaltet, die fuer das Loeschen einer Partition zustaendig ist und den Namen, den Speicher und die Groesse uebergeben bekommt
		unsetElement "$deletePartitionsName" save_speicher save_groesse
                #Ausgabe der Speicherbelegung
                echo "Die Speicherbelegung sieht wie folgt aus: "
                #Visuelle Ausgabe des Speichers und die Informationen zur Speicherbelegung
		./ausgabetest.sh
		;;
	#Wenn der Befehl new gewaehlt wurde, wird nun ausgegeben, dass die Speicherbelegung zurueckgesetzt wurde und die jetzige Speicherbelegung wird ausgegeben
        "n")
		#Die Datei simulationssteuerungFunktionen wird aufgerufen, um auf die Funktion speicherZuruecksetzen zuzugreifen, die die derzeitigen Namen, die Groessen und den Speicher uebergeben bekommt und alle bisher erstellten Partitionen loescht und somit den Speicher auf seine urspruengliche Groesse zuruecksetzt
		speicherZuruecksetzen save_name save_groesse save_speicher
		#Ausgabe der Speicherbelegung
                echo "Die Speicherbelegung wurde zurueckgesetzt. Sie sieht jetzt wie folgt aus: "
		#Visuelle Ausgabe des Speichers und die Informationen zur Speicherbelegung
		./ausgabetest.sh
		;;
	#Wenn keiner der drei vorherigen Befehle eingegeben wurde, wird eine Fehlermeldung ausgegeben und die derzeitige Speicherbelegung
        *)
                echo "Es wurde ein ungueltiger Befehl eingegeben."
                echo "Die Speicherbelegung sieht wie folgt aus: "
                #Visuelle Ausgabe des Speichers und die Informationen zur Speicherbelegung
		./ausgabetest.sh
		;;
        esac
}
