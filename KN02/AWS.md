KN02 – IaaS: Virtuelle Server (AWS EC2)

Ziel: EC2 Instanz (Ubuntu 24.04, t2.micro) im AWS Academy Learner Lab aufsetzen, SSH-Zugriff mit Keypairs nachweisen und die geforderten Abgaben bereitstellen.


A) AWS Academy Learner Lab starten (20 %)

Einladung annehmen

E-Mail „Course Invitation“ öffnen, Registrierungsfluss für AWS Academy Learner Lab abschliessen.


Umgebung starten

Im Learner Lab auf Start/Resume klicken.

Warte bis der Status gruen ist, dann auf den AWS-Link klicken, um die AWS Konsole zu oeffnen.

Budget-Anzeige und Session-Timer (max. 4 h) im Blick behalten.

![](<Screenshot 2025-08-26 090753.png>)

B) EC2 Instanz erstellen (40 %)

Parameter: Name frei (z. B. KN02), Ubuntu 24.04, t2.micro, Key-Pair: zwei neue Keys erstellen (vorname1, vorname2), auswählen: vorname1.

EC2 oeffnen: In der AWS Konsole zu EC2 → Instances → Launch instances.

Name: KN02 

AMI / OS Image: Ubuntu Server 24.04 LTS waehlen.

Instance type: t2.micro (1 vCPU, 1 GiB RAM).

Key pair:

Create new key pair → Name vorname1, Typ RSA, Format .pem → Create key pair (Datei wird geladen).

Create new key pair → Name vorname2, gleiches Vorgehen (zweiter Key).

Für den Start der Instanz: vorname1 auswaehlen.

Network/Security: Standard-Security-Group akzeptieren (SSH von deiner IP erlaubt).

Storage: Default belassen (haeufig 8 GiB gp3 – Info notieren).

Launch instance.

Betriebssystem: Ubuntu 24.04 LTS

Instance type: t2.micro → RAM: 1 GiB, CPU: 1 vCPU

Diskgroesse: (Default-Wert aus Storage, oft 8 GiB)

Public IPv4: <hier eintragen>

Key bei Launch: vorname2

C) SSH mit Keypair nachweisen (40 %)

Zeige, dass nur der ausgewaehlte Key (vorname1) funktioniert und vorname2 nicht.

1) Keys lokal ablegen & Rechte setzen

Lege die geladenen Dateien in einen sicheren Ordner 


Windows PowerShell (Rechte anpassen)

![alt text](<Screenshot 2025-08-26 101618.png>)

2) Public Key aus privatem Key extrahieren (Nachweis)

3) Per SSH einloggen (Key 1 = erwartet Erfolg)

Ubuntu-Default-User: ubuntu

![alt text](<Screenshot 2025-08-26 101717.png>)


4) Per SSH versuchen (Key 2 = erwartet Fehler)


![](<Screenshot 2025-08-26 103041.png>)

Hinweis: AWS speichert niemals deinen privaten Key. Auf der Instanz liegt nur der Public Key von vorname1 in ~/.ssh/authorized_keys. Verlierst du vorname1.pem, kannst du ihn nicht wiederherstellen.



Template für Kurztext/Aufzaehlung:

## Instanz-Einstellungen (Kurz)
- Betriebssystem: Ubuntu 24.04 LTS
- Instance type: t2.micro (1 vCPU, 1 GiB RAM)
- Diskgroesse: <z. B. 8 GiB gp3, wie angezeigt>
- Public IPv4: <eintragen>
- Launch Key: vorname1

Leitfragen / Checkpoints (Selbsttest)

 Ich finde mich im Learner Lab zurecht (Start/Stop, Budget, Laufzeit).

 Ich weiss, was EC2 ist und was man dort verwaltet.

 Ich kann eine Instanz mit OS/Type/Storage anlegen.

 Ich verstehe Public/Private Key und weiss, wo die Files lokal liegen sollten.

 Ich kann aus .pem den Public Key extrahieren (ssh-keygen -y -f …).

 Ich kann per ssh mit Parametern verbinden (-i, User ubuntu, IP).

 Ich habe nachgewiesen, dass nur vorname1 funktioniert.

Troubleshooting (kurz)

Learner Lab Punkt rot? Session noch nicht gestartet oder nicht bereit → im Lab Start/Resume und kurz warten.

Falsche Region? Pruefe oben rechts die Region in der AWS Konsole, nutze die Region aus dem Learner Lab.

SSH blockiert? Security Group muss Port 22 zulassen (typisch „My IP“).

Permission denied (publickey) trotz richtigem Key?

User ubuntu verwenden.

IP stimmt? Instanz running?

Dateirechte gesetzt 

Key verloren? Neuen Key erstellen und per EC2 Instance Connect (oder AMI/Volume-Workaround) den neuen Public Key in ~/.ssh/authorized_keys legen.