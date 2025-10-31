# Boot Windows Display PC Only - Instalador
# Autor: Fausto Rodrigo Toloi
# Repositório: https://github.com/faustort/boot-windows-display-pc-only

# Requer execução como administrador
$ErrorActionPreference = "Stop"

# Caminho fixo do script no sistema
$scriptPath = "C:\ProgramData\ForcePCOnly"
$batFile = "$scriptPath\ForcePCOnly.bat"
$taskName = "Forçar Tela Interna (DisplaySwitch)"

Write-Host "📦 Iniciando instalação do utilitário Boot Windows Display PC Only..." -ForegroundColor Cyan

# Cria a pasta caso não exista
if (-not (Test-Path $scriptPath)) {
    New-Item -Path $scriptPath -ItemType Directory | Out-Null
    Write-Host "✅ Pasta criada em $scriptPath"
}

# Copia o arquivo .bat do diretório atual
Copy-Item ".\ForcePCOnly.bat" $batFile -Force
Write-Host "✅ Script copiado para $batFile"

# Remove a tarefa anterior, se existir
if (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
    Write-Host "♻️ Tarefa anterior removida."
}

# Cria as ações e disparadores
$action = New-ScheduledTaskAction -Execute $batFile
$triggerBoot = New-ScheduledTaskTrigger -AtStartup
$triggerLogon = New-ScheduledTaskTrigger -AtLogOn

# Registra nova tarefa
Register-ScheduledTask -Action $action -Trigger @($triggerBoot, $triggerLogon) `
    -TaskName $taskName `
    -Description "Força o Windows a usar apenas o monitor interno (DisplaySwitch /internal)" `
    -User "SYSTEM" -RunLevel Highest

Write-Host "✅ Instalação concluída com sucesso!"
Write-Host "🖥️ O utilitário será executado automaticamente a cada inicialização ou login."
