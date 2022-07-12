# 3️⃣ Scene

## 🏛 목차
* [event 이해하기](#-event-이해하기)
* [예제 게임 따라하기](#-예제-게임-따라하기)
* [이번주 과제 안내](#-이번주-과제-안내)

<br>

### 💡 개념 이해하기
🔗 [Composer Library](https://docs.coronalabs.com/guide/system/composer/index.html)
#### Composer란?
* Composer library는 Scene을 만들고, 전환하는 등의 기능을 제공하는 라이브러리이다.

* main.lua 살펴보기

	``` lua  
	local composer = require "composer"  -- include composer library
	
	local function onFirstView( event )  
		composer.gotoScene( "view1" ) -- view1에 해당하는 장면으로 이동
	end  

	onFirstView()  
	```

* scene을 생성하는 view1.lua 앞부분 살펴보기 

	``` lua  
	local composer = require( "composer" )  
	local scene = composer.newScene()

	~ 생략  
	```
	
<br>
	
#### Scene 관련 이벤트
* Scene Event Funtion  

	- 
	| 함수 | 설명  |  
	| ---| --- |  
	| scene:create() | 처음에 scene이 생성되었을 때 |
	| scene:show() | scene이 화면에 나타나기 직전(will) / 직후(did) |
	| scene:hide() |  scene이 화면에서 사라지기 직전(will) / 직후(did)|
	| scene:destroy() | 장면이 삭제될 때 |

		<img src="https://docs.coronalabs.com/images/simulator/composer-flowchart.png"  width="50%"/>

	- view1.lua 뒷 부분  
	
		``` lua  
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
	
#### [scene 관련 함수](https://docs.coronalabs.com/api/library/composer/index.html)
다음은 scene 관련 함수들 중 일부입니다.

* scene 전환과 관련된 함수
	- composer.gotoScene()
	- composer.removeScene()
	- overlay 함수
		+ composer.showOverlay()
		+ composer.hideOverlay()
* scene 사이에서 변수를 주고 받기위한 함수
	+ composer.setVariable( variableName, value )
	- composer.getVariable( variableName )
	
<br>

### 🎮 예제 게임 따라하기
1. 실습 코드 적절하게 옮겨보기
2. 새로운 씬 만들기 (ending.lua, setting.lua)
3. game.lua와 ending.lua 연결하기 (다시 돌아가면 게임 새로 시작 show 다시 실행, setVariable도 사용해보기)
4. game.lua와 setting.lua 연결하기 (다시 돌아가면 게임 그대로 이어서 timer 다시 실행, show는 그대로)

<br>

### 🕒 이번주 과제 안내
1. 머하지