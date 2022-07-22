-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-- BACKGROUND
	local bg = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)

	-- CONTENT
	local content = {}

	for i = 1, 3 do
		content = display.newRect(display.contentWidth*0.3, display.contentHeight/2, 570, 368)

		content.title = display.newText("", content.x + 500, content.y - 100)
		content.title.size = 50
		content.title:setFillColor(0)

		content.detail = display.newText("", content.x + 550, content.y + 50)
		content.detail.size = 30
		content.detail:setFillColor(0)
	end
	
	local index = 1
	
	local function setContent()
		content.fill = {
			type = "image",
			filename = "image/concept01.jpg"
		}

		content.title.text = "뽀통령과 함께 즐기는 놀이공간"
		content.detail.text = "자연적으로, 스스로 배우는 교육을 경험하다!\n놀이를 통한 몰입감으로 교육의 효과를\n극대화하며, 지속적인 교육 프로그램의\n업그레이드로 단순한 놀이 시설을 뛰어넘은\n뽀로로파크입니다."
	end

	setContent()
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
