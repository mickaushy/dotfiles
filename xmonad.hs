--
-- xmonad.hs
--

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.Run                  -- spawnPipe, hPutStrLn

main = do
    myStatusBar <- spawnPipe "xmobar"
    xmonad defaultConfig {
          modMask         = myModMask
        , layoutHook      = myLayoutHook
        , manageHook      = myManageHook
        , logHook         = myLogHook myStatusBar
        }

myModMask = mod4Mask

-- myLayoutHook = avoidStruts $ layoutHook defaultConfig
myLayoutHook = avoidStruts (tiled ||| Mirror tiled ||| Full)
    where
        tiled = spacing 5 $ Tall nmaster delta ratio
        nmaster = 1
        delta = 3/100
        ratio = 2/3
myManageHook = manageDocks <+> manageHook defaultConfig

myLogHook h = dynamicLogWithPP xmobarPP {
                  ppOutput = hPutStrLn h
                }
