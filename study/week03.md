# 3๏ธโฃ Scene

## ๐ ๋ชฉ์ฐจ
* [event ์ดํดํ๊ธฐ](#-event-์ดํดํ๊ธฐ)
* [์์  ๊ฒ์ ๋ฐ๋ผํ๊ธฐ](#-์์ -๊ฒ์-๋ฐ๋ผํ๊ธฐ)
* [์ด๋ฒ์ฃผ ๊ณผ์  ์๋ด](#-์ด๋ฒ์ฃผ-๊ณผ์ -์๋ด)

<br>

### ๐ก ๊ฐ๋ ์ดํดํ๊ธฐ
๐ [Composer Library](https://docs.coronalabs.com/guide/system/composer/index.html)
#### Composer๋?
* Composer library๋ Scene์ ๋ง๋ค๊ณ , ์ ํํ๋ ๋ฑ์ ๊ธฐ๋ฅ์ ์ ๊ณตํ๋ ๋ผ์ด๋ธ๋ฌ๋ฆฌ์ด๋ค.

* main.lua ์ดํด๋ณด๊ธฐ

	``` lua  
	local composer = require "composer"  -- include composer library
	
	local function onFirstView( event )  
		composer.gotoScene( "view1" ) -- view1์ ํด๋นํ๋ ์ฅ๋ฉด์ผ๋ก ์ด๋
	end  

	onFirstView()  
	```

<br>
	
#### Scene ๊ด๋ จ ์ด๋ฒคํธ
* Scene Event Funtion  

	- 
	| ํจ์ | ์ค๋ช  |  
	| ---| --- |  
	| scene:create() | ์ฒ์์ scene์ด ์์ฑ๋์์ ๋ |
	| scene:show() | scene์ด ํ๋ฉด์ ๋ํ๋๊ธฐ ์ง์ (will) / ์งํ(did) |
	| scene:hide() |  scene์ด ํ๋ฉด์์ ์ฌ๋ผ์ง๊ธฐ ์ง์ (will) / ์งํ(did)|
	| scene:destroy() | ์ฅ๋ฉด์ด ์ญ์ ๋  ๋ |

	<img src="https://docs.coronalabs.com/images/simulator/composer-flowchart.png"  width="50%"/>

	- view1.lua ์ดํด๋ณด๊ธฐ
	
		``` lua  
		local composer = require( "composer" )  
		local scene = composer.newScene()

		function scene:create( event )
			local sceneGroup = self.view
			--
	
		end
	
		function scene:show( event )
			local sceneGroup = self.view
			local phase = event.phase
			
			if phase == "will" then
				--
	
			elseif phase == "did" then
				--
	
			end	
		end
	
		function scene:hide( event )
			local sceneGroup = self.view
			local phase = event.phase
			
			if event.phase == "will" then
				--
	
			elseif phase == "did" then
				--
	
			end
		end
	
		function scene:destroy( event )
			local sceneGroup = self.view
			--
	
		end
	
		---------------------------------------------------------------------------------
	
		-- Listener setup
		scene:addEventListener( "create", scene )
		scene:addEventListener( "show", scene )
		scene:addEventListener( "hide", scene )
		scene:addEventListener( "destroy", scene )
	
		-----------------------------------------------------------------------------------------
	
		return scene
		```
	
<br>
	
#### [scene ๊ด๋ จ ํจ์](https://docs.coronalabs.com/api/library/composer/index.html)
๋ค์์ scene ๊ด๋ จ ํจ์๋ค ์ค ์ผ๋ถ์๋๋ค.

* scene ์ ํ๊ณผ ๊ด๋ จ๋ ํจ์
	- composer.gotoScene()
	- composer.removeScene()
	- overlay ํจ์
		+ composer.showOverlay()
		+ composer.hideOverlay()
* scene ์ฌ์ด์์ ๋ณ์๋ฅผ ์ฃผ๊ณ  ๋ฐ๊ธฐ์ํ ํจ์
	+ composer.setVariable( variableName, value )
	- composer.getVariable( variableName )
	
<br>

### ๐ฎ ์์  ๊ฒ์ ๋ฐ๋ผํ๊ธฐ

#### 1. ์๋ก์ด ์ฌ ๋ง๋ค๊ธฐ

##### i. ending.lua
```lua
-----------------------------------------------------------------------------------------
--
-- ending.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
	
 	local endingText = display.newText("์๋ฉ", display.contentWidth/2, display.contentHeight*0.4)
 	endingText.size = 200

 	local replay = display.newText("๋ค์ ํ๊ธฐ", display.contentWidth/2, display.contentHeight*0.7)
	replay.size = 100

 	function replay:tap( event )
 		--
 	end

 	replay:addEventListener("tap", replay)

	sceneGroup:insert(endingText)
	sceneGroup:insert(replay)
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

```

##### ii. setting.lua
```lua
-----------------------------------------------------------------------------------------
--
-- setting.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
	
 	local background = display.newRoundedRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth/2, display.contentHeight*0.6, 55)
 	background.strokeWidth = 10
	background:setStrokeColor( 0.4, 0.2, 0.2 )
 	background:setFillColor(0.6, 0.5, 0.5)

 	local title = display.newText("Setting", display.contentWidth/2, display.contentHeight*0.3)
 	title.size = 70

 	function title:tap( event )
 		--
 	end
 	title:addEventListener("tap", title)

 	sceneGroup:insert(background)
 	sceneGroup:insert(title)
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
```

#### 2. ending.lua ์ฐ๊ฒฐํ๊ธฐ
* game.lua์์ ๊ฒ์ ์ฑ๊ณตํ์ ๋, ์คํจํ์ ๋ ending.lua๋ก ์ด๋
``` lua
	local function dragCarrot( event )
		...

		if( score.text == '5' ) then
			score.text = '์ฑ๊ณต!'
			time.alpha = 0

			composer.gotoScene("ending") -- ์ถ๊ฐ
		end
	...

	local function counter ( event )
		...
		if( time.text == '-1') then
			...
			composer.gotoScene("ending") -- ์ถ๊ฐ
		end
	...
```

* ending.lua์์ replay๋ฅผ ํด๋ฆญํ๋ฉด, ๋ค์ game.lua๋ก ์ด๋
``` lua
 	function replay:tap( event )
 		composer.gotoScene('game')
 	end
```

<br>

**์คํ ๊ฒฐ๊ณผ**

![Alt text](../image/week03/exam01.gif)

* ๊ฒ์์ด ๋๋ฌ์ ๋ ์ ์์ ์ผ๋ก ending.lua๋ก ์ด๋
* ๊ทธ๋ฌ๋, ๋ค์ game์ผ๋ก ๋์์ค๋ฉด ์๋ ์ํ ๊ทธ๋๋ก!

<br>

* ๋ค์ ๋์์์๋ ๋ค์ ์์ํ๋ ค๋ฉด ์ด๋ป๊ฒ ํด์ผํ ๊น? 

![Alt text](../image/week03/exam02.png)

* ์ฒ์ scene์ ๋ถ๋ฌ์ฌ ๋ create()์ show()๊ฐ ์คํ๋๊ณ ,
* ๊ทธ ์ดํ์๋ show()๋ง ์คํ๋๋ ํ์

<br>

**ํด๊ฒฐ ๋ฐฉ๋ฒ**  

* hide()์์ ์ฌ์ ์ญ์ ํด์, ๋ค์ ๋์์ฌ ๋๋ง๋ค ์๋กญ๊ฒ scene์ด ์์ฑ๋๋๋ก ํ๋ค.

``` lua
function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		
		composer.removeScene('game') -- ์ถ๊ฐ

	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end
```

**์ค์! timer๋ ์ฅ๋ฉด์ด ์ ํ๋์ด๋ ๊ณ์ ๋์๊ฐ๊ธฐ ๋๋ฌธ์, ํ์๊ฐ ์๋ค๋ฉด timer๋ฅผ ๊ผญ ์ญ์ ํด์ฃผ์ด์ผ ํฉ๋๋ค**

* create()์ hide() ๋๋ค ๋ณ์์ ์ ๊ทผํ  ์ ์๋๋ก ํจ์ ๋ฐ์ ๋ณ์๋ฅผ ์ ์ธํด์ค๋๋ค.
```lua
local composer = require( "composer" )
local scene = composer.newScene()

local timeAttack

function scene:create( event )
	 ...
	 -- ์์์ ๋ณ์๋ฅผ ์ ์ธํ๊ธฐ ๋๋ฌธ์ ์์ local๋ฅผ ์ ๊ฑฐํด์ค๋ค.
	 timeAttack = timer.performWithDelay(1000, counter, 11)
```

* timer๋ฅผ ์ ์งํ๋ ์ฝ๋๋ฅผ ์์ฑํด์ค๋๋ค.
```lua
function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)

		composer.removeScene('game')
		timer.cancel(timeAttack) -- ์ถ๊ฐ

	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end
```
![Alt text](../image/week03/exam04.gif)  

* ์ ์์ ์ผ๋ก ์คํ๋ฉ๋๋ค.

<br>

**์ will์๋ค๊ฐ ์์ฑํ๋์??**

* did์๋ค๊ฐ ์์ฑํ  ๊ฒฝ์ฐ, ์ค๋ฅ๋ ๋์ง ์์ง๋ง ๊ฐ๋ scene์ ์ญ์ ํ๋ ํ์ด๋ฐ์ด ๋ฆ์ด์ ์ด๋ฏธ์ง๊ฐ ๊นจ์ง๋ ํ์์ด ๋ํ๋ฉ๋๋ค!

![Alt text](../image/week03/exam09.gif)  


#### 3. setting.lua ์ฐ๊ฒฐํ๊ธฐ
* create()์ ์ถ๊ฐํ๋ค.
``` lua
 	local setting = display.newText("์ค์ ", display.contentWidth*0.8, display.contentHeight*0.15)
 	setting.size = 50
 	setting:setFillColor(0.3)

 	function setting:tap( event )
 		--
 	end
 	setting:addEventListener("tap", setting)

 	sceneGroup:insert(setting)
```

* setting ์ฐฝ ๋์ฐ๊ธฐ (game.lua)
``` lua
	function setting:tap( event )
 		composer.showOverlay('setting')
 	end
```

* setting ์ฐฝ ์ง์ฐ๊ธฐ (setting.lua)
``` lua
 	function title:tap( event )
 		composer.hideOverlay('setting')
 	end
 	title:addEventListener("tap", title)
```

**์คํ ๊ฒฐ๊ณผ**  

![Alt text](../image/week03/exam05.gif)  

**setting ์ฐฝ ๋์ธ ๋ timer ์ผ์์ ์ง**  

* timeAttack์ ์ผ์์ ์งํ๊ณ , setting์์ timeAttack์ ์ ๊ทผํ  ์ ์๊ฒ composer.setVariable()๋ก ๊ฐ์ ๋๊ธด๋ค.
```lua
 	function setting:tap( event )
 		timer.pause(timeAttack)
 		composer.setVariable( "timeAttack", timeAttack )

 		composer.showOverlay('setting')
 	end
 	setting:addEventListener("tap", setting)
```

* composer.getVariable()๋ก ๊ฐ์ ๋ฐ์์์ timeAttack์ ์ฌ๊ฐํ๋ค.  

![Alt text](../image/week03/exam06.gif) 

**๋๋ค๋ฅธ ๋ฐฉ๋ฒ?**

* ํ์ด๋จธ๋ฅผ ๊ทธ๋ฅ ์ ์ญ๋ณ์๋ก ์ ์ธํด์ ๋ค๋ฅธ lua์์๋ ์ ๊ทผํ  ์ ์๋๋ก ํ  ์๋ ์์ต๋๋ค.
* TIP: ์ ์ญ ๋ณ์๋ ํท๊ฐ๋ฆฌ์ง ์๊ฒ main.lua์ ์ ์ธํด์ ์ฌ์ฉํ๊ธฐ 

<br>

### ๐ ์ด๋ฒ์ฃผ ๊ณผ์  ์๋ด
*  (์ ํ ๊ณผ์ ) Lua ์คํฐ๋ ๊นํ๋ธ ๋ถ๋งํฌํ๊ธฐ
	* ์ง๊ธ๊น์ง์ ์คํฐ๋๊ฐ ๋์์ด ๋์จ๋ค๋ฉด ์์ ์ข์ธก ์๋จ์ star ๋ฒํผ์ ๋๋ฌ์ฃผ์ธ์!
		- ๊นํ๋ธ ์์ด๋๊ฐ ์๋ค๋ฉด ์ด๋ฒ ๊ธฐํ์ ํ์๊ฐ์ ํด๋ณด๋ ๊ฒ๋ ์ข์ต๋๋ค!

	![Alt text](../image/week03/exam08.gif) 

<br>


*  ending์์ ๊ฒ์ ๊ฒฐ๊ณผ์ ๋ฐ๋ผ์ endingText.text๊ฐ ๋ค๋ฅด๊ฒ ๋ํ๋๊ฒ ๋ณ๊ฒฝํด๋ณด์ธ์. ํ๋ก์ ํธ๋ฅผ ์ ์ฒด ์์ถํด์ ์ ์ถํฉ๋๋ค.
	- ํํธ: composer.setVariable(), composer.getVariable()๋ฅผ ์ด์ฉํ๋ค.

	![Alt text](../image/week03/exam07.gif) 

* ์ถ๊ฐ ๊ณผ์ (์ ํ): game.lua์์ ๋ฐฐ๊ฒฝ์์์ ์ถ๊ฐํด๋ณด์ธ์!
	- ์กฐ๊ฑด 1: ending.lua๋ก ๋์ด๊ฐ ๋๋ ๋ฐฐ๊ฒฝ์์์ ๋ฉ์ถ ๊ฒ or ๋ค๋ฅธ ๋ฐฐ๊ฒฝ์์์ ํ ๊ฒ
	- ์กฐ๊ฑด 2: setting.lua๊ฐ ๋ณด์ฌ์ง ๋๋ ๋ฐฐ๊ฒฝ์์์ด ๊ทธ๋๋ก ๋ค๋ฆฌ๊ฒ ํ  

<br>

#### ๐ [์ ์ถ ํผ ๋งํฌ](https://forms.gle/YBkNfMRhko5yadhG9)