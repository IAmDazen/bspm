#!/bin/bash
display_installing() {
    clear
    echo
    echo "----------------------------------------"
    echo "BBB BBBBB          BDSM Installer       "
    echo "BB  BBBBBBBB                            "
    echo "BBB  BBB BBBB      Installing BDSM,   "
    echo "BBB  BBB  BBB      Please wait     "
    echo "BBB  BBB BBBB                           "
    echo "BB  BBBBBBBB                            "
    echo "BB  BBB  BBB                            "
    echo "BB  BBBB  BBB                           "
    echo "B    BBB  BBB                           "
    echo "BB   BBB  BBB                 "
    echo "BB   BBBBBBBB                           "
    echo "BB   BBBBBB                              "
    echo
    echo "----------------------------------------"
}

display_ascii() {
    local selected="$1"  # "yes" or "no"
    clear
    echo
    echo "----------------------------------------"
    echo "BBB BBBBB          BDSM Installer       "
    echo "BB  BBBBBBBB                            "
    echo "BBB  BBB BBBB      Ready To Install?    "
    echo "BBB  BBB  BBB                           "
    echo "BBB  BBB BBBB                           "
    echo "BB  BBBBBBBB                            "
    echo "BB  BBB  BBB                            "
    echo "BB  BBBB  BBB                           "
    echo "B    BBB  BBB                           "
    if [ "$selected" == "yes" ]; then
        echo -e "BB   BBB  BBB      \e[7m[Yes]\e[0m        [No]    "
    else
        echo -e "BB   BBB  BBB      [Yes]        \e[7m[No]\e[0m    "
    fi
    echo "BB   BBBBBBBB                           "
    echo "BB   BBBBBB                              "
    echo
    echo "----------------------------------------"
    echo
}

if [ "$EUID" -ne 0 ]; then
    clear
    echo
    echo "----------------------------------------"
    echo "BBB BBBBB          BDSM Installer       "
    echo "BB  BBBBBBBB                            "
    echo "BBB  BBB BBBB      Please run as root   "
    echo "BBB  BBB  BBB                           "
    echo "BBB  BBB BBBB                           "
    echo "BB  BBBBBBBB                            "
    echo "BB  BBB  BBB                            "
    echo "BB  BBBB  BBB                           "
    echo "B    BBB  BBB                           "
    echo "BB   BBB  BBB      Press enter to exit                  "
    echo "BB   BBBBBBBB                           "
    echo "BB   BBBBBB                              "
    echo
    echo "----------------------------------------"
    read -p "Press Enter to exit..."
    exit 1
fi

selection="yes"
display_ascii "$selection"

while true; do
    read -sn1 key 
    if [[ $key == $'\x1b' ]]; then
        read -sn2 -t 0.1 key 
        case "$key" in
            "[C") selection="no" ;; 
            "[D") selection="yes" ;; 
        esac
        display_ascii "$selection"
    elif [[ $key == "" ]]; then 
        if [ "$selection" == "yes" ]; then
            display_installing
            wget --directory-prefix /usr/bin https://raw.githubusercontent.com/IAmDazen/bspmhost/refs/heads/main/bspm
            break 
        else
            display_ascii "Installation Cancelled"
            sleep 1
            exit 0
        fi
    fi
done

# Done screen
display_done() {
    clear
    echo
    echo "----------------------------------------"
    echo "BBB BBBBB          BDSM Installer       "
    echo "BB  BBBBBBBB                            "
    echo "BBB  BBB BBBB      Install Finished!   "
    echo "BBB  BBB  BBB                           "
    echo "BBB  BBB BBBB                           "
    echo "BB  BBBBBBBB                            "
    echo "BB  BBB  BBB                            "
    echo "BB  BBBB  BBB                           "
    echo "B    BBB  BBB                           "
    echo "BB   BBB  BBB      Press Enter to exit                  "
    echo "BB   BBBBBBBB                           "
    echo "BB   BBBBBB                              "
    echo
    echo "----------------------------------------"
}
    
display_done
