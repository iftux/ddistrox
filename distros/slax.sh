#!/bin/bash

#----------------------------------------------------------------------------------|
#                                                                                  |
#   '||'''|. '||'''|.              ||                  '\\  //`                    |
#    ||   ||  ||   ||  ''          ||                    \\//                      |
#    ||   ||  ||   ||  ||  ('''' ''||''  '||''| .|''|,    ><                       |
#    ||   ||  ||   ||  ||   `'')   ||     ||    ||  ||   //\\                      |
#   .||...|' .||...|' .||. `...'   `|..' .||.   `|..|' .//  \\.                    |
#                                                                                  |
#----------------------------------------------------------------------------------|
#                        BPSYS (c) 2014 - GPL V3                                   |
#----------------------------------------------------------------------------------|
#       This program is free software: you can redistribute it and/or modify       |
#       it under the terms of the GNU General Public License as published by       |
#       the Free Software Foundation, either version 3 of the License, or          |
#       (at your option) any later version.                                        |
#                                                                                  |
#       This program is distributed in the hope that it will be useful,            |
#       but WITHOUT ANY WARRANTY; without even the implied warranty of             |
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              |
#       GNU General Public License for more details.                               |
#                                                                                  |
#----------------------------------------------------------------------------------|
#                      IfTux.WordPress.Com                                         |
#----------------------------------------------------------------------------------|
function DDD {
tydosycb=`zenity --list \
                 --title="Elige entre 32 o 64 bits" \
                 --width=150 \
                 --height=150 \
                 --column="seleccionar" --column="procesador" \
                 --radiolist FALSE "32bits" False "64bits"`
if [ $? -eq 0 ]
then
       for tydosycb in $tydosycb
       do
          if [ $tydosycb = "32bits" ];
                 then
                      urldedescarga="http://www.slax.org/download/7.0.8/slax-Spanish-7.0.8-i486.iso"
          elif [ $tydosycb = "64bits" ]
                  then
                      urldedescarga="http://www.slax.org/download/7.0.8/slax-Spanish-7.0.8-x86_64.iso"
          fi
       done
fi
descargaren=`zenity --file-selection --title="Guardar En..." --save --directory `
cd $descargaren
wget -t 50 $urldedescarga
zenity --info --text="Descarga terminada con éxito!!!"
}

function DESCMAIN {
archinfo=`dirname $0`/slax.html
zenity --text-info \
       --title="Descargar Slax Linux" \
       --filename=$archinfo \
       --html \
       --width=550 \
       --height=550 \
       --ok-label="Descargar" \
       --cancel-label="Salir"
case $? in
    0)
       DDD
       ;;
    1)
       zenity --info --text="la descarga ha sido cancelada "
       ;;
esac
}
DESCMAIN
