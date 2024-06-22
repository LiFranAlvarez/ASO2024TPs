lisandro@lisandro-VirtualBox:~$ #!/bin/bash

read -p "Ingresa un nombre: " NAME

URL="https://api.agify.io/?name=${NAME}"

RESPONSE=$(curl -s "${URL}")

# Verificar la solicitud
if [ $? -eq 0 ]; then
    # Extraer la edad probable
    AGE=$(echo "${RESPONSE}" | jq '.age')

    # Verificar si es una edad válida
    if [ "${AGE}" != "null" ]; then
        echo "La edad probable para el nombre ${NAME} es: ${AGE} años."
    else
        echo "No se pudo determinar la edad para el nombre ${NAME}."
    fi
else
    echo "Error al obtener los datos."
fi
