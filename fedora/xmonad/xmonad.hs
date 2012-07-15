import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName

main = do
    xmonad $ defaultConfig
    	   { manageHook = manageDocks <+> manageHook defaultConfig
           , layoutHook = avoidStruts  $  layoutHook defaultConfig
           , modMask = mod4Mask     -- Rebind Mod to the Windows key
           , startupHook = ewmhDesktopsStartup >> setWMName "LG3D"  
	   , terminal = "urxvt"
	   }
