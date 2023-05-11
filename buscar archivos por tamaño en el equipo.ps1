# Script de PowerShell para buscar los archivos más grandes en todo el ordenador con permisos de administrador

# Especificar la ruta del directorio base
$baseDir = "C:\"

# Especificar el tamaño mínimo del archivo (en MB)
$minSize = 100

# Buscar todos los archivos en el directorio base y subdirectorios con permisos de administrador
$files = Get-ChildItem -Path $baseDir -Recurse -File -Force

# Filtrar los archivos por tamaño
$largeFiles = $files | Where-Object {$_.Length / 1MB -ge $minSize}

# Ordenar los archivos por tamaño descendente
$largeFiles = $largeFiles | Sort-Object -Property Length -Descending

# Mostrar los archivos más grandes en la pantalla
foreach ($file in $largeFiles) {
    Write-Host "$($file.FullName) - Tamaño: $($file.Length / 1MB) MB"
}
