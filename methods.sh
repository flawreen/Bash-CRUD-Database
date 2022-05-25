#!/bin/bash

function view {
	cat data
}

function add {
	read -p "Type unic ID: " unicID
	read -p "Owner's name: " name
	read -p "House location(city): " city
	read -p "House surface(sq meters): " sqm
	read -p "Number of levels: " levels
	echo -e "\nUnic_ID Name City Sqm Levels"
	echo "$unicID $name $city $sqm $levels"
	echo "Save data?"
	read x
	if [ $x == 'y' ]
	then
		echo "$unicID $name $city $sqm $levels" >> data
	fi
}

function search {
	read -p "Owner's name: " name
	echo "Properties owned by $name:"
	echo -e "\nUnic_ID Name City Sqm Levels"
	grep $name data
}

function update {
	read -p "Enter the ID that you want to update: " id
	oldCity=$(grep -E "^$id.*" data | awk '{print $3}')
	read -p "The old city is $oldCity. New city: " newCity
	id=$((id+1))
	sed -i "${id}s/${oldCity}/${newCity}/" data
	view
}

function delete {
	read -p "Enter the ID that you want to delete: " id
	id=$((id+1))
	sed -i "${id}d" data
	view
}
