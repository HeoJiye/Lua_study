-----------------------------------------------------------------------------------------
--
-- character_info.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-- BACKGROUND
	local bg = {}
	
	bg[1] = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	
	bg[2] = display.newImage("image/background.png")
	bg[2].x, bg[2].y  = display.contentWidth, display.contentHeight*0.5
	bg[2]:scale( 2, 2 )

	local logo = display.newImage("image/logo.png")
	logo.x, logo.y  = display.contentWidth*0.5, display.contentHeight*0.15
	logo:scale( 2, 2 )

	-- json에서 정보 읽기


	-- CONTENT
	local content = display.newGroup()

	local image = {}
	local name = {}
	local info = {}

	for i = 1, 5 do
		image[i] = display.newImage(content, "image/pororo.png")
		image[i].x, image[i].y = display.contentWidth*0.2 + 400*(i-1), display.contentHeight*0.5
		image[i]:scale(1.5, 1.5)

		name[i] = display.newText(content, "캐릭터 이름", image[i].x, image[i].y + 200)
		name[i].size = 50
		name[i]:setFillColor(0)

		info[i] = display.newText(content, "이런 캐릭터입니다~", image[i].x, image[i].y + 250)
		info[i].size = 30
		info[i]:setFillColor(0)
	end

	function content:touch( event )
		if( event.phase == "began" ) then
			display.getCurrentStage():setFocus( event.target )
			event.target.isFocus = true

			event.target.xStart = event.target.x

		elseif( event.phase == "moved" ) then
			if( event.target.isFocus ) then

				event.target.x = event.target.xStart + event.xDelta
			end
		elseif( event.phase == "ended" or event.phase == "cancelled") then

			display.getCurrentStage():setFocus( nil)
			event.target.isFocus = false
		end
	end
	content:addEventListener("touch", content)

	function logo:tap( event )
		composer.gotoScene("home")
	end
	logo:addEventListener("tap", logo)

	-- 정렬
	sceneGroup:insert(bg[1])
	sceneGroup:insert(bg[2])

	sceneGroup:insert(logo)
	sceneGroup:insert(content)
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
