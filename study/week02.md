# 2๏ธโฃ  event ๊ธฐ์ด

## ๐ ๋ชฉ์ฐจ
* [event ์ดํดํ๊ธฐ](#-event-์ดํดํ๊ธฐ)
* [๊ฐ๋จ ์ค์ต ๋ฐ๋ผํ๊ธฐ](#%EF%B8%8F%EF%B8%8F-๊ฐ๋จ-์ค์ต-๋ฐ๋ผํ๊ธฐ)
* [์์  ๊ฒ์ ๋ฐ๋ผํ๊ธฐ](#-์์ -๊ฒ์-๋ฐ๋ผํ๊ธฐ)
* [์ด๋ฒ์ฃผ ๊ณผ์  ์๋ด](#-์ด๋ฒ์ฃผ-๊ณผ์ -์๋ด)

<br>

### ๐ event ์ดํดํ๊ธฐ
* **event๋?**
	- interactive application์ ๊ธฐ์ด!
	- object์ **event listener ํจ์๊ฐ ์ถ๊ฐ๋์ด์์๋, ํด๋น event๊ฐ ๋ฐ์ํ๋ฉด event listener ํจ์๊ฐ ์คํ**์ด ๋๋ค!
	- ex. background์ tap ์ด๋ฒคํธ ํจ์๋ฅผ ์ถ๊ฐ๋์ด์์๋, background๋ฅผ tapํ๋ฉด ํด๋น ์ด๋ฒคํธ ๋ฆฌ์ค๋๊ฐ ์คํ์ด ๋๋ค.
	```lua
		local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)

		local function tapEventListener( event )
			print("๋ฐฐ๊ฒฝ์ ํด๋ฆญํ์ต๋๋ค")
		end 

		background:addEventListener("tap", tapEventListener)
	```

<br>

* **eventListener ์ถ๊ฐํ๋ ๋ฐฉ๋ฒ**
	1. **์ด๋ฒคํธ ๋ฆฌ์ค๋ ํจ์๋ฅผ ์์ฑํ๋ค.**
		- **event**๋ผ๋ ๋งค๊ฐ๋ณ์๋ฅผ ํตํด ์ผ์ด๋ event ์ ๋ณด๊ฐ ๋์ด์จ๋ค!
			+ Ex. event.target: ์ด๋ฒคํธ์ ํ๊ฒ์ด ๋๊ตฌ๋, ์์ ๊ฒฝ์ฐ์ background  
			
				```lua
				event.target.x = 100  
				event.target.alpha = 0.5  
				event.target:setFillColor(1, 0, 0)  
				```
		- ์ด๋ฒคํธ๊ฐ ์คํ๋์์๋ ์คํ๋  ์ฝ๋๋ฅผ ์ด๋ฒคํธ ๋ฆฌ์ค๋ ์์ ์์ฑํด์ค๋ค.
			+ ์ด๋ฒคํธ ์ข๋ฅ์ ๋ฐ๋ผ event ๊ฐ์ฒด๋ฅผ ์ด์ฉํด์ ๋ณต์กํ๊ฒ ๊ตฌํํด์ค์ผ ํ๋ ๊ฒฝ์ฐ๋ ์๋ค.
			+ Ex. touch ์ด๋ฒคํธ  
			
				```lua
					local function touchEventListener( event )  
						if( event.phase == "began" ) then  
							-- ํฐ์น๋ฅผ ์์ํจ  
						elseif( event.phase == "moved" ) then  
							-- ๊ฐ์ฒด๋ฅผ ๋๋ฅด๊ณ  ์๋ ์ํ๋ก ์์ง์(๋๋๊ทธ)  
						elseif ( event.phase == "ended" or event.phase == "cancelled") then  
							-- ํฐ์น๊ฐ ๋๋จ  
						end  
					end  
				```
	2. **์ค๋ธ์ ํธ์ ์ด๋ฒคํธ ๋ฆฌ์ค๋ ํจ์๋ฅผ ์ถ๊ฐํ๋ค.**
		- addEventListener ๊ธฐ๋ณธ ํฌ๋งท
			```lua
				object:addEventListener( event ์ข๋ฅ, eventListener )

				background:addEventListener("tap", tapEventListener)
			```

<br>

* **event ์ข๋ฅ**
	<br>โ: ์ค๋ ์คํฐ๋์์ ๋ค๋ฃธ
	- โ[**tap**](https://docs.coronalabs.com/guide/events/touchMultitouch/index.html#tap-detection)
	- โ[**touch**](https://docs.coronalabs.com/guide/events/touchMultitouch/index.html#touch-detection)
	- [**key**](https://docs.coronalabs.com/api/event/key/index.html)
	- [**mouse**](https://docs.coronalabs.com/api/event/mouse/index.html)
	- โ[<u>**timer**</u>](https://docs.coronalabs.com/api/library/timer/index.html)

<br>

### ๐ต๏ธโโ๏ธ ๊ฐ๋จ ์ค์ต ๋ฐ๋ผํ๊ธฐ
#### tap ์ด๋ฒคํธ ์ฌ์ฉํด๋ณด๊ธฐ
* **์ผ๋จ ํด๋ณธ๋ค**
	- view1.lua์ ์ ๋ฒ ์คํฐ๋์์ ์งํํ ๋ค์ ์ค์ ์์ฑํด๋ด๋๋ค.
		```lua
			local function tapEventListener( event )
				print("๋ธ๋์ ๋ค๋ชจ๋ฅผ ํด๋ฆญํ์ต๋๋ค!")
			end
		
			object[3]:addEventListener("tap", tapEventListener)
		```
	- ์คํ๊ฒฐ๊ณผ  
		![Alt text](../image/week02/exam01.gif)

* **Quiz. ๋ค์๊ณผ ๊ฐ์ ๊ฒฝ์ฐ์๋ tap ์ด๋ฒคํธ๊ฐ ์๋ํ ๊น์??**
	- ํด๋น ์ค๋ธ์ ํธ๊ฐ ํฌ๋ช๋๊ฐ 0์ผ ๋
	- ๋ค๋ฅธ ์ค๋ธ์ ํธ ๋ค์ ์กด์ฌํ ๋

<br>

* ๐ต๏ธโโ๏ธ ์ ๋ต์..
	- X
	- O

<br>

#### touch ์ด๋ฒคํธ ์ฌ์ฉํด๋ณด๊ธฐ
* **์ผ๋จ ํด๋ณธ๋ค**
	- ์ด์ด์ ๋ค์ ์ฝ๋๋ฅผ ์ถ๊ฐํด๋ณด์ธ์.
		```lua
			local function touchEventListener( event )
				if( event.phase == "began" ) then
					print("ํฐ์น๋ฅผ ์์ํจ")
				elseif( event.phase == "moved" ) then
					print("๊ฐ์ฒด๋ฅผ ๋๋ฅด๊ณ  ์๋ ์ํ๋ก ์์ง์(๋๋๊ทธ)")
				elseif ( event.phase == "ended" or event.phase == "cancelled") then
					print("ํฐ์น๊ฐ ๋๋จ")
				end
			end
		
			object[3]:addEventListener("touch", touchEventListener)
		```
	
	- ์คํ๊ฒฐ๊ณผ  
	![Alt text](../image/week02/exam02.gif)

* **๋ง์ฐ์ค๋ก ์ค๋ธ์ ํธ ๋๋๊ทธํ๊ธฐ**
	- ๋ค์ ์ฝ๋๋ฅผ ์ถ๊ฐ
	```lua
		local function drag( event )
			if( event.phase == "began" ) then
				display.getCurrentStage():setFocus( event.target )
				event.target.isFocus = true
				-- ๋๋๊ทธ ์์ํ  ๋

			elseif( event.phase == "moved" ) then

				if ( event.target.isFocus ) then
					-- ๋๋๊ทธ ์ค์ผ ๋
					event.target.x = event.xStart + event.xDelta
					event.target.y = event.yStart + event.yDelta
				end

			elseif ( event.phase == "ended" or event.phase == "cancelled") then
				display.getCurrentStage():setFocus( nil )
				event.target.isFocus = false
				-- ๋๋๊ทธ ๋๋ฌ์ ๋

			end
		end
	```

	- ๊ทธ๋ฐ๋ฐ ์กฐ๊ธ ์ด์ํ๋ค?  
		![Alt text](../image/week02/exam03.gif)  
		์ปค์ ์์น์ ์ค๋ธ์ ํธ ์์น๊ฐ ๋ง์ง ์์
		+ ์ด์ : object๋ฅผ ๋์คํ๋ ์ด ๊ทธ๋ฃน์ ๋ฃ์ ์ฑ๋ก ๊ทธ๋ฃน ์ฑ๋ก ์์น ์ด๋์ ํ๊ธฐ ๋๋ฌธ!
		+ ํด๊ฒฐ ๋ฐฉ๋ฒ: ์ค๋ธ์ ํธ๋ฅผ ๋๋๊ทธํ ๋ ์ค๋ธ์ ํธ ๊ทธ๋ฃน์ ์ขํ๊ฐ์ ๋นผ์ฃผ๋ฉด ๋ฉ๋๋ค.
		
		```lua
			event.target.x = event.xStart + event.xDelta - event.target.parent.x
			event.target.y = event.yStart + event.yDelta - event.target.parent.y
		```
		+ ์์  ํ  
		![Alt text](../image/week02/exam04.gif)  
<br>

#### โฐ timer ์ด๋ฒคํธ ์ฌ์ฉํด๋ณด๊ธฐ
timer ์ด๋ฒคํธ๋ ์ tap, touch ์ด๋ฒคํธ์ ์ฌ์ฉ๋ฒ์ด ์ฝ๊ฐ ๋ค๋ฆ

* **timer.performWithDelay()**
	```lua
		timer.performWithDelay( delay, listener [, iterations] [, tag] )
	```
	- delay: ๋ฆฌ์ค๋ ํจ์ ์คํ๊น์ง ๋๋ ์ด ์๊ฐ
		+ 1000 = 1์ด
	- listener: ๋ฆฌ์ค๋ ํจ์ ์ด๋ฆ
	- iterations: delay๋ง๋ค ๋ฐ๋ณต ํ์
		+ 0 ๋๋ -1์ ๋ฌดํ ๋ฐ๋ณต

* **์ถ๊ฐ ๊ธฐ๋ฅ๋ค**
	- timer.cancle( timerName ): ์ ์ง
	- timer.pause( timerName ): ์ผ์ ์ ์ง
	- timer.resume( timerName ): ์ฌ์์
	- timer.cancleAll(), timer.puaseAll(), timer.resumeAll()
		
* **์ผ๋จ ํด๋ณด๊ธฐ**
	- 1์ด ๋ค ์ธ๋ฆฌ๋ ์๋ ์ถ๊ฐํด๋ณด๊ธฐ
		```lua
			local function alarm( event )
				print("1์ด ๋ค์๋๋ค.")
			end

			local timeAttack = timer.performWithDelay(1000, alarm)
		```
		+ ์คํ๊ฒฐ๊ณผ   
		![Alt text](../image/week02/exam05.gif)
	
	- 10์ด๋ฅผ ์ธ๋ ์นด์ดํฐ ์ถ๊ฐ
		```lua
			local count = 1
			local function counter( event )
				print(count.."์ด๊ฐ ์ง๋ฌ์ต๋๋ค.")
				count = count + 1
			end

			local timeAttack = timer.performWithDelay(1000, counter, 10)
		```
		+ ์คํ๊ฒฐ๊ณผ  
		![Alt text](../image/week02/exam06.gif)

<br>

### ๐ฎ ์์  ๊ฒ์ ๋ฐ๋ผํ๊ธฐ

#### ๐ฒ ์ฃผ์ฌ์ tap ์ด๋ฒคํธ ์ถ๊ฐํ๊ธฐ
![Alt text](../image/week02/exam07.gif)  

* game.lua์์ ์ด์ด์ ์ฝ๋ ์ถ๊ฐ
	```lua
		local function tapDice( event )
			for i = 1, 6 do
				dice[i].alpha = 0 
			end
			dice[math.random(6)].alpha = 1
		end

		diceGroup:addEventListener("tap", tapDice)
	```

<br>

#### ๐ฅ๐ฅ๐ฅ ๋น๊ทผ touch ์ด๋ฒคํธ ์ถ๊ฐํ๊ธฐ feat.Drag
##### ์ผ๋จ ์์ง์ด๊ธฐ ํ๊ธฐ
![Alt text](../image/week02/exam08.gif)   

* ์ฝ๋ ์ถ๊ฐ
	```lua
		local function dragCarrot( event )
			if( event.phase == "began" ) then
				display.getCurrentStage():setFocus( event.target )
				event.target.isFocus = true
				-- ๋๋๊ทธ ์์ํ  ๋

			elseif( event.phase == "moved" ) then

				if ( event.target.isFocus ) then
					-- ๋๋๊ทธ ์ค์ผ ๋
					event.target.x = event.xStart + event.xDelta
					event.target.y = event.yStart + event.yDelta
				end

			elseif ( event.phase == "ended" or event.phase == "cancelled") then
				display.getCurrentStage():setFocus( nil )
				event.target.isFocus = false
				-- ๋๋๊ทธ ๋๋ฌ์ ๋

			end
		end

		for i = 1, 5 do
			carrot[i]:addEventListener("touch", dragCarrot)
		end
	```

<br>

##### ๐ฐ ๋น๊ทผ์ ํ ๋ผ์๊ฒ ์ฃผ๋ฉด ์ ์ ์ป๊ธฐ
![Alt text](../image/week02/exam09.gif)  

* ์ฝ๋ ์์  
	```lua
		local function dragCarrot( event )
			if( event.phase == "began" ) then
				display.getCurrentStage():setFocus( event.target )
				event.target.isFocus = true
				-- ๋๋๊ทธ ์์ํ  ๋

			elseif( event.phase == "moved" ) then

				if ( event.target.isFocus ) then
					-- ๋๋๊ทธ ์ค์ผ ๋
					event.target.x = event.xStart + event.xDelta
					event.target.y = event.yStart + event.yDelta
				end

			elseif ( event.phase == "ended" or event.phase == "cancelled") then
				display.getCurrentStage():setFocus( nil )
				event.target.isFocus = false
				-- ๋๋๊ทธ ๋๋ฌ์ ๋
				if ( event.target.x > bunny.x - 50 and event.target.x < bunny.x + 50
					and event.target.y > bunny.y - 50 and event.target.y < bunny.y + 50) then

					display.remove(event.target) -- ๋น๊ทผ ์ญ์ ํ๊ธฐ
					score.text = score.text + 1 -- ์ ์ ์ฌ๋ฆฌ๊ธฐ
				end
			end
		end

		for i = 1, 5 do
			carrot[i]:addEventListener("touch", dragCarrot)
		end
	```

<br>

##### ๐ฅ๋ค๋ฅธ ๊ณณ์ ๋น๊ทผ์ ๋๋ฉด ์๋๋๋ก ๋์๊ฐ๊ธฐ
![Alt text](../image/week02/exam10.gif)  

* ์ด๋ ๊ฒ ํ๋ฉด ๋  ๊ฒ ๊ฐ์ง๋ง..?
	```lua
		elseif ( event.phase == "ended" or event.phase == "cancelled") then
			display.getCurrentStage():setFocus( nil )
			event.target.isFocus = false
			-- ๋๋๊ทธ ๋๋ฌ์ ๋
			if ( event.target.x > bunny.x - 50 and event.target.x < bunny.x + 50
				and event.target.y > bunny.y - 50 and event.target.y < bunny.y + 50) then

				display.remove(event.target) -- ๋น๊ทผ ์ญ์ ํ๊ธฐ
				score.text = score.text + 1 -- ์ ์ ์ฌ๋ฆฌ๊ธฐ
			else
				-- ์๋ ์๋ฆฌ๋ก ๋์๊ฐ๊ธฐ
				event.target.x = event.xStart
				event.target.y = event.yStart
			end
		end
	```

	![Alt text](../image/week02/exam11.gif)  

	- ์กฐ๊ธ์ฉ ์ค์ฐจ๊ฐ ์๊ธฐ๋ ๊ฒ์ ํ์ธํ  ์ ์์ต๋๋ค.
	
	- **ํด๊ฒฐ๋ฐฉ๋ฒ**  
		+ event.target์ ๋ณ์๋ฅผ ํ๋ ๋ฌ์๋์ด ์ด๊ธฐ ์ขํ๋ฅผ ์ ์ฅํด์ ์ฌ์ฉํฉ๋๋ค.
			* event.target.initX, event.target.initY

* ์ฝ๋ ์์ 
	```lua
		local function dragCarrot( event )
			if( event.phase == "began" ) then
				display.getCurrentStage():setFocus( event.target )
				event.target.isFocus = true
				-- ๋๋๊ทธ ์์ํ  ๋
				event.target.initX = event.target.x
				event.target.initY = event.target.y

			elseif( event.phase == "moved" ) then

				if ( event.target.isFocus ) then
					-- ๋๋๊ทธ ์ค์ผ ๋
					event.target.x = event.xStart + event.xDelta
					event.target.y = event.yStart + event.yDelta
				end

			elseif ( event.phase == "ended" or event.phase == "cancelled") then
				display.getCurrentStage():setFocus( nil )
				event.target.isFocus = false
				-- ๋๋๊ทธ ๋๋ฌ์ ๋
				if ( event.target.x > bunny.x - 50 and event.target.x < bunny.x + 50
					and event.target.y > bunny.y - 50 and event.target.y < bunny.y + 50) then

					display.remove(event.target) -- ๋น๊ทผ ์ญ์ ํ๊ธฐ
					score.text = score.text + 1 -- ์ ์ ์ฌ๋ฆฌ๊ธฐ
				else
					event.target.x = event.target.initX
					event.target.y = event.target.initY
				end
			end
		end

		for i = 1, 5 do
			carrot[i]:addEventListener("touch", dragCarrot)
		end
	```

<br>

#### โฐ timer ์ด๋ฒคํธ ์ถ๊ฐํ๊ธฐ

* **์ ๋ฒ ์๊ฐ์ ๊น๋จน์ Text ํ๋ ์ถ๊ฐํ๊ธฐ**
	```lua
		local time= display.newText(10, display.contentWidth*0.9, display.contentHeight*0.15)
		time.size = 100
		time:setFillColor(0)
		time.alpha = 0.5

		sceneGroup:insert(time)
	```

* **timer ์ถ๊ฐํ๊ธฐ**  

	![Alt text](../image/week02/exam12.gif)  

	![Alt text](../image/week02/exam13.gif)  

	- ์ฝ๋ ์์  (drag ํจ์์ ์ ์ ์ฌ๋ฆฌ๊ธฐ ๋ค์ ๋ถ๋ถ์)
		```lua
			if( score.text == '5') then
				score.text = '์ฑ๊ณต!'
				time.alpha = 0
			end
		```

	- ์ฝ๋ ์ถ๊ฐ
		```lua
		local function counter( event )
			time.text = time.text - 1
	
			if( time.text == '5' ) then
				time:setFillColor(1, 0, 0)
			end
	
			if( time.text == '-1') then
				time.alpha = 0
	
				if( score.text ~= '์ฑ๊ณต!' ) then
					score.text = '์คํจ!'
					bunny:rotate(90)
					
					for i = 1, 5 do
						carrot[i]:removeEventListener("touch", dragCarrot)
					end
				end
			end
		end
	
		local timeAttack = timer.performWithDelay(1000, counter, 11)
		```


<br>

### ๐ ์ด๋ฒ์ฃผ ๊ณผ์  ์๋ด
#### ์ ์ถ ๋ง๊ฐ: 7/17(์ผ) ์์ 

<br>

* **ํด๋ฆญํ๋ฉด ์ด๋ํ๋ tap ์ด๋ฒคํธ ๋ง๋ค๊ธฐ**  

	![Alt text](../image/week02/exam14.gif)  

	- view1.lua๋ฅผ ๋ณํํด์ ์์ ๊ฐ์ ์์ ๋ฅผ ๋ง๋ค์ด ์ด๋ฒคํธ ๋ฆฌ์ค๋ ํจ์๋ฅผ ์ ์ถํ์ธ์.
	
	- ์ ์ด๋ฏธ์ง์ ๋์ผํ์ง ์์๋ ๋ฉ๋๋ค. ๋์ถฉ ํญํ๋ฉด ์์ง์ธ๋ค๋ฉด OK

	- [๋์ ] ์ค๋ธ์ ํธ๊ฐ ํ๋ฉด ๋ฐ์ผ๋ก ๋๊ฐ์ง ์๋๋ก ํด๋ณด๊ธฐ

<br>

#### ๐ [์ ์ถ ํผ ๋งํฌ](https://forms.gle/sfkMXzFfWLiuhfU9A)