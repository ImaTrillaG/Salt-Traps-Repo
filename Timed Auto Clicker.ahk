Gui +ToolWindow +LastFound
Gui, Color, 00FF00 ; Green background color

; Set font for the entire GUI to be bold
Gui, Font, s16 c000000 b, Segoe UI Bold

Gui, Add, Text, x10 y10 w380 h30 Center, SaltTraps Auto Clicker ; Increased width
Gui, Add, Text, x10 y50, Click Duration (seconds):
Gui, Add, Edit, vDuration x10 y80 w100
Gui, Add, Button, gStartScript x10 y120 w100, Start
Gui, Add, Button, gStopScript x120 y120 w100, Stop
Gui, Show, x100 y100 w390 h170 ; Increased width and height

return

F1::StartScript()
F2::StopScript()
GuiClose:
    ExitApp
return

StartScript() {
    GuiControlGet, duration, , Duration
    SetTimer, ClickLoop, 420
    Start_time := A_TickCount
    ClickLoopCount := 0
}

StopScript() {
    SetTimer, ClickLoop, Off
}

ClickLoop:
    GuiControlGet, duration, , Duration
    if (ClickLoopCount * 420 >= duration * 1000)
    {
        SetTimer, ClickLoop, Off
        ExitApp
    }
    else
    {
        ; Send a mouse click
        Click

        ; Sleep for 420 milliseconds
        Sleep, 420

        ClickLoopCount++
    }
    return
