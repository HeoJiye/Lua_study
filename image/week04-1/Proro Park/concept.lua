-----------------------------------------------------------------------------------------
--
-- concept.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-- BACKGROUND
	local bg = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)

	local logo = display.newImage("image/logo.png")
	logo.x, logo.y  = display.contentWidth*0.5, display.contentHeight*0.15
	logo:scale( 2, 2 )

	-- CONTENT
	local content = display.newRect(display.contentWidth*0.3, display.contentHeight*0.5, 570, 368)

	local title = display.newText("", content.x + 550, content.y - 100)
	title.size = 50
	title:setFillColor(0)

	local detail = display.newText("", content.x + 550, content.y + 50)
	detail.size = 30
	detail:setFillColor(0)
	
	-- json에서 정보 읽기
	
	
	-- json에서 읽어낸 정보 적용하기
	
	function bg:tap( event )
		-- 배경을 클릭할 때마다 다음 컨셉이 보인다.
		-- 모든 컨셉을 보면 맨 처음으로 돌아온다.
		
	end
	bg:addEventListener("tap", bg)

	function logo:tap( event )
		composer.gotoScene("home")
	end
	logo:addEventListener("tap", logo)

	sceneGroup:insert(bg)
	sceneGroup:insert(logo)
	sceneGroup:insert(content)
	sceneGroup:insert(title)
	sceneGroup:insert(detail)
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
