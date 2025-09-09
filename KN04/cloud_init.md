# Dokumentation der Cloud-Init Datei

Diese Datei (`cloud-config`) wird verwendet, um beim Start einer VM (z. B. auf AWS, OpenStack, Proxmox oder anderen Cloud-Umgebungen) automatisch Benutzer, SSH-Zugriff und Pakete zu konfigurieren.

---

## 1. Benutzerkonfiguration

```yaml
users:
  - name: ubuntu
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    home: /home/ubuntu
    shell: /bin/bash
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0WGP1EZykEtv5YGC9nMiPFW3U3DmZNzKFO5nEu6uozEHh4jLZzPNHSrfFTuQ2GnRDSt+XbOtTLdcj26+iPNiFoFha42aCIzYjt6V8Z+SQ9pzF4jPPzxwXfDdkEWylgoNnZ+4MG1lNFqa8aO7F62tX0Yj5khjC0Bs7Mb2cHLx1XZaxJV6qSaulDuBbLYe8QUZXkMc7wmob3PM0kflfolR3LE7LResIHWa4j4FL6r5cQmFlDU2BDPpKMFMGUfRSFiUtaWBNXFOWHQBC2+uKmuMPYP4vJC9sBgqMvPN/X2KyemqdMvdKXnCfrzadHuSSJYEzD64Cve5Zl9yVvY4AqyBD aws-key

```
name: Erstellt den Benutzer ubuntu.

sudo: Gibt dem Benutzer volle sudo-Rechte ohne Passwortabfrage.

groups: Fügt den Benutzer den Gruppen users und admin hinzu.

home: Setzt das Home-Verzeichnis auf /home/ubuntu.

shell: Standard-Shell ist /bin/bash.

ssh_authorized_keys: Erlaubt SSH-Login über den angegebenen Public Key (hier: aws-key).

2. SSH- und Root-Einstellungen
```yaml
ssh_pwauth: false
disable_root: false
```

ssh_pwauth: false → Passwort-Authentifizierung über SSH ist deaktiviert (nur Key-basierter Login möglich).

disable_root: false → Root-Login ist erlaubt (wird oft standardmäßig deaktiviert).

3. Paketverwaltung
```yaml
package_update: true
packages:
  - curl
  - wget
```

package_update: true → Führt beim Boot ein apt-get update aus, um Paketlisten zu aktualisieren.

packages: Installiert automatisch die angegebenen Pakete:

curl → Tool zum Übertragen von Daten (HTTP, HTTPS, FTP usw.)

wget → Tool zum Herunterladen von Dateien über HTTP/HTTPS/FTP

4. Gesamtzweck der Datei
Mit dieser Konfiguration wird beim Starten einer Instanz folgendes erreicht:

Ein Benutzer ubuntu mit vollem sudo Zugriff wird eingerichtet.

Zugriff ist nur per SSH-Key möglich (keine Passwörter).

Root bleibt aktivierbar.

Basis-Tools (curl, wget) werden automatisch installiert.

Beispielverwendung
Diese Datei wird typischerweise beim Erstellen einer VM über die Cloud-Konsole oder per CLI eingebunden:

```bash
# Beispiel: VM mit cloud-init Datei starten
openstack server create \
  --flavor m1.small \
  --image ubuntu-22.04 \
  --key-name mykey \
  --user-data cloud-config.yaml \
  my-vm
```
