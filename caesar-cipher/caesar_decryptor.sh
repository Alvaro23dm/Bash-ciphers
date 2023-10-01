#!/bin/bash

#USO: bash cesar_descifrado_texto.sh --entrada secreto_cifrado.txt --salida secreto_descifrado.txt --clave 4

# Inicializa las variables de entrada
archivo_entrada=""
archivo_salida=""
clave=""

# Procesa los argumentos de línea de comandos
while [[ $# -gt 0 ]]; do
  case "$1" in
    --input)
      archivo_entrada="$2"
      shift 2
      ;;
    --output)
      archivo_salida="$2"
      shift 2
      ;;
    --key)
      clave="$2"
      shift 2
      ;;
    *)
      echo "Opción no reconocida: $1"
      exit 1
      ;;
  esac
done

# Verifica si se proporcionó la opción --entrada
if [ -z "$archivo_entrada" ]; then
  echo "Error: La opción --entrada es obligatoria."
  exit 1
fi

# Verifica si se proporcionó la opción --salida
if [ -z "$archivo_salida" ]; then
  echo "Error: La opción --salida es obligatoria."
  exit 1
fi

# Verifica si se proporcionó la opción --clave
if [ -z "$clave" ]; then
  echo "Error: La opción --clave es obligatoria."
  exit 1
fi



# Lee el texto cifrado desde el archivo de entrada
texto_cifrado=$(cat "$archivo_entrada")

# Inicializa el texto descifrado
texto_descifrado=""

# Bucle para descifrar el texto
for ((iter=0; iter<${#texto_cifrado}; iter++)); do
    caracter_cifrado="${texto_cifrado:$iter:1}"
    caracter_ascii_cifrado=$(printf "%d" "'$caracter_cifrado")
    caracter_ascii_original=$(( ($caracter_ascii_cifrado - 65 - clave + 26) % 26 + 65 ))
    caracter_original=$(printf '%b' "$(printf '\\%03o' $caracter_ascii_original)")
    texto_descifrado+="$caracter_original"
done

# Guarda el texto descifrado en el archivo de salida
echo "$texto_descifrado" >> "$archivo_salida"

