#!/bin/bash

while true; do
    echo "1. Show disk usage."
    echo "2. Show system uptime."
    echo "3. Show the users logged into the system."
    echo "What would you like to do? (Enter q to quit.) "
    
    read choice
    
    case "$choice" in
        1)
            df -h
            echo
            ;;
        2)
            uptime
            echo
            ;;
        3)
            who
            echo
            ;;
        q)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option."
            echo
            ;;
    esac
done
