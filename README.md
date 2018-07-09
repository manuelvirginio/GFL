# GFL
Macros for GFL
Disclaimer you might get banned as using macros is against TOS.

You will most likely need to take your own images, use mine as examples.
For most of them you need the upper left corner of the button as the upper left part of your image snippet.

It's set to be used in BlueStacks at 1600x1200 but then minimized to the smallest that it goes.
F1 to Pause the combat macros.  F2 for the logistics one.  Esc to exit the macro.
In order for the combat macros (i.e. 4-3e) to work you have to open that map previously and zoom out.  The easiest way to do this is to complete the map manually and summon a friend echelon.
The ARs you are corpse dragging with should be in the second slot of the first echelon and the first slot of the second one.
Might be forgetting things.  It'll drag until you are full or you need to repair then open a message box, just clear your doll inventory repair and hit okay and it will continue.
All of the macros start from the main menu screen. I think... the Like one might not.

I probably won't update this, enjoy.

You'll need to edit things brainlets.  For instance
in 43E line number 97
  Formation("Dolls/9A91.PNG", "Dolls/SOPMOD.PNG", 9, 8)
  You'll need to put the path to the image of your two corpse dragging ARs and then the slot they appear in left to right up to down when you filter your dolls to only show ARs.
General example
  Formation("Doll1.PNG", "Doll2.PNG", Slot# for Doll 1, Slot# for Doll 2)
