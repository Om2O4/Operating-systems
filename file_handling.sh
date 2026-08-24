#!/bin/bash

# ==========================================
#       LINUX FILE MANAGEMENT SYSTEM
# ==========================================

while true
do

    clear

    echo "=============================================="
    echo "       LINUX FILE MANAGEMENT SYSTEM"
    echo "=============================================="
    echo
    echo "1.  Create a File"
    echo "2.  Copy a File"
    echo "3.  Move a File"
    echo "4.  Delete a File"
    echo "5.  Rename a File"
    echo "6.  Display File Content"
    echo "7.  Write into a File"
    echo "8.  Append Text to a File"
    echo "9.  Display File Size"
    echo "10. Compare Two Files"
    echo "11. Combine Two Files"
    echo "12. Count Lines, Words and Characters"
    echo "13. Create a Directory"
    echo "14. Delete a Directory"
    echo "15. List Directory Contents"
    echo "16. Search for a File"
    echo "17. Show Current Directory"
    echo "18. Change Directory"
    echo "19. Create Empty File (Touch)"
    echo "20. Exit"
    echo
    echo "=============================================="

    read -p "Enter your choice: " choice

    clear

    case $choice in

        # ------------------------------------------
        # 1. CREATE FILE
        # ------------------------------------------

        1)
            echo "----- CREATE FILE -----"
            echo

            read -p "Enter file name: " filename

            if [ -e "$filename" ]
            then
                echo "File already exists."
            else
                touch "$filename"

                if [ $? -eq 0 ]
                then
                    echo "File created successfully."
                else
                    echo "Error creating file."
                fi
            fi
            ;;


        # ------------------------------------------
        # 2. COPY FILE
        # ------------------------------------------

        2)
            echo "----- COPY FILE -----"
            echo

            read -p "Enter source file: " source
            read -p "Enter destination: " destination

            if [ -f "$source" ]
            then
                cp "$source" "$destination"

                if [ $? -eq 0 ]
                then
                    echo "File copied successfully."
                else
                    echo "Error copying file."
                fi
            else
                echo "Source file does not exist."
            fi
            ;;


        # ------------------------------------------
        # 3. MOVE FILE
        # ------------------------------------------

        3)
            echo "----- MOVE FILE -----"
            echo

            read -p "Enter file name: " source
            read -p "Enter destination: " destination

            if [ -e "$source" ]
            then
                mv "$source" "$destination"

                if [ $? -eq 0 ]
                then
                    echo "File moved successfully."
                else
                    echo "Error moving file."
                fi
            else
                echo "File does not exist."
            fi
            ;;


        # ------------------------------------------
        # 4. DELETE FILE
        # ------------------------------------------

        4)
            echo "----- DELETE FILE -----"
            echo

            read -p "Enter file name: " filename

            if [ -f "$filename" ]
            then
                read -p "Are you sure you want to delete it? (y/n): " answer

                if [ "$answer" = "y" ] || [ "$answer" = "Y" ]
                then
                    rm "$filename"

                    if [ $? -eq 0 ]
                    then
                        echo "File deleted successfully."
                    else
                        echo "Error deleting file."
                    fi
                else
                    echo "Delete operation cancelled."
                fi
            else
                echo "File does not exist."
            fi
            ;;


        # ------------------------------------------
        # 5. RENAME FILE
        # ------------------------------------------

        5)
            echo "----- RENAME FILE -----"
            echo

            read -p "Enter old file name: " oldname
            read -p "Enter new file name: " newname

            if [ -e "$oldname" ]
            then
                mv "$oldname" "$newname"

                if [ $? -eq 0 ]
                then
                    echo "File renamed successfully."
                else
                    echo "Error renaming file."
                fi
            else
                echo "File does not exist."
            fi
            ;;


        # ------------------------------------------
        # 6. DISPLAY FILE CONTENT
        # ------------------------------------------

        6)
            echo "----- DISPLAY FILE CONTENT -----"
            echo

            read -p "Enter file name: " filename

            if [ -f "$filename" ]
            then
                echo
                echo "---------- FILE CONTENT ----------"

                cat "$filename"

                echo
                echo "----------------------------------"
            else
                echo "File does not exist."
            fi
            ;;


        # ------------------------------------------
        # 7. WRITE INTO FILE
        # ------------------------------------------

        7)
            echo "----- WRITE INTO FILE -----"
            echo

            read -p "Enter file name: " filename
            read -p "Enter text: " text

            echo "$text" > "$filename"

            if [ $? -eq 0 ]
            then
                echo "Text written successfully."
            else
                echo "Error writing to file."
            fi
            ;;


        # ------------------------------------------
        # 8. APPEND TEXT TO FILE
        # ------------------------------------------

        8)
            echo "----- APPEND TEXT TO FILE -----"
            echo

            read -p "Enter file name: " filename
            read -p "Enter text: " text

            echo "$text" >> "$filename"

            if [ $? -eq 0 ]
            then
                echo "Text added successfully."
            else
                echo "Error appending text."
            fi
            ;;


        # ------------------------------------------
        # 9. DISPLAY FILE SIZE
        # ------------------------------------------

        9)
            echo "----- FILE SIZE -----"
            echo

            read -p "Enter file name: " filename

            if [ -e "$filename" ]
            then
                ls -lh "$filename"
            else
                echo "File does not exist."
            fi
            ;;


        # ------------------------------------------
        # 10. COMPARE TWO FILES
        # ------------------------------------------

        10)
            echo "----- COMPARE TWO FILES -----"
            echo

            read -p "Enter first file: " file1
            read -p "Enter second file: " file2

            if [ -f "$file1" ] && [ -f "$file2" ]
            then
                cmp -s "$file1" "$file2"

                if [ $? -eq 0 ]
                then
                    echo "Both files are identical."
                else
                    echo "Files are different."
                fi
            else
                echo "One or both files do not exist."
            fi
            ;;


        # ------------------------------------------
        # 11. COMBINE TWO FILES
        # ------------------------------------------

        11)
            echo "----- COMBINE TWO FILES -----"
            echo

            read -p "Enter first file: " file1
            read -p "Enter second file: " file2
            read -p "Enter output file: " output

            if [ -f "$file1" ] && [ -f "$file2" ]
            then
                cat "$file1" "$file2" > "$output"

                if [ $? -eq 0 ]
                then
                    echo "Files combined successfully."
                    echo "Output file: $output"
                else
                    echo "Error combining files."
                fi
            else
                echo "One or both files do not exist."
            fi
            ;;


        # ------------------------------------------
        # 12. COUNT LINES, WORDS AND CHARACTERS
        # ------------------------------------------

        12)
            echo "----- FILE COUNT -----"
            echo

            read -p "Enter file name: " filename

            if [ -f "$filename" ]
            then
                echo
                echo "Lines  Words  Characters"
                wc "$filename"
            else
                echo "File does not exist."
            fi
            ;;


        # ------------------------------------------
        # 13. CREATE DIRECTORY
        # ------------------------------------------

        13)
            echo "----- CREATE DIRECTORY -----"
            echo

            read -p "Enter directory name: " dirname

            if [ -d "$dirname" ]
            then
                echo "Directory already exists."
            else
                mkdir "$dirname"

                if [ $? -eq 0 ]
                then
                    echo "Directory created successfully."
                else
                    echo "Error creating directory."
                fi
            fi
            ;;


        # ------------------------------------------
        # 14. DELETE DIRECTORY
        # ------------------------------------------

        14)
            echo "----- DELETE DIRECTORY -----"
            echo

            read -p "Enter directory name: " dirname

            if [ -d "$dirname" ]
            then
                rmdir "$dirname"

                if [ $? -eq 0 ]
                then
                    echo "Directory deleted successfully."
                else
                    echo "Directory is not empty."
                    echo "Only empty directories can be deleted using rmdir."
                fi
            else
                echo "Directory does not exist."
            fi
            ;;


        # ------------------------------------------
        # 15. LIST DIRECTORY CONTENTS
        # ------------------------------------------

        15)
            echo "----- DIRECTORY CONTENTS -----"
            echo

            read -p "Enter directory path (use . for current directory): " dirname

            if [ -d "$dirname" ]
            then
                ls -la "$dirname"
            else
                echo "Directory does not exist."
            fi
            ;;


        # ------------------------------------------
        # 16. SEARCH FOR A FILE
        # ------------------------------------------

        16)
            echo "----- SEARCH FILE -----"
            echo

            read -p "Enter directory to search: " dirname
            read -p "Enter file name to search: " filename

            if [ -d "$dirname" ]
            then
                result=$(find "$dirname" -name "$filename" 2>/dev/null)

                if [ -n "$result" ]
                then
                    echo
                    echo "File found:"
                    echo "$result"
                else
                    echo "File not found."
                fi
            else
                echo "Directory does not exist."
            fi
            ;;


        # ------------------------------------------
        # 17. SHOW CURRENT DIRECTORY
        # ------------------------------------------

        17)
            echo "----- CURRENT DIRECTORY -----"
            echo

            echo "You are currently in:"
            pwd
            ;;


        # ------------------------------------------
        # 18. CHANGE DIRECTORY
        # ------------------------------------------

        18)
            echo "----- CHANGE DIRECTORY -----"
            echo

            read -p "Enter directory path: " dirname

            if [ -d "$dirname" ]
            then
                cd "$dirname"

                if [ $? -eq 0 ]
                then
                    echo "Directory changed successfully."
                    echo
                    echo "Current directory:"
                    pwd
                else
                    echo "Unable to change directory."
                fi
            else
                echo "Directory does not exist."
            fi
            ;;


        # ------------------------------------------
        # 19. TOUCH FILE
        # ------------------------------------------

        19)
            echo "----- TOUCH FILE -----"
            echo

            read -p "Enter file name: " filename

            touch "$filename"

            if [ $? -eq 0 ]
            then
                echo "File created/updated successfully."
            else
                echo "Error performing touch operation."
            fi
            ;;


        # ------------------------------------------
        # 20. EXIT
        # ------------------------------------------

        20)
            echo
            echo "=============================================="
            echo "   Thank you for using File Management System"
            echo "=============================================="
            exit 0
            ;;


        # ------------------------------------------
        # INVALID CHOICE
        # ------------------------------------------

        *)
            echo
            echo "Invalid choice!"
            echo "Please enter a number from 1 to 20."
            ;;

    esac

    echo
    read -p "Press Enter to continue..."

done

#practical-1B:. Write a shell script that implements various file and directory related commands.
