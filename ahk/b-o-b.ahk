

; # Window
; ^ Ctrl
; ! Alt
; + Shift

;IfWinActive ahk_exe i_view64.exe ; IrfanView


#HotIf WinActive("ahk_exe mspaint.exe") ; Paint
	
	Space::_
	+Space::Space
	^+c:: {
		DEFAULT_KEY_DELAY := 500
		DELAY_COEFFICIENT := 1.9
		TARGET_MEDIA := "dvd"
		;TARGET_MEDIA := "dvdscreener"
		;TARGET_MEDIA := "magazine"
	
		; SendEvent {Volume_Mute}
		; WinActivate "ahk_class MSPaintApp"
		SetKeyDelay DEFAULT_KEY_DELAY


		SendEvent "{Click Left}"
		Sleep 50 * DELAY_COEFFICIENT

		; open scan dialog
		SendEvent "{Down 2}{Right}{Down}{Enter}"

		; select scanner
		Sleep 50 * DELAY_COEFFICIENT
		SendEvent "{Right 2}{Enter}"
		Sleep 325 * DELAY_COEFFICIENT

		; change dpi
		; 2025-12-23 this section is untested after converting to v2
		; 2025-12-16 disabled this section because the + prefix isn't working
		if (1 = 0) {
			if (TARGET_MEDIA = "magazine") {
				SendEvent "{Tab 2}+{Space}" ; {Tab 4}450"
			}
			else {
				SendEvent "{Tab 2}"
				SendEvent "+{Space}" ; click "Adjust the quality..."
				SendEvent "{Tab}25" ; Brightness
				SendEvent "{Tab 3}300" ; Resolution
			}
			SendEvent "{Enter}"


			SetKeyDelay DEFAULT_KEY_DELAY + 150
		
			Sleep 115 * DELAY_COEFFICIENT
			SendEvent "{Tab 6}" ; move focus to scan area
			Sleep 150 * DELAY_COEFFICIENT
			SetKeyDelay 0
			;NOTE: 1 ^+arrow = 8 +arrows
			
			if (TARGET_MEDIA = "magazine" or TARGET_MEDIA = "dvdscreener") {
				SendEvent "^+{Up 1}+{Up 7}+{Left 2}" ;---> Magazine cover
			}
			else {
				SendEvent "^+{Up 18}^+{Left 14}+{Left 4}" ;---> DVD cover
			}
			SendEvent "{Enter}"

			SetKeyDelay DEFAULT_KEY_DELAY
		}
		
		Sleep 500
		SendEvent "{Enter}"
		
		; wait for scan to complete and image to appear in paint
		if (TARGET_MEDIA = "magazine") {
			Sleep 30000
		} 
		else {
			Sleep 18000
		}
		;WinActivate "ahk_class MSPaintApp"
		Sleep 100

		; set zoom
		SetKeyDelay 100
		SendEvent "^1"
		
		; save as jpeg
		SendEvent "{Click}"
		Sleep 150 * DELAY_COEFFICIENT
		SendEvent "{Down 5}{Enter}{Right}{Down}{Enter}" ; select jpg

		SetKeyDelay 0
		; SendEvent {Volume_Mute}
		Return
	} ; ::+^c


#HotIf WinActive("ahk_exe notepad++.exe")
	^s:: {
		SendEvent "^s"
		Sleep 200
		Reload ; "D:\Users\Rgw3\pc-whitley202007\ahk\whitley-202007.ahk"
		Return
	}

#HotIf
