# KN03: IaaS – Virtuelle Server  

## Einleitung  
In dieser Aufgabe habe ich meine ersten Schritte mit IaaS gemacht.  
Ich habe gelernt, wie ich auf einer virtuellen Instanz (Ubuntu) einen Webserver und eine Datenbank installiere.  
Am Schluss konnte ich mit Apache, PHP und MariaDB eine kleine Testumgebung aufbauen und sie über den Browser testen.  

---

## Schritte  

### 1. Pakete aktualisieren  
```bash
sudo apt update
```
Damit habe ich die Paketliste auf den neusten Stand gebracht.

2. Apache installieren
```bash
sudo apt install apache2
```
Damit habe ich den Webserver Apache installiert.


3. PHP installieren
```bash
sudo apt install php
sudo apt install libapache2-mod-php
```
Damit konnte Apache auch mit PHP arbeiten.


4. MariaDB installieren
```bash
sudo apt install mariadb-server
sudo apt install php-mysqli
```
So habe ich die Datenbank und die PHP-Anbindung für SQL-Abfragen installiert.

5. Benutzer anlegen
```bash
sudo mysql -sfu root -e "GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'MeinPasswort123' WITH GRANT OPTION;"
```
Damit habe ich den Benutzer admin erstellt.

6. Services neu starten
```bash
sudo systemctl restart mariadb.service
sudo systemctl restart apache2
```
So habe ich die beiden Server neu gestartet.

7. Git-Repo klonen
```bash
cd ~
git clone https://gitlab.com/ch-tbz-it/Stud/m346/m346scripts.git
```
Danach habe ich im Ordner KN03 die Dateien geprüft.

8. PHP-Dateien kopieren
```bash
sudo cp ./m346scripts/KN03/*.php /var/www/html/
```
Die Testdateien habe ich ins Webserver-Verzeichnis kopiert.

9. Sicherheitsgruppe anpassen
Ich habe in AWS die Regeln bearbeitet und Port 22 (SSH) und Port 80 (HTTP) freigegeben.

10. Webseiten testen
Apache: http://[IP]/index.html

PHP: http://[IP]/info.php

Datenbank: http://[IP]/db.php

11. MySQL-Konsole
```bash
mysql -u admin -p
```
Mit dem Benutzer admin habe ich mich eingeloggt und die gleiche Abfrage wie in db.php gemacht.

Erklärung SQL-Abfrage
Die SQL-Abfrage zeigt die Benutzer in MariaDB, die in der Datenbank existieren.
So konnte ich sehen, ob mein neuer Benutzer korrekt erstellt wurde.

Checkpoints
Ich weiss, wieso man sudo braucht (Adminrechte).

Ich kann mit apt Programme installieren.

Ich kenne die Rollen von apache2, php, mariadb-server.

Ich weiss, warum libapache2-mod-php und php-mysqli gebraucht werden.

Ich kann in der Sicherheitsgruppe Ports anpassen.

Ich weiss, was ein Port ist.

Ich habe die mysql Konsole genutzt.

Ich kenne den Befehl systemctl.

Ich kann mit cp Dateien kopieren.

Fazit
Am Ende habe ich eine funktionierende Umgebung mit Apache, PHP und MariaDB aufgebaut.
Die Webseiten index.html, info.php und db.php haben funktioniert und gezeigt, dass Webserver, PHP und Datenbank richtig laufen.