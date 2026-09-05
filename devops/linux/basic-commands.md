# Linux basic commands

## :memo: List/Change directory

| Command | Description     |
| :------------- | :------------- |
| ls | list directory contents |
| ls -a | list directory contents / do not ignore entries starting with . |
| ls -lisa | ... |
| cd | Change the shell working directory |
| cd .. | ... |

## :open_file_folder: Touch/Make directory

| Command | Description     |
| :------------- | :------------- |
| touch FILE | Update the access and modification times of each FILE to the current time. A FILE argument that does not exist is created empty  |
| mkdir | Make directories. Create the DIRECTORY(ies), if they do not already exist |
| mkdir -p DIR/SUB_DIR | --parents: no error if existing, make parent directories as needed |
| mkdir -p chapter_{3..20}/{1,2,3,4,5,6} | Create multiple directories with subdirectories | 

## :open_file_folder: Copy/Move directory

| Command | Description     |
| :------------- | :------------- |
| cp SOURCE DEST | Copy files and directories |
| cp -r SOURCE DEST | Copy files and directories recursive |
| mv SOURCE DEST | Move (rename) files |

## :open_file_folder: Remove directory

| Command | Description     |
| :------------- | :------------- |
| rm FILE | Remove files or directories |
| rm -i FILE | -i : prompt before every removal |
| rm -r FILE | -r : ... recursive |

## :mag_right: Find directory

| Command | Description     |
| :------------- | :------------- |
| find DIR -type TYPE | Find by TPYE (b  c  d  f  l  p  s ) |
| find DIR -size SIZE | Find by SIZE (9M)|
| find DIR -iname REGEX | Find by ... Example: '*.txt' |
| find DIR -mtime -2 | Files modificats o creats els darrers dies |
| find DIR -name FILE.EXT | Find by name |

## :scissors: Grep

| Command | Description     |
| :------------- | :------------- |

grep "texto" /home/ *.txt 		// dins un directori
grep -r "texto" /home/ *.txt  		// dins un directori recursivament

grep -r "texto" /home/

grep -i "texto" nombre-del-archivo 	// TEXTO dins arxiu IGNORANT MAYUS O NO

grep ^# nombre-del-archivo 		// comentaris d'un determinat arxiu

## :key: Chmod

| Command | Description     |
| :------------- | :------------- |
| chmod NUM FILE | Change permissions, octal notation: owner, group, others (`755`, `644`) |

## :lock: Zip / Unzip - Rar / Unrar

| Command | Description     |
| :------------- | :------------- |
| zip OUTPUT.zip INPUT | Package and compress (archive) files |
| unzip | Extract a .zip archive |

tar czf archivo-comprimido.tar.gz nombre-del-archivo1 nombre-del-archivo2
tar cjf archivo-comprimido.tar.bz2 nombre-del-archivo1 nombre-del-archivo2
tar cJf archivo-comprimido.tar.xz nombre-del-archivo1 nombre-del-archivo2

tar tvf name.tar.gz	// LLISTAR

unzip -d .. name.zip 		// DESCOMPRIMIR

tar -xvf archivo-comprimido.tar.gz

```
sudo apt-get install rar
sudo apt-get install unrar
```

DESCOMPRIMIR
unrar x name.rar
unrar x nombre_del_rar.rar /ruta/destino/descomprimido

## :card_file_box: Others

| Command | Description     |
| :------------- | :------------- |
| pwd | Print name of current/working directory |
| clear | Clear the terminal screen |
| man | Reference manuals |
| ln -s DIR LINK_NAME | Make links between files |

## :warning: Shutdown

| Command | Description     |
| :------------- | :------------- |
| shutdown -r now | Reboot immediately |
| shutdown -h 10:00 | Schedule a halt at a given time |

## :memo: Documentation

| Command | Description     |
| :------------- | :------------- |
| man COMMAND | Reference manuals |
| whatis COMMAND | Display one-line manual page descriptions |
| info COMMAND | Read info documents |

## :speaker: Protocols

| Command | Description     |
| :------------- | :------------- |
| ssh | Open a shell on a remote host |
| telnet | Plain-text remote connection; useful to test whether a port answers, never for real access |
| sftp | Transfer files over SSH |
