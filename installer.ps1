# Requires admin
$scriptPath = "C:\ProgramData\ForcePCOnly"
$batFile = "$scriptPath\ForcePCOnly.bat"
$taskName = "Forçar Tela Interna (DisplaySwitch)"

# Cria pasta se não existir
if (-not (Test-Path $scriptPath)) {
    New-Item -Path $scriptPath -ItemType Directory | Out-Null
}

# Copia o arquivo BAT do repositório atual
Copy-Item ".\ForcePCOnly.bat" $batFile -Force

# Remove tarefa anterior se existir
if (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Cria a tarefa com dois disparadores (boot e wake)
$action = New-ScheduledTaskAction -Execute $batFile
$triggerBoot = New-ScheduledTaskTrigger -AtStartup
$triggerWake = New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -Action $action -Trigger @($triggerBoot, $triggerWake) `
    -TaskName $taskName -Description "Força a exibição apenas no monitor interno" `
    -User "SYSTEM" -RunLevel Highest
Write-Host "✅ Instalação concluída. O script foi copiado para $scriptPath e a tarefa agendada."
