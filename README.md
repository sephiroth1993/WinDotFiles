# 🖥️ Instalador Automático de Apps

Script de instalación automática de aplicaciones.

---

## 📦 Aplicaciones que se instalan

### 🎮 Aplicaciones Generales
| Aplicación | ID Winget |
|---|---|
| Steam | `Valve.Steam` |
| Discord | `Discord.Discord` |
| Microsoft PowerToys | `Microsoft.PowerToys` |
| BCUninstaller | `Klocman.BulkCrapUninstaller` |
| Sumatra PDF | `SumatraPDF.SumatraPDF` |
| BleachBit | `BleachBit.BleachBit` |
| HakuNeko | `HakuNeko.HakuNeko` |
| YACReader | `YACReader.YACReader` |
| UniGetUI | `MartiCliment.UniGetUI` |
| IrfanView | `IrfanSkiljan.IrfanView` |
| Visual Studio Code | `Microsoft.VisualStudioCode` |
| Spotify | `Spotify.Spotify` |
| LocalSend | `LocalSend.LocalSend` |
| qBittorrent | `qBittorrent.qBittorrent` |
| Playnite | `Playnite.Playnite` |
| Prism Launcher | `PrismLauncher.PrismLauncher` |
| ImageMagick | `ImageMagick.ImageMagick` |

### 🛠️ Herramientas CLI (con PATH configurado)
| Aplicación | ID Winget | PATH |
|---|---|---|
| FFMPEG | `Gyan.FFmpeg` | `%ProgramFiles%\ffmpeg\bin` |
| yt-dlp | `yt-dlp.yt-dlp` | `%LOCALAPPDATA%\Microsoft\WinGet\Links` |

### 🔷 .NET Framework y .NET Runtime
| Versión | Método |
|---|---|
| .NET Framework 3.5 | DISM (característica de Windows) |
| .NET Framework 4.8 | `Microsoft.DotNet.Framework.DeveloperPack_4` |
| .NET 6 Runtime | `Microsoft.DotNet.Runtime.6` |
| .NET 8 Runtime (LTS) | `Microsoft.DotNet.Runtime.8` |
| .NET 9 Runtime | `Microsoft.DotNet.Runtime.9` |

### ☕ Java - Adoptium Temurin
| Versión | JDK | JRE |
|---|---|---|
| Java 8 (LTS) | ✅ | ✅ |
| Java 11 (LTS) | ✅ | ✅ |
| Java 17 (LTS) | ✅ | ✅ |
| Java 21 (LTS) | ✅ | ✅ |

### 🔧 Visual C++ Redistributable
| Versión | Estado |
|---|---|
| VC++ 2005 | ⚠️ No disponible en Winget — [Descargar manualmente](https://www.microsoft.com/en-us/download/details.aspx?id=26347) |
| VC++ 2008 | ⚠️ No disponible en Winget — [Descargar manualmente](https://www.microsoft.com/en-us/download/details.aspx?id=26368) |
| VC++ 2010 | ✅ `Microsoft.VCRedist.2010.x64` |
| VC++ 2012 | ✅ `Microsoft.VCRedist.2012.x64` |
| VC++ 2013 | ✅ `Microsoft.VCRedist.2013.x64` |
| VC++ 2015-2022 | ✅ `Microsoft.VCRedist.2015+.x64` |

---

## 🚀 Uso

### Descargar el EXE
Andá a la sección [Releases](../../releases) del repositorio y descargá la última versión del instalador.

---

## ⚠️ Requisitos
- Windows 10 / 11 x64
- Winget instalado (viene preinstalado en Windows 11 y Windows 10 actualizado)
- Conexión a internet
