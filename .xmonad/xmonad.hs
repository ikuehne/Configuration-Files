--
-- XMonad RC file.
--

import XMonad
import XMonad.Operations
import qualified Data.Map as M
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageDocks

defaultTerminal = urxvt

xfceTerm = "xfce4-terminal --hide-menubar --hide-borders"
urxvt = "urxvt -rv -fn \"9x15\""

-- A list of custom keybindings.
customBindings _ = M.fromList $
    [ -- Shortcuts for starting applications.
      ((mod4Mask, xK_b), spawn "uzbl-browser") 
    , ((mod4Mask, xK_m), spawn "firefox") 
    , ((mod4Mask, xK_t), spawn defaultTerminal)
    , ((mod4Mask, xK_f), spawn "thunar")
      -- Alt-F4.
    , ((mod1Mask, xK_F4), kill)
      -- Adjusting brightness.
    , ((noModMask, xK_F9),  spawn "xbacklight -10")
    , ((noModMask, xK_F10), spawn "xbacklight +10")
      -- Adjusting volume.
    , ((noModMask, xK_F6),  spawn "amixer set Master 5-")
    , ((noModMask, xK_F7), spawn "amixer set Master 5+")
      -- Shifting workspaces.
    , ((mod1Mask, xK_Right), nextWS)
    , ((mod1Mask, xK_Left), prevWS)
    , ((mod1Mask .|. controlMask, xK_Right), shiftToNext >> nextWS)
    , ((mod1Mask .|. controlMask, xK_Left), shiftToPrev >> prevWS)
 ]

main = do
    spawn "/home/ikuehne/.xmonad/autostart"
    xmonad $ defaultConfig {
      -- Use xfce4-term.
      terminal   = defaultTerminal
      -- Make xmobar have a sensible layout.
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , manageHook = manageDocks <+> manageHook defaultConfig
      -- Load custom keybindings.
    , keys       = \c -> customBindings c `M.union` keys defaultConfig c
    , focusedBorderColor = "#FFFFFF"}
