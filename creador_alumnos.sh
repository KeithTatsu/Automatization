#!/bin/sh

#Colors
RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
BLUE="\e[1;34m"
LIGHT_GRAY="\e[1;37m"
NO_COLOR="\e[0m"

crear_dir(){
	mkdir $1	
}

crear_archivo(){
	local directorio_anterior=$PWD
	cd $1
	local nombre_archivo=$1".txt"
	echo $2 $3 > $nombre_archivo
	echo >> $nombre_archivo
	cat $directorio_anterior/example.txt | while read linea; do echo $linea >> $nombre_archivo; done
	cd ..
}

main(){
	local continuar="S"
	local nombre=""
	local padron=0
	local e_mail=""

	echo -e "Bienvenido a creador de alumnos."
	echo -e "Recuerde que las ${BLUE}carpetas${NO_COLOR} se crearán en el directorio actual ${YELLOW}($PWD)${NO_COLOR} y que necesita un archivo ${LIGHT_GRAY}example.txt${NO_COLOR} para crear los archivos de texto."

	while [ $continuar == "S" ];
	do
		echo "Ingrese nombre completo del alumno:"
		IFS=
		read nombre
		echo "Ingrese el padrón:"
		read padron
		echo "Ingrese e-mail:"
		read e_mail
		crear_dir $nombre
		crear_archivo $nombre $padron $e_mail
		echo "¿Desea crear otro alumno?"
		read continuar
	done
}

main
