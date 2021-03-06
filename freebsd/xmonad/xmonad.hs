import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "VLC" --> doFloat
    , className =? "VLC media player" --> doFloat
    , className =? "GroovyConsole" --> doFloat
    , className =? "Luke" --> doFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { XMonad.terminal = "urxvt"
		, manageHook = manageDocks <+> myManageHook 
                          <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green"  "" . shorten 50
            }
	, modMask = mod4Mask -- rebind mod to the windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        ]
