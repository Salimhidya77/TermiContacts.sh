#!/bin/bash

function main_menue(){

  echo "press i to add new contact"
  echo "press v to view all contacts"
  echo "press s to search for record"
  echo "press e to delete all contacts"
  echo "press d to delete one contact"
  echo "press q to exit"
  read -p "plz enter your choise: " choise
}

main_menue

function add_new(){

  read -p "Enter ur fname: " fname
  read -p "Enter ur lname: " lname
  read -p "Enter ur Email: " email
  read -p "Enter ur phone number: " phone
  echo "$fname:$lname:$email:$phone" >> database.txt
}
function quit(){
  read -p " to return to main menu press m or q to exit: " action
  if [ $action = "m" ] || [ $action = "M" ]
  then
        main_menue
  else
          exit
  fi
}

function view_contact(){
  echo "----------view all contact--------- "
  cat database.txt
  echo "----------end--------------"

}

function ask(){
  read -p "plz enter any thing to search in all contact: " search
  echo "----------------result------------------"
  grep $search database.txt --color
  echo "-----------------end--------------------"

}

function delete_contact(){
 read -p "plz enter name, email, phone related to delete contact : " delete_me
 echo "---------delete contact----------"
 grep $delete_me database.txt
 sed -i '/'$delete_me'/d' database.txt
}

function delete_all(){
echo "-------delete all contact----------"
echo " " > database.txt
}

while [ true ]
do
        if [ $choise = "i" ] || [ $choise = "I" ]
        then
                add_new
                quit
        elif [ $choise = "v" ] || [ $choise = "V" ]
        then
                view_contact
                quit
        elif [ $choise = "s" ] || [ $choise = "S" ]
        then
                ask
                quit
        elif [ $choise = "d" ] || [ $choise = "D" ]
        then
                delete_contact
                quit

        elif [ $choise = "e" ] || [ $choise = "E" ]
        then
                delete_all
                quit

        elif [ $choise = "q" ] || [ $choise = "Q" ]
        then
                exit
        fi

done
