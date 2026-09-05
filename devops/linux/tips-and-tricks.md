# Linux tips

## Utils

```bash
# Find file by name and open
subl $(find -name name.txt)
```

```bash
# Veure el codi font d'un executable
string BIN
```

```bash
# Obtenir imatges d'internet i renombrar el document
wget URL -O FILENAME
```

```bash
# Obrir el gestor de fitxers desde terminal
xdg-open PATH
```

```bash
# mmv - move/copy/append/link multiple files by wildcard patterns
mmv '*.txt' '#1.jpg'
```

```bash
# create direct access
gnome-desktop-item-edit ~/Escritorio --create-new
```

```bash
# Mostrar les configuracions del ordenador  
ScreenFetch
```

## :musical_note: Download Youtube Music

```bash
# Pre-requisits
sudo apt-get install -y libav-tools
sudo apt-get install ffmpeg

# Install
sudo apt install curl
sudo curl https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl

# Permissions
sudo chmod a+rx /usr/local/bin/youtube-dl

# Examples
youtube-dl URL
youtube-dl --list-formats URL
youtube-dl -f 18 URL # chose format 18
youtube-dl -t --extract-audio --audio-format mp3 URL

# Download List
TODO - hi ha una manera molt elegant de fer-ho.
```

## :memo: Convertir web a pdf

```bash
# CONVERTIR WWW TO PDF (png, jpeg, ...)
cutycapt --url=URL --out=NAME.pdf
```

## :scissors: Split .mp3

```
TODO

// Vull els fragments de 1min en 1min.
mp3splt -t 1.0 exemple.mp3

// crea una carpeta split i fica tot alli
mp3splt -f -t 2.0 -a -d split exemple.mp3

// modificant el nom de sortida dels fitxers!
mp3splt Blake_Duelee.mp3 -t 01.00 -T 1 -g %[@o,@N=1,@y=2005] -o @f+-Part+@n

   File "Blake_Duelee -Part 1.mp3" created                   
   File "Blake_Duelee -Part 2.mp3" created                   
   File "Blake_Duelee -Part 3.mp3" created

// especifiquem el temps que volem!
ffmpeg -i InputFile.mp3 -vn -acodec copy -ss 00:00:00 -t 00:01:32 OutputFile.mp3

***********************************
HE FET UN SCRIPT MOLT CUTRE QUE DESCARGA I SEPARA L'AUDIO DE UN  VIDEO DE YOUTUBE

my_cut.sh
***********************************
```

## :notes: Castings .mp3

```
TODO

CONVERTIR FORMATS DE AUDIO !
En aquest cas exemple es un file d'audio amb ext: mpeg

DE MPEG A MP3 	
ffmpeg -i exemple exemple.mp3
```

## :policeman: Seguretat

```
TODO

- FIREWIRE iptables.
- chkrootkit BUSCA SI TENIM ROOTKIT! (ALGU DINS EL NOSTRE PC)
sudo chkrootkit 	//Esta orden realizará todos los tests.
Otras configuraciones: para que se ejecute diariamente abrimos el archivo:
/etc/chkrootkit.conf
Y reemplazamos:RUN_DAILY="false" --> true

- rkhunter
- MONITORITZAR RED: ntopng
- ESCANEO DE PUERTOS: nmap
- GOTOP (monitoritzar rendiment del ordenador)
- HTOP (monitoritzar processos del ordenador)
```
