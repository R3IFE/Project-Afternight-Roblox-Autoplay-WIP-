#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Pixel, Screen

; --- Configuration ---
Tolerance := 40 ; Higher tolerance for fast moving notes
LX := 711, LY := 918
DX := 874, DY := 922
UX := 1040, UY := 924
RX := 1203, RY := 928

Loop
{
    ; 1. LEFT (D) - Purple (0xc04a98)
    PixelSearch, , , % LX-15, % LY-15, % LX+15, % LY+15, 0xc04a98, %Tolerance%, Fast RGB
    if !ErrorLevel {
        Send {d Down}
    } else {
        Send {d Up}
    }

    ; 2. DOWN (F) - Cyan (0x00fdfd)
    PixelSearch, , , % DX-15, % DY-15, % DX+15, % DY+15, 0x00fdfd, %Tolerance%, Fast RGB
    if !ErrorLevel {
        Send {f Down}
    } else {
        Send {f Up}
    }

    ; 3. UP (J) - Green (0x12f805)
    PixelSearch, , , % UX-15, % UY-15, % UX+15, % UY+15, 0x12f805, %Tolerance%, Fast RGB
    if !ErrorLevel {
        Send {j Down}
    } else {
        Send {j Up}
    }

    ; 4. RIGHT (K) - Red (0xf7393f)
    PixelSearch, , , % RX-15, % RY-15, % RX+15, % RY+15, 0xf7393f, %Tolerance%, Fast RGB
    if !ErrorLevel {
        Send {k Down}
    } else {
        Send {k Up}
    }
}

Esc:: 
    Send {d Up}{f Up}{j Up}{k Up}
    ExitApp
