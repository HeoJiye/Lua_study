-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer"

local function onFirstView( event )
	composer.gotoScene( "concept" )
end

onFirstView()
