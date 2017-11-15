#!/bin/bash

# Creara una jerarquia de ficheros personalizada mediante prompts

#Descripcion de pasos
#1)prompt read y valida nombre del root dir
#2)prompt read y valida numero de childrens
#3)prompt read y valida nombre de childrens(++)
#4)crear directorios

######Variables

root_dir=''
number_children=0
children_dir=''

######Functions

dir_root()
{
	mkdir -m a=rwx "$root_dir"
}

dir_maker()
{
	dir_root
	cd "$root_dir"
	count=1
	while [ "$count" -le "$number_children" ]; do
		mkdir "$children_dir$count"
		count=$((count + 1))
	done

	echo "Your directory hierarchy is done!"
}

subdir_validate()
{
	echo -n "Enter the name of subdirectories/childrens --> "
	read children_dir

	if [ -z $children_dir ]; then
		echo "Enter a valid name, try again"
		subdir_validate
	else
		dir_maker
	fi
}

childnum_validate()
{
	echo -n "Enter number of wanted subdirectories --> " 
	read number_children

	if [[ $number_children =~ ^-?[0-9]+$ ]]; then
		subdir_validate
	else
		echo "Not a valid number/integer, try again"
		childnum_validate
	fi
}

rootname_validate()
{
	echo -n "Enter the name of the root/parent directory --> "
	read root_dir

	if [ -z $root_dir ]; then
		echo "Enter a valid name, try again"
		rootname_validate
	else
		childnum_validate
	fi
}


##### Start the program

rootname_validate



