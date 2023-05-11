# Script de PowerShell para poner el sistema en suspensión
# Se requieren permisos de administrador para ejecutar este script

# Establecer el tiempo de espera para la suspensión (en segundos)
$timeout = 5

# Mostrar un mensaje de confirmación antes de suspender el sistema
$msg = New-Object -ComObject WScript.Shell
$confirm = $msg.Popup("¿Estás seguro de que deseas suspender el sistema?", $timeout, "Suspensión del sistema", 4)

# Si se hace clic en "Aceptar" en la ventana de confirmación, suspender el sistema
if ($confirm -eq 6) {
    Start-Sleep -Seconds $timeout
    [System.Windows.Forms.Application]::SetSuspendState("Suspend", $false, $false)
}
