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

# Baixa o arquivo .bat diretamente do repositório GitHub
$batUrl = "https://raw.githubusercontent.com/faustort/boot-windows-display-pc-only/main/ForcePCOnly.bat"
try {
    Invoke-WebRequest -Uri $batUrl -OutFile $batFile -UseBasicParsing
    Write-Host "✅ Script baixado de $batUrl para $batFile"
}
catch {
    Write-Host "❌ Falha ao baixar o arquivo ForcePCOnly.bat. Verifique sua conexão com a internet."
    exit 1
}

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
