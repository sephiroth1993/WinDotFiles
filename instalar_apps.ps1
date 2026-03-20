# ============================================================
#  Script de instalacion automatica con Winget
#  Arquitectura: x64
# ============================================================

# Verificar que se ejecuta como Administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "ERROR: Este script debe ejecutarse como Administrador." -ForegroundColor Red
    Write-Host "Hace clic derecho en el archivo y selecciona 'Ejecutar como administrador'." -ForegroundColor Yellow
    pause
    exit
}

# Funcion para instalar con winget
function Install-App {
    param (
        [string]$Nombre,
        [string]$Id
    )
    Write-Host "`n>>> Instalando $Nombre..." -ForegroundColor Cyan
    winget install --id $Id --architecture x64 --silent --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "    OK: $Nombre instalado correctamente." -ForegroundColor Green
    } elseif ($LASTEXITCODE -eq -1978335189) {
        Write-Host "    INFO: $Nombre ya estaba instalado." -ForegroundColor Yellow
    } else {
        Write-Host "    ADVERTENCIA: $Nombre puede no haberse instalado correctamente (codigo: $LASTEXITCODE)." -ForegroundColor Red
    }
}

Write-Host "============================================================" -ForegroundColor White
Write-Host "   Iniciando instalacion de aplicaciones..." -ForegroundColor White
Write-Host "============================================================" -ForegroundColor White

# ------------------------------------------------------------
# APLICACIONES GENERALES
# ------------------------------------------------------------

Write-Host "`n[ APLICACIONES GENERALES ]" -ForegroundColor Magenta

Install-App "Steam"                      "Valve.Steam"
Install-App "Discord"                    "Discord.Discord"
Install-App "Microsoft PowerToys"        "Microsoft.PowerToys"
Install-App "BCUninstaller"              "Klocman.BulkCrapUninstaller"
Install-App "Sumatra PDF"                "SumatraPDF.SumatraPDF"
Install-App "BleachBit"                  "BleachBit.BleachBit"
Install-App "HakuNeko"                   "HakuNeko.HakuNeko"
Install-App "YACReader"                  "YACReader.YACReader"
Install-App "UniGetUI"                   "MartiCliment.UniGetUI"
Install-App "IrfanView"                  "IrfanSkiljan.IrfanView"
Install-App "Visual Studio Code"         "Microsoft.VisualStudioCode"
Install-App "Spotify"                    "Spotify.Spotify"
Install-App "LocalSend"                  "LocalSend.LocalSend"
Install-App "qBittorrent"                "qBittorrent.qBittorrent"
Install-App "Playnite"                   "Playnite.Playnite"
Install-App "Prism Launcher"             "PrismLauncher.PrismLauncher"
Install-App "ImageMagick"                "ImageMagick.ImageMagick"

# FFMPEG con PATH
Install-App "FFMPEG"                     "Gyan.FFmpeg"
Write-Host "    Agregando FFMPEG al PATH del sistema..." -ForegroundColor Cyan
$ffmpegPath = "$env:ProgramFiles\ffmpeg\bin"
$currentPath = [Environment]::GetEnvironmentVariable("PATH", "Machine")
if ($currentPath -notlike "*$ffmpegPath*") {
    [Environment]::SetEnvironmentVariable("PATH", "$currentPath;$ffmpegPath", "Machine")
    Write-Host "    OK: FFMPEG agregado al PATH." -ForegroundColor Green
} else {
    Write-Host "    INFO: FFMPEG ya estaba en el PATH." -ForegroundColor Yellow
}

# yt-dlp con PATH
Install-App "yt-dlp"                     "yt-dlp.yt-dlp"
Write-Host "    Agregando yt-dlp al PATH del sistema..." -ForegroundColor Cyan
$ytdlpPath = "$env:LOCALAPPDATA\Microsoft\WinGet\Links"
$currentPath = [Environment]::GetEnvironmentVariable("PATH", "Machine")
if ($currentPath -notlike "*$ytdlpPath*") {
    [Environment]::SetEnvironmentVariable("PATH", "$currentPath;$ytdlpPath", "Machine")
    Write-Host "    OK: yt-dlp agregado al PATH." -ForegroundColor Green
} else {
    Write-Host "    INFO: yt-dlp ya estaba en el PATH." -ForegroundColor Yellow
}

# ------------------------------------------------------------
# .NET FRAMEWORK Y .NET
# ------------------------------------------------------------

Write-Host "`n[ .NET FRAMEWORK Y .NET ]" -ForegroundColor Magenta

Write-Host "`n>>> Habilitando .NET Framework 3.5..." -ForegroundColor Cyan
dism /online /Enable-Feature /FeatureName:NetFx3 /All /NoRestart
Write-Host "    OK: .NET Framework 3.5 habilitado." -ForegroundColor Green

Install-App ".NET Framework 4.8"         "Microsoft.DotNet.Framework.DeveloperPack_4"
Install-App ".NET 6 Runtime"             "Microsoft.DotNet.Runtime.6"
Install-App ".NET 8 Runtime (LTS)"       "Microsoft.DotNet.Runtime.8"
Install-App ".NET 9 Runtime"             "Microsoft.DotNet.Runtime.9"

# ------------------------------------------------------------
# JAVA - ADOPTIUM TEMURIN
# ------------------------------------------------------------

Write-Host "`n[ JAVA - ADOPTIUM TEMURIN ]" -ForegroundColor Magenta

Install-App "Temurin 8 JDK (LTS)"        "EclipseAdoptium.Temurin.8.JDK"
Install-App "Temurin 8 JRE (LTS)"        "EclipseAdoptium.Temurin.8.JRE"
Install-App "Temurin 11 JDK (LTS)"       "EclipseAdoptium.Temurin.11.JDK"
Install-App "Temurin 11 JRE (LTS)"       "EclipseAdoptium.Temurin.11.JRE"
Install-App "Temurin 17 JDK (LTS)"       "EclipseAdoptium.Temurin.17.JDK"
Install-App "Temurin 17 JRE (LTS)"       "EclipseAdoptium.Temurin.17.JRE"
Install-App "Temurin 21 JDK (LTS)"       "EclipseAdoptium.Temurin.21.JDK"
Install-App "Temurin 21 JRE (LTS)"       "EclipseAdoptium.Temurin.21.JRE"

# ------------------------------------------------------------
# VISUAL C++ REDISTRIBUTABLE
# ------------------------------------------------------------

Write-Host "`n[ VISUAL C++ REDISTRIBUTABLE ]" -ForegroundColor Magenta

Install-App "Visual C++ 2010"            "Microsoft.VCRedist.2010.x64"
Install-App "Visual C++ 2012"            "Microsoft.VCRedist.2012.x64"
Install-App "Visual C++ 2013"            "Microsoft.VCRedist.2013.x64"
Install-App "Visual C++ 2015-2022"       "Microsoft.VCRedist.2015+.x64"

# ------------------------------------------------------------
# FINAL
# ------------------------------------------------------------

Write-Host "`n============================================================" -ForegroundColor White
Write-Host "   Instalacion completada." -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor White
Write-Host "`nRECORDATORIO: Instalar manualmente VC++ 2005 y 2008:" -ForegroundColor Yellow
Write-Host "   2005: https://www.microsoft.com/en-us/download/details.aspx?id=26347" -ForegroundColor Yellow
Write-Host "   2008: https://www.microsoft.com/en-us/download/details.aspx?id=26368" -ForegroundColor Yellow
Write-Host "`nRECORDATORIO: Reinicia el sistema para que los cambios de PATH tomen efecto." -ForegroundColor Yellow

pause
