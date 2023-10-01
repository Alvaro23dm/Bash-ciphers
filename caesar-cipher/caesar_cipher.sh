#!/bin/bash

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

# Preproceso del texto
texto_preprocesado=$(cat "$archivo_entrada" | sed -e 'y/áÁéÉíÍóÓúÚñ/aAeEiIoOuUÑ/' -e "s/[^a-zA-Z'ñÑ]//g" | tr -d '[:space:]' | tr '[:lower:]' '[:upper:]')

# Inicializar texto cifrado
texto_cifrado=""

# Bucle para cifrar el texto
for ((iter=0; iter<${#texto_preprocesado}; iter++)); do
    caracter_ascii=$(printf "%d\n" "'${texto_preprocesado:$iter:1}")
    caracter_ascii_cifrado=$(( (($caracter_ascii - 65 + clave) % 26) + 65 ))
    caracter_cifrado=$(printf '%b' "$(printf '\\%03o' $caracter_ascii_cifrado)")
    texto_cifrado+="$caracter_cifrado"
done

echo $texto_cifrado >> $archivo_salida
