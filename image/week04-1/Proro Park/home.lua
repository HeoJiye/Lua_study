-----------------------------------------------------------------------------------------
--
-- home.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-- BG
	local bg = {}
	
	bg[1] = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	
	bg[2] = display.newImage("image/background.png")
	bg[2].x, bg[2].y  = display.contentWidth*-0.3, display.contentHeight*0.5
	bg[2]:scale( 2, 2 )

	bg[3] = display.newImage("image/logo.png")
	bg[3].x, bg[3].y  = display.contentWidth*0.5, display.contentHeight*0.3
	bg[3]:scale( 2, 2 )

	-- BUTTON
	local btn = {}

	for i = 1, 3 do
		btn[i] = display.newImage("image/button0"..i..".png")
		btn[i]:scale(1.5, 1.5)
		btn[i].x, btn[i].y = display.contentWidth*0.2+i*200, display.contentHeight*0.6

		btn[i].title = display.newText("", btn[i].x, btn[i].y + 100)
		btn[i].title:setFillColor(0)
		btn[i].title.size = 40
	end

	btn[1].title.text = "파크 소개"
	btn[2].title.text = "컨셉 소개"
	btn[3].title.text = "캐릭터 소개"

	btn[1].scene = "intro"
	btn[2].scene = "concept"
	btn[3].scene = "character_info"

	-- EVENT
	function btnTap( event )
		composer.gotoScene(event.target.scene)
	end

	for i = 1, 3 do
		btn[i]:addEventListener("tap", btnTap)
	end

	-- 정렬
	for i = 1, 3 do 
		sceneGroup:insert(bg[i])
	end

	for i = 1, 3 do 
		sceneGroup:insert(btn[i])
		sceneGroup:insert(btn[i].title)
	end
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene