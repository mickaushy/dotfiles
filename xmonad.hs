--
-- xmonad.hs
--

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.OneBig
import XMonad.Util.EZConfig             -- additionalKeys
import XMonad.Util.Run                  -- spawnPipe, hPutStrLn

main = do
    myStatusBar <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
          borderWidth        = 3
        , normalBorderColor  = "#ededed"
        , focusedBorderColor = "#4cb64a"
        , terminal           = "termite"
        , modMask            = myModMask
        , layoutHook         = myLayoutHook
        , manageHook         = myManageHook
        , logHook            = myLogHook myStatusBar
        }
        `additionalKeysP` myKeys


myModMask = mod4Mask

-- myLayoutHook = avoidStruts $ layoutHook defaultConfig
myLayoutHook = avoidStruts (tiled ||| Mirror tiled ||| noBorders Full ||| oneBig)
    where
        tiled   = spacing 7 $ Tall nmaster delta ratio
        oneBig  = spacing 7 $ OneBig (5/7) (5/8)
        nmaster = 1
        delta   = 2/100
        ratio   = 3/5
myManageHook = manageDocks <+> manageHook defaultConfig

myLogHook h = dynamicLogWithPP xmobarPP {
                  ppOutput = hPutStrLn h
                }

myKeys =  [ ("M-p", spawn "rofi -show run -font 'SherryAA 11' -color-window '#ededed, #0084c8, #000000' -color-normal '#ededed, #000000, #dedfdf, #00bbff, #feffbf' -color-active '#ededed, #268bd2, #dedfdf, #00bbff, #f8d00e' -color-urgent '#ededed, #f53f49, #dedfdf, #ff8ca7, #feffbf' -location 2 -separator-style 'solid'")
          , ("M-S-p", spawn "rofi -show window -font 'SherryAA 11' -color-window '#ededed, #0084c8, #000000' -color-normal '#ededed, #000000, #dedfdf, #00bbff, #feffbf' -color-active '#ededed, #268bd2, #dedfdf, #00bbff, #f8d00e' -color-urgent '#ededed, #f53f49, #dedfdf, #ff8ca7, #feffbf' -location 2 -separator-style 'solid'")
          , ("M-C-c", spawn "xkill")
          ]

-- launch rofi instead of dmenu
-- options for rofi. bit noisy though
-- -font 'SherryAA 11' -color-window '#ededed, #0084c8, #000000' -color-normal '#ededed, #000000, #dedfdf, #00bbff, #feffbf' -color-active '#ededed, #268bd2, #dedfdf, #00bbff, #f8d00e' -color-urgent '#ededed, #f53f49, #dedfdf, #ff8ca7, #feffbf' -location 2 -separator-style 'solid'
