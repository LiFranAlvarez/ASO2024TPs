lisandro@lisandro-VirtualBox:~$ #!/bin/bash

# Generar un número aleatorio entre 1 y 100
number=$(( ( RANDOM % 100 ) + 1 ))

echo "Adivina el número entre 1 y 100."    
                                               
# Función para validar si es un número
function validar_entrada {
    while true; do
        read -p "Ingresa tu número: " guess
        if [[ $guess =~ ^[0-9]+$ ]]; then
            break                        
        else
            echo "Por favor, ingresa solo números enteros."
        fi                                                 
    done
}       
 
# Ciclo para adivinar el número
while true; do
    validar_entrada
                   
    if (( guess < number )); then
        echo "El número es más alto. Intenta de nuevo."
    elif (( guess > number )); then
        echo "El número es más bajo. Intenta de nuevo."
    else                                               
        echo "¡Felicidades! ¡Adivinaste el número $number!"
        break                                              
    fi       
done
