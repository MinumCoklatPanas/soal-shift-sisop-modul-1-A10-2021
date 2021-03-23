#!/bin/bash

declare -A error_count
declare -A error_name
declare -A personal_error_count
declare -A personal_info_count

# tmp="hehe"

# error_count[$tmp]="hehe"

# echo ${error_count["hehe"]}

# echo "${!error_count[@]}"

while read -r mon day time host name error remaining; do
    #bagian a
    username=$(echo $remaining | sed 's/.*(\(.*\))/\1/')
    error_message=$(echo $remaining | sed 's/([^()]*)//g')
    error_message_parsed=$(echo $error_message | sed 's/[^a-zA-Z ]//g')
    echo "Jenis Log: $error "
    echo "Pesan Log: $error_message_parsed"
    echo "Username: $username"
    echo -e "================"

    error_message_as_key=$(echo $error_message | sed 's/[^a-zA-Z]//g')
    # echo $error_message_as_key
    can=1
    for key in "${!error_count[@]}"; do
        if [ $key == $error_message_as_key ] ; then
            can=0
        fi
    done
    if [ $can == 0 ] ; then
        error_count[$error_message_as_key]=`expr ${error_count[$error_message_as_key]} + 1`
        # echo ${error_count[$error_message_as_key]}
    else
        error_count[$error_message_as_key]=1
        error_name[$error_message_as_key]=$error_message_parsed
    fi

    can=0
    for key in "${!personal_error_count[@]}" ; do
        if [ $key == $username ] ; then
            can=0
        fi
    done
    
    if [ $can == 1 ] ; then
        personal_error_count[$username]=0
        personal_info_count[$username]=0
    fi
    if [ $error == "ERROR" ] ; then
        personal_error_count[$username]=`expr ${personal_error_count[$username]} + 1`
        # echo "${personal_error_count[$username]}"
    else
        personal_info_count[$username]=`expr ${personal_info_count[$username]} + 1`
    fi
done

# error_count[$test]=1

#bagian b
for key in "${!error_name[@]}"; do 
    printf "${error_count[$key]} => "
    printf "${error_name[$key]}\n"
    # echo
done

#bagian c
for key in "${!personal_error_count[@]}"; do 
    printf "${personal_error_count[$key]} error => "; 
    printf "$key\n"
done

echo -e

for key in "${!personal_info_count[@]}"; do 
    printf "${personal_info_count[$key]} info => "; 
    printf "$key\n"
done
# echo ${!personal_error_count[@]}