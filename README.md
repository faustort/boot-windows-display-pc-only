# Boot Windows Display PC Only

Este utilitário força o Windows a exibir apenas o monitor interno (modo "PC apenas") sempre que o computador é ligado ou retomado do modo de suspensão.

## 🚀 Instalação automática

1. Abra o **PowerShell como Administrador**.
2. Execute:

   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force
   iwr -useb https://raw.githubusercontent.com/<seu-usuario>/boot-windows-display-pc-only/main/installer.ps1 | iex
   ```
