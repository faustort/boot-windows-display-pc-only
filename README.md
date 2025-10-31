# Boot Windows Display PC Only

Força o Windows a usar apenas o monitor interno (modo “PC apenas”) automaticamente toda vez que o computador é ligado ou retomado do modo de suspensão.

---

## Instalação Automática

1. Abra o PowerShell como Administrador
2. Execute o comando abaixo:

Set-ExecutionPolicy Bypass -Scope Process -Force
iwr -useb https://raw.githubusercontent.com/faustort/boot-windows-display-pc-only/main/installer.ps1 | iex

Isto fará o download e executará o instalador, criando o script em C:\\ProgramData\\ForcePCOnly e agendando a tarefa automaticamente.

---

## Estrutura do Projeto

Arquivo          | Função
-----------------|--------------------------------------------------------------
ForcePCOnly.bat  | Executa o comando DisplaySwitch.exe /internal
installer.ps1    | Cria pasta, copia o script e agenda a tarefa no Windows
LICENSE          | Licença MIT
README.md        | Documentação do projeto

---

## Desinstalação

Unregister-ScheduledTask -TaskName "Forçar Tela Interna (DisplaySwitch)" -Confirm:$false
Remove-Item "C:\\ProgramData\\ForcePCOnly" -Recurse -Force

---

## Requisitos

- Windows 10 ou 11
- Permissão de administrador
- PowerShell 5.1+
- Funciona em notebooks e desktops

---

## Como Funciona

O script usa o comando nativo do Windows:

C:\\Windows\\System32\\DisplaySwitch.exe /internal

Esse comando ativa apenas o monitor interno, desativando monitores externos automaticamente.
A tarefa agendada executa esse comando no boot e no logon do usuário.

---

## Licença

Distribuído sob a Licença MIT. Consulte o arquivo LICENSE para mais detalhes.
 