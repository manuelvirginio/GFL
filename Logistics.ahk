#Warn
#NoEnv
#SingleInstance Force

CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, Tooltip, Screen
SetWorkingDir %A_ScriptDir%
WinSet, AlwaysOnTop, On, BlueStacks
LogisticsCount := 0
AchievementCount := 0
Tooltip, Completed Achievements: %AchievementCount%, 300, 46, 3
Tooltip, Completed Logistics: %LogisticsCount%, 300, 0, 4

Log1:
Loop {
	Tooltip, Logistics script running: Part 1., 0, 46, 1
	Tooltip, Scanning for completed logistics., 0, 69, 2
	ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack Buttons/FinishTrue.png
		if ErrorLevel = 2
		{
		MsgBox Error searching for FinishTrue.png.
		}
		else if ErrorLevel = 1
		{
		Tooltip, No completed logistics found., 0, 69, 2
		Goto Log3
		}
		else
		{
		Tooltip, Detected completed logistic., 0, 69, 2
		TimedSleep(1)
		CustomControlClick(10, 50, 820, 655)
		Log2:
		Loop {
			Tooltip, Redeploying echelon., 0, 69, 2
			ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, Buttons/Confirm.png
			TimedSleep(2)
			if ErrorLevel = 2
			{
			MsgBox Error searching for Confirm.png.
			}
			else if ErrorLevel = 1
			{
			Tooltip, Buttons/Confirm.png not found., 0, 69, 2
			Goto Log2
			}
			else
			{
			Tooltip, Echelon redeployed, 0, 69, 2
			TimedSleep(1)
			CustomControlClick(430, 420, 530, 460)
			LogisticsCount := LogisticsCount + 1
			Tooltip, Completed Logistics: %LogisticsCount%, 300, 0, 4
			Break Log2
			}
			}
		Continue
		}
}
Log3:
Loop {
	Tooltip, Logistics script running: Part 2., 0, 46, 1
	Tooltip, Scanning for completed logistics., 0, 69, 2
	ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack Buttons/FinishTrue2.png
		if ErrorLevel = 2
		{
		MsgBox Error searching for FinishTrue2.png.
		}
		else if ErrorLevel = 1
		{
		Tooltip, No completed logistics found., 0, 69, 2
		Goto Log5
		}
		else
		{
		Tooltip, Detected completed logistic., 0, 69, 2
		TimedSleep(1)
		CustomControlClick(10, 50, 820, 655)
		Log4:
		Loop {
			Tooltip, Redeploying echelon., 0, 69, 2
			ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, Buttons/Confirm.png
			TimedSleep(2)
			if ErrorLevel = 2
			{
			MsgBox Error searching for Confirm.png.
			}
			else if ErrorLevel = 1
			{
			Tooltip, Buttons/Confirm.png not found., 0, 69, 2
			Goto Log4
			}
			else
			{
			Tooltip, Echelon redeployed, 0, 69, 2
			TimedSleep(1)
			CustomControlClick(430, 420, 530, 460)
			LogisticsCount := LogisticsCount + 1
			Tooltip, Completed Logistics: %LogisticsCount%, 300, 0, 4
			Break Log4
			}
			}
		Continue
		}
}
Log5:
Loop {
	Tooltip, Logistics script running: Part 2., 0, 46, 1
	Tooltip, Scanning for completed achievements., 0, 69, 2
	ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, Buttons/AchievementClose.png
		if ErrorLevel = 2
		{
		MsgBox Error searching for AchievementClose.png.
		}
		else if ErrorLevel = 1
		{
		Tooltip, No completed achievements found., 0, 69, 2
		Goto Log1
		}
		else
		{
		Tooltip, Detected completed achievement., 0, 69, 2
		TimedSleep(1)
		PressButton("Buttons/AchievementClose.png", 105, 39)
		AchievementCount := AchievementCount + 1
		Tooltip, Completed Achievements: %AchievementCount%, 300, 46, 3
		Goto Log1
		}
}

PressButton(ImageName, Xmax, Ymax) {
	Loop {
		Tooltip, Searching for %ImageName%, 0, 0, 1
		ImageSearch, Xmin, Ymin, 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageName%
			if ErrorLevel = 2
			{
			MsgBox Error encountered searching for %ImageName%.
			}
			else if ErrorLevel = 1
			{
			Tooltip, %ImageName% not found, 0, 69, 2
			Continue
			}
			else	
			{
			Tooltip, %ImageName% found, 0, 69, 2
			CustomControlClick(Xmin, Ymin, Xmax, Ymax)
			Return
			}		
	}
}

CustomControlClick(Xmin, Ymin, Xmax, Ymax) {
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

Randomize(min,max) {
	Random, OutputR, %min%, %max%
	Return OutputR
	}

TimedSleep(n) {
	SleepTime := Randomize(450, 550)
	Sleep, SleepTime * n
	return
	}

F2::Pause

Esc::
WinSet, AlwaysOnTop, Off, BlueStacks
ExitApp