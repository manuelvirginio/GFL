#Warn
#NoEnv
#SingleInstance Force

CoordMode, Mouse Client
CoordMode, Pixel Client
CoordMode, Tooltip, Screen
SetWorkingDir, %A_ScriptDir%/Buttons
WinSet, AlwaysOnTop, On, BlueStacks
SetDefaultMouseSpeed, 5
RunCount := 0

Tooltip, Completed Runs: %RunCount%, 300, 23, 3

Start:
WinActivate BlueStacks
PressButtonCheck("CombatReturntoBase.PNG", "MainMenuCombat.png", 138, 61)
PressButtonCheck("Chapter4Orange.png", "Chapter4White.png", 75, 55)
PressButtonCheck("EmergencyClicked.png", "EmergencyUnclicked.png", 67, 43)
PressButton("4-3UniquePicture.png", 540, 60)
PressButton("NormalBattle.png", 99, 48)

DisassemblePath:
	Loop {
	Tooltip, Searching for Close.PNG, 0, 0, 1
	WinActivate BlueStacks
	ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, Close.PNG
		if ErrorLevel = 2
		{
		MsgBox Error encountered searching for Close.PNG.
		}
		else if Errorlevel = 1
		{
		Tooltip, Close.PNG not found, 0, 23, 2
		Goto BattlePath
		}
		else
		{
		Tooltip, Close.PNG found, 0, 23, 2
		PressButtonCheck("Back.PNG", "Close.png", 105, 39)
		PressButtonCheck("CombatReturnToBase.PNG", "Back.png", 68, 36)
		PressButtonCheck("MainMenuCombat.PNG", "CombatReturnToBase.PNG", 80, 55)
		MsgBox, 4096, Inventory Full, Please manually clear inventory
		Goto Start
		}
	}

BattlePath:
	Loop {
	Tooltip, Searching for StartOperation.PNG, 0, 0, 1
	WinActivate BlueStacks
	ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, StartOperation.PNG
		if ErrorLevel = 2
		{
		MsgBox Error encountered searching for StartOperation.PNG.
		}
		else if Errorlevel = 1
		{
		Tooltip, StartOperation.PNG not found, 0, 23, 2
		Goto DisassemblePath
		}
		else
		{
		Tooltip, StartOperation.PNG found, 0, 23, 2
		Goto Battle
		}
	}

Battle:
PressButton("Helipad.png", 49, 49)
PressButton("OK.png", 104, 40)
PressButton("CommandPost.png", 51, 52)
PressButton("OK.png",104, 40)
PressNodeWhen("Echelon2Placed.png", 644, 585, 716, 652)
TimedSleep(4)
DoublePressNodeWhen("Echelon2Placed.png", 130, 350, 165, 385)
PressButton("Resupply.png", 125, 39)
PressButtonCheck("PlanningModeClicked.PNG", "PlanningModeUnclicked.png", 89, 24)
PressNode(675, 435, 710, 470)
PressNode(670, 335, 700, 365)
PressNode(700, 230, 740, 270)
PressNode(645, 130, 675, 160)
DragUntil("TopOfMap.png", 410, 95, 620, 285, 20)
PressNode(650, 175, 690, 215)
PressButton("ExecutePlan.png", 103, 53)
PressNodeWhen("AllBattlesCompleted.png", 707, 596, 808, 647)
PressNodeCheck("Reward2.png", "Reward1.png", 10, 50, 820, 655)
PressNodeWhen("Reward2.png", 110, 110, 820, 655)
PressNodeWhen("Reward1.png", 10, 50, 820, 655)

RunCount := RunCount + 1
Tooltip, Completed Runs: %RunCount%, 300, 23, 3

FormationCD:
FN := Randomize(1,4)
TimedSleep(FN)
Formation("Dolls/9A91.PNG", "Dolls/SOPMOD.PNG", 9, 8)

RepairCheck:
Tooltip, Searching for RepairNeeded.PNG, 0, 0, 1
FR := Randomize(1,4)
TimedSleep(FR)
WinActivate BlueStacks
ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, RepairNeeded.PNG
	if ErrorLevel = 2
	{
	MsgBox Error encountered searching for RepairNeeded.PNG
	}
	else if Errorlevel = 1
	{
	Tooltip, RepairNeeded.PNG not found, 0, 23, 2
	RepairCheck2:
	Loop {
		ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, MainMenuCombat.PNG
		if ErrorLevel = 2
		{
		MsgBox Error encountered searching for MainMenuCombat.PNG
		}
		else if Errorlevel = 1
		{
		Goto RepairCheck
		}
		else
		{
		Tooltip, MainMenuCombat.PNG found, 0, 23, 2
		Goto Start
	}
	}
	}
	else
	{
	Tooltip, RepairNeeded found, 0, 23, 2
	MsgBox, 4096, Repair Needed, Please manually repair tank(s)
	Goto Start
	}
	
F1::Pause

Esc::
WinSet, AlwaysOnTop, Off, BlueStacks
ExitApp

Formation(ImageGun1, ImageGun2, G1Slot, G2Slot){
if G1Slot = 1
	{
	G1Xmin = 130
	G1Ymin = 120
	G1Xmax = 230
	G1Ymax = 260
	}
if G1Slot = 2
	{
	G1Xmin = 244
	G1Ymin = 120
	G1Xmax = 344
	G1Ymax = 260
	}
if G1Slot = 3
	{
	G1Xmin = 358
	G1Ymin = 120
	G1Xmax = 458
	G1Ymax = 260
	}
if G1Slot = 4
	{
	G1Xmin = 472
	G1Ymin = 120
	G1Xmax = 572
	G1Ymax = 260
	}
if G1Slot = 5
	{
	G1Xmin = 586
	G1Ymin = 120
	G1Xmax = 686
	G1Ymax = 260
	}
if G1Slot = 6
	{
	G1Xmin = 16
	G1Ymin = 313
	G1Xmax = 116
	G1Ymax = 453
	}
if G1Slot = 7
	{
	G1Xmin = 130
	G1Ymin = 313
	G1Xmax = 230
	G1Ymax = 453
	}
if G1Slot = 8
	{
	G1Xmin = 244
	G1Ymin = 313
	G1Xmax = 344
	G1Ymax = 453
	}
if G1Slot = 9
	{
	G1Xmin = 358
	G1Ymin = 313
	G1Xmax = 458
	G1Ymax = 453
	}
if G1Slot = 10
	{
	G1Xmin = 472
	G1Ymin = 313
	G1Xmax = 572
	G1Ymax = 453
	}
if G1Slot = 11
	{
	G1Xmin = 586
	G1Ymin = 313
	G1Xmax = 686
	G1Ymax = 453
	}
if G1Slot = 12
	{
	G1Xmin = 16
	G1Ymin = 506
	G1Xmax = 116
	G1Ymax = 646
	}
if G1Slot = 13
	{
	G1Xmin = 130
	G1Ymin = 506
	G1Xmax = 230
	G1Ymax = 646
	}
if G1Slot = 14
	{
	G1Xmin = 244
	G1Ymin = 506
	G1Xmax = 344
	G1Ymax = 646
	}
if G1Slot = 15
	{
	G1Xmin = 358
	G1Ymin = 506
	G1Xmax = 458
	G1Ymax = 646
	}
if G1Slot = 16
	{
	G1Xmin = 472
	G1Ymin = 506
	G1Xmax = 572
	G1Ymax = 646
	}
if G1Slot = 17
	{
	G1Xmin = 586
	G1Ymin = 506
	G1Xmax = 686
	G1Ymax = 646
	}
if G2Slot = 1
	{
	G2Xmin = 130
	G2Ymin = 120
	G2Xmax = 230
	G2Ymax = 260
	}
if G2Slot = 2
	{
	G2Xmin = 244
	G2Ymin = 120
	G2Xmax = 344
	G2Ymax = 260
	}
if G2Slot = 3
	{
	G2Xmin = 358
	G2Ymin = 120
	G2Xmax = 458
	G2Ymax = 260
	}
if G2Slot = 4
	{
	G2Xmin = 472
	G2Ymin = 120
	G2Xmax = 572
	G2Ymax = 260
	}
if G2Slot = 5
	{
	G2Xmin = 586
	G2Ymin = 120
	G2Xmax = 686
	G2Ymax = 260
	}
if G2Slot = 6
	{
	G2Xmin = 16
	G2Ymin = 313
	G2Xmax = 116
	G2Ymax = 453
	}
if G2Slot = 7
	{
	G2Xmin = 130
	G2Ymin = 313
	G2Xmax = 230
	G2Ymax = 453
	}
if G2Slot = 8
	{
	G2Xmin = 244
	G2Ymin = 313
	G2Xmax = 344
	G2Ymax = 453
	}
if G2Slot = 9
	{
	G2Xmin = 358
	G2Ymin = 313
	G2Xmax = 458
	G2Ymax = 453
	}
if G2Slot = 10
	{
	G2Xmin = 472
	G2Ymin = 313
	G2Xmax = 572
	G2Ymax = 453
	}
if G2Slot = 11
	{
	G2Xmin = 586
	G2Ymin = 313
	G2Xmax = 686
	G2Ymax = 453
	}
if G2Slot = 12
	{
	G2Xmin = 16
	G2Ymin = 506
	G2Xmax = 116
	G2Ymax = 646
	}
if G2Slot = 13
	{
	G2Xmin = 130
	G2Ymin = 506
	G2Xmax = 230
	G2Ymax = 646
	}
if G2Slot = 14
	{
	G2Xmin = 244
	G2Ymin = 506
	G2Xmax = 344
	G2Ymax = 646
	}
if G2Slot = 15
	{
	G2Xmin = 358
	G2Ymin = 506
	G2Xmax = 458
	G2Ymax = 646
	}
if G2Slot = 16
	{
	G2Xmin = 472
	G2Ymin = 506
	G2Xmax = 572
	G2Ymax = 646
	}
if G2Slot = 17
	{
	G2Xmin = 586
	G2Ymin = 506
	G2Xmax = 686
	G2Ymax = 646
	}
PressButtonCheck("FormationReturntoBase.Png", "MainMenuFormation.png", 134, 59)
LoopFC:
Loop {
	LoopFC11:
	Loop {
		Tooltip, Searching for %ImageGun1%, 0, 0, 1
		ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageGun1%
			if ErrorLevel = 2
			{
			MsgBox Error encountered searching for %ImageGun1%
			}
			else if ErrorLevel = 1
			{
			Tooltip, %ImageGun1% not found, 0, 23, 2
			Goto LoopFC21
			}
			else
			{
			Tooltip, %ImageGun1% found, 0, 23, 2
			PressButtonCheck("FormationCancel.PNG", ImageGun1, 105, 155)
			PressButton("Filter.PNG", 102, 65)
			PressButton("AssaultFilter.PNG", 107, 41)
			PressButton("FilterConfirm.PNG", 174, 33)
			LoopFC12:
			Loop {
				Tooltip, Searching for FilterSelected.PNG, 0, 0, 1
				ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, FilterSelected.PNG
					if ErrorLevel = 2
					{
					MsgBox Error encountered searching for FilterSelected.PNG
					}
					else if ErrorLevel = 1
					{
					Tooltip, FilterSelected.PNG not found, 0, 23, 2
					Goto LoopFC12
					}
					else
					{
					Tooltip, FilterSelected.PNG found, 0, 23, 2
					PressNode(G2Xmin, G2Ymin, G2Xmax, G2Ymax)
					LoopFC13:
					Loop {
						Tooltip, Searching for Echelon2White.PNG, 0, 0, 1
						ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, Echelon2White.PNG
							if ErrorLevel = 2
							{
							MsgBox Error encountered searching for Echelon2White.PNG.
							}
							else if ErrorLevel = 1
							{
							Tooltip, Echelon2White.PNG not found, 0, 23, 2
							Goto LoopFC13
							}
							else
							{
							Tooltip, Echelon2White.PNG found, 0, 23, 2
							PressButton("Echelon2White.png", 76, 45)
							LoopFC14:
							Loop {
								Tooltip, Searching for Echelon2Orange.PNG, 0, 0, 1
								ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, Echelon2Orange.PNG
									if ErrorLevel = 2
									{
									MsgBox Error encountered searching for Echelon2Orange.PNG
									}
									else if ErrorLevel = 1
									{
									Tooltip, Echelon2Orange.PNG not found, 0, 23, 2
									PressButtonCheck("Echelon2Orange.PNG", "Echelon2White.PNG", 76, 45)
									Goto LoopFC14
									}
									else
									{
									Tooltip, Echelon2Orange.PNG found, 0, 23, 2
									PressNode(100, 210, 205, 420)
									LoopFC15:
									Loop {
										Tooltip, Searching for FilterSelected.PNG, 0, 0, 1
										ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, FilterSelected.PNG
											if ErrorLevel = 2
											{
											MsgBox Error encountered searching for FilterSelected.PNG
											}
											else if ErrorLevel = 1
											{
											Tooltip, FilterSelected.PNG not found, 0, 23, 2
											Goto LoopFC15
											}
											else
											{
											Tooltip, FilterSelected.PNG found, 0, 23, 2
											PressNode(G1Xmin, G1Ymin, G1Xmax, G1Ymax)
											LoopFC16:
											Loop {
												Tooltip, Searching for FormationReturntoBase.PNG, 0, 0, 1
												ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, FormationReturntoBase.PNG
													if ErrorLevel = 2
													{
													MsgBox Error encountered searching for FormationReturntoBase.PNG
													}
													else if ErrorLevel = 1
													{
													Tooltip, FormationReturntoBase.PNG not found, 0, 23, 2
													Goto LoopFC16
													}
													else
													{
													Tooltip, FormationReturntoBase.PNG found, 0, 23, 2
													PressButtonCheck("MainMenuCombat.PNG", "FormationReturntoBase.PNG", 80, 52)
													Break LoopFC
													}
											}
											}
									}
									}
							}
							}
					}
					}
			}
			}
											
	}
	LoopFC21:
	Loop {
		Tooltip, Searching for %ImageGun2%, 0, 0, 1
		ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageGun2%
			if ErrorLevel = 2
			{
			MsgBox Error encountered searching for %ImageGun2%
			}
			else if ErrorLevel = 1
			{
			Tooltip, %ImageGun2% not found, 0, 23, 2
			Goto LoopFC11
			}
			else
			{
			Tooltip, %ImageGun2% found, 0, 23, 2
			PressButtonCheck("FormationCancel.PNG", ImageGun2, 105, 155)
			PressButton("Filter.PNG", 102, 65)
			PressButton("AssaultFilter.PNG", 107, 41)
			PressButton("FilterConfirm.PNG", 174, 33)
			LoopFC22:
			Loop {
				Tooltip, Searching for FilterSelected.PNG, 0, 0, 1
				ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, FilterSelected.PNG
					if ErrorLevel = 2
					{
					MsgBox Error encountered searching for FilterSelected.PNG
					}
					else if ErrorLevel = 1
					{
					Tooltip, FilterSelected.PNG not found, 0, 23, 2
					Goto LoopFC22
					}
					else
					{
					Tooltip, FilterSelected.PNG found, 0, 23, 2
					PressNode(G1Xmin, G1Ymin, G1Xmax, G1Ymax)
					LoopFC23:
					Loop {
						Tooltip, Searching for Echelon2White.PNG, 0, 0, 1
						ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, Echelon2White.PNG
							if ErrorLevel = 2
							{
							MsgBox Error encountered searching for Echelon2White.PNG.
							}
							else if ErrorLevel = 1
							{
							Tooltip, Echelon2White.PNG not found, 0, 23, 2
							Goto LoopFC23
							}
							else
							{
							Tooltip, Echelon2White.PNG found, 0, 23, 2
							PressButton("Echelon2White.png", 76, 45)
							LoopFC24:
							Loop {
								Tooltip, Searching for Echelon2Orange.PNG, 0, 0, 1
								ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, Echelon2Orange.PNG
									if ErrorLevel = 2
									{
									MsgBox Error encountered searching for Echelon2Orange.PNG
									}
									else if ErrorLevel = 1
									{
									Tooltip, Echelon2Orange.PNG not found, 0, 23, 2
									PressButtonCheck("Echelon2Orange.PNG", "Echelon2White.PNG", 76, 45)
									Goto LoopFC24
									}
									else
									{
									Tooltip, Echelon2Orange.PNG found, 0, 23, 2
									PressNode(100, 210, 205, 420)
									LoopFC25:
									Loop {
										Tooltip, Searching for FilterSelected.PNG, 0, 0, 1
										ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, FilterSelected.PNG
											if ErrorLevel = 2
											{
											MsgBox Error encountered searching for FilterSelected.PNG
											}
											else if ErrorLevel = 1
											{
											Tooltip, FilterSelected.PNG not found, 0, 23, 2
											Goto LoopFC25
											}
											else
											{
											Tooltip, FilterSelected.PNG found, 0, 23, 2
											PressNode(G2Xmin, G2Ymin, G2Xmax, G2Ymax)
											LoopFC26:
											Loop {
												Tooltip, Searching for FormationReturntoBase.PNG, 0, 0, 1
												ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, FormationReturntoBase.PNG
													if ErrorLevel = 2
													{
													MsgBox Error encountered searching for FormationReturntoBase.PNG
													}
													else if ErrorLevel = 1
													{
													Tooltip, FormationReturntoBase.PNG not found, 0, 23, 2
													Goto LoopFC26
													}
													else
													{
													Tooltip, FormationReturntoBase.PNG found, 0, 23, 2
													PressButtonCheck("MainMenuCombat.PNG", "FormationReturntoBase.PNG", 80, 52)
													Break LoopFC
													}
											}
											}
									}
									}
							}
							}
					}
					}
			}
			}
											
	}
}
}

DragUntil(ImageName, Xmin, Ymin, Xmax, Ymax, Speed){
	WinActivate, BlueStacks
	Xi := Randomize(Xmin, Xmax)
	Yi := Randomize(Ymin, Ymax)
	MouseMove, Xi, Yi
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
			MouseClickDrag, Left, 0, 0, Randomize(-50,50), Randomize(50,150), Speed, R
			Continue
			}
			else	
			{
			Tooltip, Planning battle., 0, 23, 2
			Return
			}		
	}
}


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