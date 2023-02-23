# 스토어 출시용 apk 빌드 방법

> ### 패키지 명은 `ddwu.npc.(게임 고유 이름)`으로 설정합니다. (추후 구글 플레이 스토어 주소에 포함됩니다.)
> ex. `ddwu.npc.alsum'

<br>

## 1️⃣ 디버그용 apk 파일 생성하기 (출시 불가)
![Alt text](../image/supple02/02.png)  

![Alt text](../image/supple02/01.png)

## 2️⃣ 스토어 출시용 apk 빌드 방법



### 첫번째. android studio를 이용해 release keystore를 생성한다.

[android studio 설치 없이 keystore 생성하기](#release-keystore를-생성하는-또다른-방법)

![Alt text](../image/supple02/03.png)  

![Alt text](../image/supple02/04.png)  

![Alt text](../image/supple02/05.png)  

![Alt text](../image/supple02/06.png)  
적절히 입력한다.  

![Alt text](../image/supple02/07.png)  
keystore 파일만 생성되었다면 OK 뒤 단계 할 필요없음

<br>

### release keystore를 생성하는 또다른 방법

1. 명령 프롬포트(cmd) 실행
2. cd (keystore 파일 저장할 경로. 저장할 폴더 위에 경로 복붙) 입력
     ex) cd C:₩key
3. keytool -genkey -alias (원하는 키 area 이름) -keyalg RSA -validity 10000 -keystore (원하는 keyname).keystore 입력
4. 필요한 내용 답변 후 생성 완료!

[블로그 글 참고](https://mosei.tistory.com/entry/keystore-%EB%A7%8C%EB%93%A4%EA%B8%B0)

<br>

### 두번째. 생성한 release keystore를 이용해 apk 빌드를 완료한다.
![Alt text](../image/supple02/08.png)  

package는 기본 설정에서 되도록 바꾸세요!
Ex) ddwu.npc.seongbaoul

<br>

#### 만약 막히면 아래를 참고
```
Solar2D에서 안드로이드 빌드 과정에서 오류가 나는 일을 생각보다 흔합니다..  
이유는 알 수가 없고, 포럼에서도 어쩌다 성공했는데 왜 되는지 모르겠다같은 글들이 많아요..  

개인 컴퓨터 환경에 따라서 단번에 성공할 수도 있고, 밑에 사항들을 모두 시도해봐도 실패하는 경우가 있습니다.  
일단 밑에 것들을 하나하나 기도하면서 시도해보고, 끝까지 안되면 도움을 요청해주세요.
```
`다시 시도`라는 말은 keystore를 다시 생성하는 것부터입니다!

1. 컴퓨터에 설치된 `JDK`가 `15 버전 이상`인지 확인하고 `Solar2D 최신 버전` 재설치 후 다시 시도해본다. : [관련 포럼](https://forums.solar2d.com/t/build-error-1/355008/2)
	- JDK를 재설치한 경우에는 [JAVA_PATH 환경 변수 수정](https://velog.io/@jaydev/JAVA%EC%9E%90%EB%B0%94-%ED%99%98%EA%B2%BD%EB%B3%80%EC%88%98-%EC%84%A4%EC%A0%95)되었는지 확인.
	
2. `vmware` (컴과 운영체제 등에서 사용하는 프로그램)이 설치되어 있다면, `작업 관리자`에서 백그라운드 프로세스에 vmware 관련 프로그램을 강제 종료하고 빌드를 시도해주세요. : 저는 이걸로 해결됐었습니다.

3. . keystore의 경로를 바꿔본다. : [관련 포럼](https://forums.solar2d.com/t/resolved-the-password-for-the-keystore-was-not-valid-or-the-key-store-was-not-valid/355084/5)
	* 다른 드라이브로 변경
	* 경로에 띄어쓰기 또는 한글이 포함되지 않도록 변경
	
4. keystore의 비밀번호를 설정할 때, 특수문자나 공백을 포함하지 않도록 한다. (알파벳 소문자+숫자)

5. 빌드 당시 패키지 명을 수정했는지 확인한다. package를 `ddwu.npc.(게임 고유 이름)`으로 설정한다.
	![Alt text](../image/supple02/08.png) 
	
6. windows10에서 모바일 핫스팟 아용해서 시도했었다면, 와이파이 이용해서 다시 시도해보기

7. 플레이 스토어 콘솔에 업로드했을때 다음과 같은 오류가 뜬다면, Solar2D 프로그램을 최신 버전으로 다시 다운로드 후, 다시 시도하면 해결됩니다.
	![Alt text](../image/supple02/09.png)  

<br>

+) [solar2D 포럼](https://forums.solar2d.com/) <- 관련 질문이 많아요.. 'keystore invaild' 검색해서 살펴봐보세요..

**+) 위에 것 이외의 방법으로 해결하신 분이 계시면 제보 바랍니다.**

<br>

* apk 빌드 관련은 개발팀장(스터디 담당자), 구글 개발자 콘솔 등 출시 관련은 DB팀장에게 문의
