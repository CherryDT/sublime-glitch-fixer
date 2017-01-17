#Include "windows.bi"
#Include "useful/registry_standalone.bi"

Dim appname As ZString * MAX_PATH
GetModuleFilename(GetModuleHandle(NULL), @appname, SizeOf(appname))

Var reg = RegObj.RegLib(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Run")
reg.SetValue("Sublime Glitch Fixer", appname)

Function EnumWindowsProc(hWndSubl As HWND, lParam As LPARAM) As BOOL
	Dim cn As ZString * 100
	GetClassName(hWndSubl, @cn, SizeOf(cn))
	If cn = "PX_WINDOW_CLASS" Then
		Dim rc As RECT
		GetWindowRect(hWndSubl, @rc)
		MoveWindow(hWndSubl, rc.left, rc.top, rc.right - rc.left, rc.bottom - rc.top - 25, TRUE)
		MoveWindow(hWndSubl, rc.left, rc.top, rc.right - rc.left, rc.bottom - rc.top, TRUE)
	EndIf
	Return TRUE
End Function

Dim lastVisibility As Boolean = TRUE
Do
	Sleep 250, 1
	
	Var hWnd = FindWindow("VirtualConsoleClass", NULL)
	Var visibility = IsWindowVisible(hWnd) ' If hWnd is NULL it will also be FALSE...
	
	If visibility <> lastVisibility AndAlso visibility = FALSE Then
		
		EnumWindows(@EnumWindowsProc, NULL)
		
	EndIf
	
	lastVisibility = visibility
Loop
