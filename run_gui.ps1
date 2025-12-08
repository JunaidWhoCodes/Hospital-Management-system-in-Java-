<#
Sets JAVA_HOME for the current PowerShell session (auto-detected from `java` on PATH)
and runs the project's Maven wrapper to launch the JavaFX GUI.
#>
$javaCmd = (Get-Command java -ErrorAction SilentlyContinue).Path
if (-not $javaCmd) {
    Write-Error "java not found on PATH. Install a JDK and ensure `java` is on PATH."
    exit 1
}
$bin = Split-Path $javaCmd -Parent
$jdk = Split-Path $bin -Parent
$env:JAVA_HOME = $jdk
Write-Host "JAVA_HOME set to $env:JAVA_HOME"
Write-Host "Running Maven wrapper: .\mvnw.cmd clean javafx:run"
& .\mvnw.cmd clean javafx:run