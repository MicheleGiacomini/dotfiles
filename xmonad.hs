import XMonad
import XMonad.Config.Kde
import qualified XMonad.StackSet as W -- to shift and float windows

import XMonad.Layout.NoBorders
import XMonad.Layout.IM
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Grid
import XMonad.Layout.Tabbed
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.LayoutModifier

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers

import XMonad.Util.EZConfig
import XMonad.Util.Scratchpad
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.WorkspaceCompare
import XMonad.Util.SpawnOnce (spawnOnce)
--
-- basic configuration
--

myModMask     = mod4Mask -- use the Windows key as mod
myBorderWidth = 2        -- set window border size
myTerminal    = "kitty" -- preferred terminal emulator

--
-- hooks for newly created windows
-- note: run 'xprop WM_CLASS' to get className
--

myManageHook :: ManageHook
myManageHook = manageDocks <+> manageScratchPad <+> coreManageHook

coreManageHook :: ManageHook
coreManageHook = composeAll . concat $
  [ [ className   =? c --> doCenterFloat     | c <- myCenterFloats]
  , [ className   =? c --> doFloat           | c <- myFloats]
  , [ className   =? c --> doF (W.shift "9") | c <- mailIrcApps]
  ]
  where
    myCenterFloats  = [
       "MPlayer"
     , "Gimp"
     --, "Plasma-desktop"
     , "Klipper"
     , "Keepassx"
     ]
    myFloats        = [
       "Plasma-desktop"
     , "plasmashell"
     , "megasync"
     ]
    mailIrcApps     = [
       "Thunderbird"
     , "konversation"
     ]

-- Default config from xmonad for kde wiki
--myManageHook = composeAll . concat $
--    [ [ className   =? c --> doFloat           | c <- myFloats]
--    , [ title       =? t --> doFloat           | t <- myOtherFloats]
--    , [ className   =? c --> doF (W.shift "2") | c <- webApps]
--    , [ className   =? c --> doF (W.shift "3") | c <- ircApps]
--    ]
--  where myFloats      = ["MPlayer", "Gimp"]
--        myOtherFloats = ["alsamixer"]
--        webApps       = ["Firefox-bin", "Opera"] -- open on desktop 2
--        ircApps       = ["Ksirc"]                -- open on desktop 3

-- yakuake style hook
manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)
  where
    h = 0.4     -- terminal height, 40%
    w = 1       -- terminal width, 100%
    t = 1 - h   -- distance from top edge, 90%
    l = 1 - w   -- distance from left edge, 0%

--
-- startup hooks
--

myStartupHook = do
    spawnOnce "picom --experimental-backends &"
    setWMName "LG3D"

--
-- layout hooks
--
mySpacing :: Integer -> l a -> ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True


myLayoutHook = smartBorders $ avoidStruts $ coreLayoutHook

coreLayoutHook = tiled ||| Full ||| Mirror tiled ||| Grid
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   =  mySpacing 4 $ ResizableTall nmaster delta ratio []
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 3/5
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100


--
-- window borders
--

myFocusedBorderColor = "#cc241d"
myNormalBorderColor = "#282828"

--main = xmonad kdeConfig
--    { modMask = mod4Mask -- use the Windows button as mod
--    , manageHook = manageHook kdeConfig <+> myManageHook
--    }

defDesktopConfig = kdeConfig

main :: IO ()
main = xmonad kdeConfig
    { modMask               = myModMask
    , terminal              = myTerminal
    , borderWidth           = myBorderWidth
    , focusedBorderColor    = myFocusedBorderColor
    , normalBorderColor     = myNormalBorderColor
    , startupHook           = myStartupHook
    , layoutHook            = myLayoutHook
    , manageHook            = myManageHook <+> manageHook defDesktopConfig
    }
