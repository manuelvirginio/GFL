#Warn
#NoEnv
#SingleInstance Force

CoordMode, Mouse Client
CoordMode, Pixel Client
CoordMode, Tooltip, Screen
SetWorkingDir, %A_ScriptDir%/Buttons
WinSet, AlwaysOnTop, On, BlueStacks
SetDefaultMouseSpeed, 5
LikeCount := 0

Tooltip, Dorms Liked: %LikeCount%, 300, 23, 3
LikeAll:
Loop {
WinActivate BlueStacks
PressButtonCheck("Message.PNG", "Like.PNG" , 90, 38)
LikeCount := LikeCount + 1
Tooltip, Dorms Liked: %LikeCount%, 300, 23, 3
PressButton("Next.PNG", 44, 39)
if LikeCount = 50
	Break
}
MsgBox All dorms liked.

F1::Pause

Esc::
WinSet, AlwaysOnTop, Off, BlueStacks
ExitApp

PressButtonCheck(ImageNameFinal, ImageNameInitial, ImageInitialW, ImageInitialH) {
	Loop {
	Tooltip, Searching for %ImageNameFinal%, 0, 0, 1
	ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageNameFinal%
		if ErrorLevel = 2
		{
		MsgBox Error encountered searching for %ImageNameFinal%.
		}
		else if Errorlevel = 1
		{
		Tooltip, %ImageNameFinal% not found, 0, 23, 2
		ImageSearch, ImageInitialXmin, ImageInitialYmin, 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageNameInitial%
			if ErrorLevel = 2
			{				
			MsgBox Error encountered searching for %ImageNameInitial%.
			}
			else if Errorlevel = 1
			{
			Tooltip, %ImageNameInitial% not found, 0, 23, 2
			}
			else
			{
			Tooltip, %ImageNameInitial% found, 0, 23, 2
			WinActivate, BlueStacks
			ImageInitialXmax := ImageInitialXmin + ImageInitialW
			ImageInitialYmax := ImageInitialYmin + ImageInitialH
			ImageInitialXVar := Randomize(ImageInitialXmin, ImageInitialXmax)
			ImageInitialYVar := Randomize(ImageInitialYmin, ImageInitialYmax)
			MouseMove, ImageInitialXVar, ImageInitialYVar
			Click, Down
			Sleep, Randomize(50, 100)
			Click, Up
			Sleep, Randomize(50, 100)
			}
		Sleep, Randomize(100, 250)
		Continue
		}
		else
		{
		Tooltip, %ImageNameFinal% found, 0, 23, 2
		Break
		}
	}
}

PressNodeWhenDelay(ImageName, Xmin, Ymin, Xmax, Ymax){
	Loop {
		Tooltip, Searching for %ImageName%, 0, 0, 1
		ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageName%
			if ErrorLevel = 2
			{
			MsgBox Error encountered searching for %ImageName%.
			}
			else if ErrorLevel = 1
			{
			Tooltip, %ImageName% not found, 0, 23, 2
			Continue
			}
			else	
			{
			TimedSleep(1)
			Tooltip, %ImageName% found, 0, 23, 2
			WinActivate, BlueStacks
			XVar := Randomize(Xmin, Xmax)
			YVar := Randomize(Ymin, Ymax)
			MouseMove, XVar, YVar
			Click, Down
			Sleep, Randomize(50, 100)
			Click, Up
			Sleep, Randomize(50, 100)
			Return
			}		
	}
}

DoublePressNodeWhen(ImageName, Xmin, Ymin, Xmax, Ymax){
	Loop {
		Tooltip, Searching for %ImageName%, 0, 0, 1
		ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageName%
			if ErrorLevel = 2
			{
			MsgBox Error encountered searching for %ImageName%.
			}
			else if ErrorLevel = 1
			{
			Tooltip, %ImageName% not found, 0, 23, 2
			Continue
			}
			else	
			{
			TimedSleep(1)
			Tooltip, %ImageName% found, 0, 23, 2
			WinActivate, BlueStacks
			XVar := Randomize(Xmin, Xmax)
			YVar := Randomize(Ymin, Ymax)
			MouseMove, XVar, YVar
			Click, Down
			Sleep, Randomize(50, 100)
			Click, Up
			Sleep, Randomize(50, 100)
			Click, Down
			Sleep, Randomize(50, 100)
			Click, Up
			Sleep, Randomize(50, 100)
			Return
			}		
	}
}

PressNodeWhen(ImageName, Xmin, Ymin, Xmax, Ymax){
	Loop {
		Tooltip, Searching for %ImageName%, 0, 0, 1
		ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageName%
			if ErrorLevel = 2
			{
			MsgBox Error encountered searching for %ImageName%.
			}
			else if ErrorLevel = 1
			{
			Tooltip, %ImageName% not found, 0, 23, 2
			Continue
			}
			else	
			{
			TimedSleep(1)
			Tooltip, %ImageName% found, 0, 23, 2
			WinActivate, BlueStacks
			XVar := Randomize(Xmin, Xmax)
			YVar := Randomize(Ymin, Ymax)
			MouseMove, XVar, YVar
			Click, Down
			Sleep, Randomize(50, 100)
			Click, Up
			Sleep, Randomize(50, 100)
			Return
			}		
	}
}

PressNode(Xmin, Ymin, Xmax, Ymax) {
	WinActivate, BlueStacks
	XVar := Randomize(Xmin, Xmax)
	YVar := Randomize(Ymin, Ymax)
	MouseMove, XVar, YVar
	Click, Down
	Sleep, Randomize(50, 100)
	Click, Up
	Sleep, Randomize(50, 100)
	Return
}

PressButtonDelay(ImageName, ImageW, ImageH) {
	Loop {
		Tooltip, Searching for %ImageName%, 0, 0, 1
		ImageSearch, Xmin, Ymin, 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageName%
			if ErrorLevel = 2
			{
			MsgBox Error encountered searching for %ImageName%.
			}
			else if ErrorLevel = 1
			{
			Tooltip, %ImageName% not found, 0, 23, 2
			Continue
			}
			else	
			{
			TimedSleep(1)
			Tooltip, %ImageName% found, 0, 23, 2
			WinActivate, BlueStacks
			Xmax := Xmin + ImageW
			Ymax := Ymin + ImageH
			XVar := Randomize(Xmin, Xmax)
			YVar := Randomize(Ymin, Ymax)
			MouseMove, XVar, YVar
			Click, Down
			Sleep, Randomize(50, 100)
			Click, Up
			Sleep, Randomize(50, 100)
			Return
			}		
	}
}

PressButton(ImageName, ImageW, ImageH) {
	Loop {
		Tooltip, Searching for %ImageName%, 0, 0, 1
		ImageSearch, Xmin, Ymin, 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageName%
			if ErrorLevel = 2
			{
			MsgBox Error encountered searching for %ImageName%.
			}
			else if ErrorLevel = 1
			{
			Tooltip, %ImageName% not found, 0, 23, 2
			Continue
			}
			else	
			{
			Tooltip, %ImageName% found, 0, 23, 2
			WinActivate, BlueStacks
			Xmax := Xmin + ImageW
			Ymax := Ymin + ImageH
			XVar := Randomize(Xmin, Xmax)
			YVar := Randomize(Ymin, Ymax)
			MouseMove, XVar, YVar
			Click, Down
			Sleep, Randomize(50, 100)
			Click, Up
			Sleep, Randomize(50, 100)
			Return
			}		
	}
}

PressNodeCheck(ImageNameFinal, ImageNameInitial, Xmin, Ymin, Xmax, Ymax) {
	LoopCheck:
	Loop {
	Tooltip, Searching for %ImageNameFinal%, 0, 0, 1
	ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageNameFinal%
		if ErrorLevel = 2
		{
		MsgBox Error encountered searching for %ImageNameFinal%.
		}
		else if Errorlevel = 1
		{
		Tooltip, %ImageNameFinal% not found, 0, 23, 2
		ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageNameInitial%
			if ErrorLevel = 2
			{				
			MsgBox Error encountered searching for %ImageNameInitial%.
			}
			else if Errorlevel = 1
			{
			Tooltip, %ImageNameInitial% not found, 0, 23, 2
			}
			else
			{
			Tooltip, %ImageNameInitial% found, 0, 23, 2
			WinActivate, BlueStacks
			XVar := Randomize(Xmin, Xmax)
			YVar := Randomize(Ymin, Ymax)
			MouseMove, XVar, YVar
			Click, Down
			Sleep, Randomize(50, 100)
			Click, Up
			Sleep, Randomize(50, 100)
			}
		Sleep, Randomize(100, 250)
		Goto, LoopCheck
		}
		else
		{
		Tooltip, %ImageNameFinal% found, 0, 23, 2
		Break
		}
	}
}

Randomize(Rmin,Rmax) {
	Random, OutputR, %Rmin%, %Rmax%
	Return OutputR
	}

TimedSleep(S) {
	SleepMultiple := Randomize(900, 1000)
	Sleep, SleepMultiple * S
	return
	}