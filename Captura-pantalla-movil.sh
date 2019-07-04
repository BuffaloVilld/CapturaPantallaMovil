#!/bin/bash
# modo debug con -x
# BuffaloVilld 13/06/2017

# Se realiza captura de la pantalla del movil mediante adb
# la captura se descarga mediante adb pull y se elimina del movil
#
# v.2: incluido parametro de entrada nombre de la captura;$1 
#

function help {
  echo "
# Captura de pantalla del movil conectado, mediante adb.
# La captura se almacena en el directorio destino indicado como segundo parametro
#
# uso: Captura-pantalla-movil.sh ficherocaptura
"
}

function main {
  fCaptura="/sdcard/$1.png" 
  
  echo "Capturando screen...."
  adb shell screencap -p $fCaptura

  echo "Descargando la captura..."
  adb pull $fCaptura

  echo "Borrando la captura del movil."
  adb shell rm $fCaptura

  echo "Proceso terminado. Captura en; $1.png"
}


# Main
#if [ $# -ne 2 ];then
if [ $# = 0 ];then
  help
else
  # main $1 $2
  main $1
fi
