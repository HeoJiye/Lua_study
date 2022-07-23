-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- json parsing


-- 

local composer = require "composer"

local function onFirstView( event )
	composer.gotoScene( "home" )
end

onFirstView()
