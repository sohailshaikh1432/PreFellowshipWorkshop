#!/bin/bash -x

#declare dictionary array

function initOfBoard()
{
	declare -a positions

	positions[1] = " "
	positions[2] = " "
	positions[3] = " "
	positions[4] = " "
	positions[5] = " "
	positions[6] = " "
	positions[7] = " "
	positions[8] = " "
	positions[9] = " "

	echo ${positions[@]}
}




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


#Printing board

function board()
{
   printf "+---+---+---+\n"
   printf "| ${positions[1]} | ${positions[2]} | ${positions[3]} |\n"
   printf "+---+---+---+\n"
   printf "| ${positions[4]} | ${positions[5]} | ${positions[6]} |\n"
   printf "+---+---+---+\n"
   printf "| ${positions[7]} | ${positions[8]} | ${positions[9]} |\n"
   printf "+---+---+---+\n"
}

#Function to reset board
function resetBoard()
{
	for (( i=1; i<=9; i++ ))
	do
		positions[$i]=$i
	done
	echo "Board reset successful."
	board
}

#function for user turn
function userPlay()
{
   read -p "Enter position you want to add $userSymbol: " choice1
   while [ $(( ${positions["$choice1"]} )) -eq $(($computerSymbol)) -o $(( ${positions["$choice1"]} )) -eq $(($userSymbol)) ]
   do
      echo "Place already taken choose another one"
      read -p "Enter position you want to add $userSymbol: " choice1
   done
   positions["$choice1"]=$userSymbol
}


#Function for play game & game over
function main()
{
	initOfBoard
	toss
	board
	userPlay
}
main
