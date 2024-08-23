Dim PathToExe
PathToExe = "PATH_TO_EXE"

If PathToExe = "PATH_TO_EXE" Then
    MsgBox "Error: No executable path set. Please follow the GitHub setup tutorial to configure the correct path.", vbExclamation, "Setup Required"
Else
    Set Shell = CreateObject("WScript.Shell")
    Shell.Run PathToExe, 0, False
End If