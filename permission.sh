check_item() {
    if [ ! -e "$1" ]; then
        echo "Error: '$1' was not found."
        return 1
    fi
    return 0
}

show_details() {
    target="$1"
    echo
    echo "=========================================="
    echo "        PERMISSION INFORMATION"
    echo "=========================================="
    echo "Item       : $target"
    echo "Owner      : $(stat -c "%U" "$target")"
    echo "Group      : $(stat -c "%G" "$target")"
    echo "Permission : $(stat -c "%A" "$target")"
    echo "Permission Code : $(stat -c "%a" "$target")"
    echo "=========================================="
}

while :; do
    echo
    echo "**********************************************"
    echo "        FILE PERMISSION CONTROL"
    echo "**********************************************"
    echo "1) View permissions"
    echo "2) Enable read access"
    echo "3) Enable write access"
    echo "4) Enable execute access"
    echo "5) Disable write access"
    echo "6) Disable execute access"
    echo "7) Apply numeric permission"
    echo "8) View ownership"
    echo "9) Change ownership"
    echo "0) Quit"
    echo "**********************************************"
    
    read -p "Select an option: " option
    
    case "$option" in
        1)
            read -p "Enter file/directory: " item
            if check_item "$item"; then
                show_details "$item"
            fi
            ;;
        2)
            read -p "Enter file/directory: " item
            if check_item "$item"; then
                chmod u+r "$item"
                echo "Read access has been enabled."
            fi
            ;;
        3)
            read -p "Enter file/directory: " item
            if check_item "$item"; then
                chmod u+w "$item"
                echo "Write access has been enabled."
            fi
            ;;
        4)
            read -p "Enter file/directory: " item
            if check_item "$item"; then
                chmod u+x "$item"
                echo "Execute access has been enabled."
            fi
            ;;
        5)
            read -p "Enter file/directory: " item
            if check_item "$item"; then
                chmod u-w "$item"
                echo "Write access has been disabled."
            fi
            ;;
        6)
            read -p "Enter file/directory: " item
            if check_item "$item"; then
                chmod u-x "$item"
                echo "Execute access has been disabled."
            fi
            ;;
        7)
            read -p "Enter file/directory: " item
            read -p "Enter permission code (e.g. 755): " mode
            if check_item "$item"; then
                chmod "$mode" "$item"
                if [ $? -eq 0 ]; then
                    echo "Permission updated successfully."
                    echo "Current permission: $(stat -c "%A" "$item")"
                else
                    echo "Invalid permission code."
                fi
            fi
            ;;
        8)
            read -p "Enter file/directory: " item
            if check_item "$item"; then
                user=$(stat -c "%U" "$item")
                group=$(stat -c "%G" "$item")
                echo
                echo "-----------------------------"
                echo "Owner : $user"
                echo "Group : $group"
                echo "-----------------------------"
            fi
            ;;
        9)
            read -p "Enter file/directory: " item
            read -p "Enter username of new owner: " newuser
            if check_item "$item"; then
                sudo chown "$newuser" "$item"
                if [ $? -eq 0 ]; then
                    echo "Ownership changed successfully."
                    echo "New owner: $(stat -c "%U" "$item")"
                else
                    echo "Unable to change ownership."
                fi
            fi
            ;;
        0)
            echo
            echo "Exiting permission manager..."
            echo "Thank you!"
            break
            ;;
        *)
            echo "Invalid option. Please select 0-9."
            ;;
    esac
done
