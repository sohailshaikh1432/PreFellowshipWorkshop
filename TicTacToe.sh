#!/bin/bash -x

#declare dictionary array

#fuction initOfBoard()
#{
#	declare -a positions

#	positions[1]=" "
#	positions[2]=" "
#	positions[3]=" "
#	positions[4]=" "
#	positions[5]=" "
#	positions[6]=" "
#	positions[7]=" "
#	positions[8]=" "
#	positions[9]=" "

#	echo ${positions[@]}
#}




#Assign X & O symbols to computer and user.
function toss()
{
	random=$(( RANDOM % 2 ))
	if [ $random -eq 1 ]
	then
		currentPlayer=0
		echo "Computer won toss."

		symbol=$(( RANDOM % 2 ))
		if [ $symbol -eq 1 ]
		then
			computerSymbol='X'
			userSymbol='O'
		else
			computerSymbol='O'
			userSymbol='X'
		fi
	else
		currentPlayer=1
		echo "You won toss."

		read -p "Enter 1 for 'X' and 2 for 'O': " symbol
		if [ $symbol -eq 1 ]
		then
			userSymbol='X'
			computerSymbol='O'
		else
			userSymbol='O'
			computerSymbol='X'
		fi
	fi
	echo "Computer: $computerSymbol"
	echo "User: $userSymbol"
}
