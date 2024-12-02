Home::
{
   ; Create the GUI with a title
   MyGui := Gui() 
   MyGui.Title := "Launcher"

   ; Drop down Selection
   MyGui.AddText(, "Open Application")
   Application := MyGui.AddComboBox("vApplication", ["EA", "Epic Games Launcher", "Steam", "Minecraft Launcher","Battle.net", "Ubisoft Connect", "Spotify"])

   ;Check Boxes
   AutoCheckBox :=  MyGui.AddCheckBox("vAutoClicker", "Auto Clicker (PgUp to Turn Off)")

   ;Edit, Google Search
   MyGui.AddText(, "Google Search")
   MyGui.AddEdit(" r1 vSearch w250")
   
   ;Buttons
   EnterButton := MyGui.Add("Button", "w250", "Enter")
   OpenDefaultApp := MyGui.Add("Button", "w250", "Open Start Up Apps")

   ;runs program
   EnterButton.OnEvent("click", Run)
   OpenDefaultApp.OnEvent("click", Open)

   ;Shows Gui
   CoordMode "Mouse", "Screen"
   MouseGetPos &xCoord, &yCoord
   MyGui.Show("x" xCoord " y" yCoord)
   return
   


   ;Methods
   
   ;Searches userinput
   Search()
   {
      MsgBox "works"
   }

   ;Main Method, Closes Window at end
   Run(*)
   {
     ;turns on auto clicker
     if (AutoCheckBox.Value == 1)
     {
        AutoClicker
     }
     
     ;Opens Application
     RunApp(Application.Text)

     ;Closes GUI
     WinClose("Launcher")
   }
   
   Open(*)
   {
      RunApp("NZXT CAM")
      RunAPP("DevilZone")
      RunApp("ARMOURY CRATE")

     ;Closes GUI
     WinClose("Launcher")
   }

   ;Opens Apllication
   RunApp(appName)
   {
      For app in ComObject('Shell.Application').NameSpace('Shell:AppsFolder').Items
      {
	   (app.Name = appName) && RunWait('explorer shell:appsFolder\' app.path)
      }
   }

   ;Auto Clicker
   AutoClicker(*)
   {
       SetTimer(Click,1)
       return
    }
}

;turns of clicker;
PgUp::
{
   SetTimer(Click,0)
   return
}
