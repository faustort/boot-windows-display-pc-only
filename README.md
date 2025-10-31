# 🖥️ Boot Windows Display PC Only — Corrija o Problema de Inicializar na Tela Errada

O **Boot Windows Display PC Only** é um script gratuito que **força o Windows a usar automaticamente apenas o monitor interno do computador** (modo “PC apenas”) sempre que o sistema é **ligado** ou **retomado da suspensão**.

Ideal para quem conecta o PC ou notebook a uma **TV via HDMI** e depois enfrenta o problema de o **Windows continuar exibindo a tela na TV da sala** — mesmo quando o computador já está de volta à mesa.  
Com este script, o sistema **detecta e corrige automaticamente** o modo de exibição, garantindo que a tela principal volte para o monitor do computador no momento da inicialização.

---

## 🔧 Problema Resolvido

Você já ligou o PC e percebeu que o Windows “sumiu” porque continuou usando o monitor externo da sala?  
Esse script corrige exatamente isso:

- **Desativa monitores HDMI ou externos** logo na inicialização.  
- **Ativa somente a tela principal** (modo `/internal`).  
- **Executa automaticamente** no boot e ao acordar da suspensão.  
- Evita a necessidade de apertar manualmente `Win + P` toda vez.

---

## 🧠 Como Funciona

O utilitário usa o comando nativo do Windows:

```
C:\\Windows\\System32\\DisplaySwitch.exe /internal
```

Esse comando é executado de forma automática por uma **tarefa agendada**, criada durante a instalação, garantindo que **o Windows sempre inicie na tela correta** — sem depender de intervenção manual.

---

## 💡 Por que usar?

- Soluciona falhas de detecção de monitores HDMI.  
- Ideal para setups híbridos (notebook + TV).  
- Evita perda de tempo reconfigurando telas.  
- Totalmente automatizado e leve.  
- 100% seguro, usa apenas comandos internos do sistema.

---

## 🚀 Instalação Automática

1. **Abra o PowerShell como Administrador**
2. Execute o comando abaixo:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iwr -useb https://raw.githubusercontent.com/faustort/boot-windows-display-pc-only/main/installer.ps1 | iex
```

O script será copiado para `C:\\ProgramData\\ForcePCOnly` e uma tarefa agendada será criada para executá-lo no boot e no login do sistema.

---

## ⚙️ Requisitos

- Windows 10 ou 11  
- Permissão de administrador  
- PowerShell 5.1 ou superior  

---

## 📜 Licença

Distribuído sob a **Licença MIT**.  
Projeto open-source mantido por [Fausto Rodrigo Toloi](https://github.com/faustort).