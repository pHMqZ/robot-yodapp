Write-Host "Iniciando ambiente de testes..." -ForegroundColor Green


# 1. Iniciar o servidor do Appium
Write-Host "Iniciando servidor Appium..." -ForegroundColor Yellow
function Start-AppiumServer {
    try {
        # Verifica se o Appium está instalado globalmente
        $appiumVersion = npm list -g appium
        if (!$appiumVersion) {
            Write-Host "Appium não encontrado. Instalando globalmente..."
            npm install -g appium
        }

        # Verifica se o UIAutomator2 está instalado
        Write-Host "Verificando UIAutomator2..." -ForegroundColor Yellow
        $uiautomator2Check = appium driver list | Select-String "uiautomator2"
        if (!$uiautomator2Check) {
            Write-Host "UIAutomator2 não encontrado. Instalando driver..." -ForegroundColor Yellow
            
            # Tenta primeiro instalar o driver usando npm diretamente
            try {
                appium driver install --source=npm uiautomator2
                if ($LASTEXITCODE -eq 0) {
                    Write-Host "UIAutomator2 instalado com sucesso via npm!" -ForegroundColor Green
                } else {
                    # Se falhar, tenta o método alternativo com appium driver install
                    Write-Host "Tentando método alternativo de instalação..." -ForegroundColor Yellow
                    $result = npm install -g appium-uiautomator2-driver
                    if ($LASTEXITCODE -eq 0) {
                        Write-Host "UIAutomator2 instalado com sucesso via appium driver install!" -ForegroundColor Green
                    } else {
                        throw "Falha em ambos os métodos de instalação do UIAutomator2"
                    }
                }
            }
            catch {
                Write-Host "Erro durante a instalação do UIAutomator2: $_" -ForegroundColor Red
                throw "Falha na instalação do UIAutomator2"
            }
        } else {
            Write-Host "UIAutomator2 já está instalado" -ForegroundColor Green
        }

        # Mata qualquer processo existente do Appium
        Get-Process | Where-Object { $_.ProcessName -eq "node" -and $_.CommandLine -like "*appium*" } | Stop-Process -Force
        Start-Sleep -Seconds 2

        # Inicia o Appium com npm
        $appiumProcess = Start-Process npm -ArgumentList "exec appium" -NoNewWindow -PassThru
        Start-Sleep -Seconds 5

        # Verifica se o processo está rodando
        if ($appiumProcess.HasExited) {
            throw "Appium falhou ao iniciar"
        }

        Write-Host "Servidor Appium iniciado com sucesso na porta 4723" -ForegroundColor Green
    }
    catch {
        Write-Host "Erro ao iniciar Appium: $_" -ForegroundColor Red
        exit 1
    }
}

# Verifica se o Appium já está em execução
$appiumRunning = Get-NetTCPConnection -LocalPort 4723 -ErrorAction SilentlyContinue
if (-not $appiumRunning) {
    Start-AppiumServer
} else {
    Write-Host "O servidor Appium já está em execução na porta 4723."
}
Start-Sleep -Seconds 5

# 2. Ativa o Appium Inspector
$inspectorPath = "C:\Program Files\Appium Inspector\Appium Inspector.exe"
if (Test-Path $inspectorPath) {
    Start-Process $inspectorPath
    Write-Output "Appium Inspector started."
} else {
    Write-Host "Appium Inspector não encontrado em: $inspectorPath" -ForegroundColor Yellow
}

# 3. Iniciar o emulador Android
Write-Host "Iniciando emulador Android..." -ForegroundColor Yellow
$emulatorPath = "C:\Users\$env:USERNAME\AppData\Local\Android\Sdk\emulator\emulator.exe"
if (Test-Path $emulatorPath) {
    Start-Process $emulatorPath -ArgumentList "-avd", "Android_Phone", "-no-snapshot-load" -NoNewWindow
} else {
    Write-Host "Emulador não encontrado em: $emulatorPath" -ForegroundColor Red
    exit 1
}

# 4. Aguardar o emulador iniciar completamente
Write-Host "Aguardando o emulador iniciar..." -ForegroundColor Yellow
$timeout = 60
$elapsed = 0
$deviceFound = $false

while ($elapsed -lt $timeout -and -not $deviceFound) {
    $adbDevices = & adb devices
    if ($adbDevices -match "emulator") {
        $deviceFound = $true
        Write-Host "Emulador conectado com sucesso!" -ForegroundColor Green
        break
    }
    Start-Sleep -Seconds 5
    $elapsed += 5
    Write-Host "Ainda aguardando o emulador... ($elapsed segundos)" -ForegroundColor Yellow
}

if (-not $deviceFound) {
    Write-Host "Timeout: Emulador não iniciou no tempo esperado" -ForegroundColor Red
    exit 1
}

Write-Host "Ambiente iniciado! Verifique o App para iniciar os testes." -ForegroundColor Green