# Running Hospital_Management_System (Windows PowerShell)

Quick helper instructions to run the GUI or console app on Windows using the included Maven wrapper.

Prerequisites:
- JDK (Java) installed and `java` available on `PATH`.
- Git/Maven wrapper files are already included in the repo (`mvnw.cmd`).

Run the JavaFX GUI (shows the JavaFX window):
1. Open PowerShell in the project root.
2. Run:
```powershell
.\run_gui.ps1
```

Run the console (text) app (`Main`):
```powershell
.\run_console.ps1
```

If `run_gui.ps1` reports `java not found on PATH`, make sure your JDK is installed and that `java` is on PATH. To set `JAVA_HOME` permanently (optional):
```powershell
setx JAVA_HOME "C:\Program Files\Java\jdk-24" /M
```

Notes:
- These scripts set `JAVA_HOME` for the current session by detecting the `java` executable on PATH, then run the project's Maven wrapper, which avoids needing `mvn` on PATH.
- If you still have errors, copy the terminal output here and I will help troubleshoot further.
