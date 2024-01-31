# :pushpin: Thumb up
> 2~30대 여성들을 위한 패션 대시보드 


</br>

## 1. 제작 기간 & 참여 인원
- 2023년 12월 15일 ~ 2024년 01월 24일
- 팀 프로젝트
- 참여인원 : 엄다은(팀장), 정현지(팀원), 임해솔(팀원), 방찬혁(팀원), 강재희(팀원)

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 1.6
  - Springframework 5.0.7
  - MYSQL 5.1
  - Apache Tomcat 8.5


#### `Front-end`
  - JavaScript
  - HTML
  - CSS

</br>

## 3. ERD 설계
![KakaoTalk_20240121_161201916](https://github.com/2023-SMHRD-IS-AI1/RepoUp/assets/153901365/75738182-5d4c-4156-bafe-f7d8ecc331d8)

## 4. 핵심 기능
이 서비스의 핵심 기능은 의상 및 코디 추천 기능입니다.  
사용자는 원하는 항목에 대해서 좋아요와 옷장 추가를 누르면 끝입니다.
이 기능의 흐름을 보면, 서비스가 어떻게 동작하는지 알 수 있습니다.  

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow1.png)

### 4.2. 사용자 요청
![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_vue.png)

- **URL 정규식 체크** :pushpin: [코드 확인](https://github.com/JungHyung2/gitio.io/blob/95b4c4f06a2a5a74a00f81a3c3fcc003c994725f/index.html#L15C8-L15C26)
  - Vue.js로 렌더링된 화면단에서, 사용자가 등록을 시도한 URL의 모양새를 정규식으로 확인합니다.
  - URL의 모양새가 아닌 경우, 에러 메세지를 띄웁니다.

- **Axios 비동기 요청** :pushpin: [코드 확인]()
  - URL의 모양새인 경우, 컨텐츠를 등록하는 POST 요청을 비동기로 날립니다.

### 4.3. Controller

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_controller.png)

- **요청 처리** :pushpin: [코드 확인](https://github.com/2023-SMHRD-KDT-IOT-4/Repo/blob/94e1b3a93c48cc3fdb51d4468de151930705faa6/Middle_project12/src/main/webapp/WEB-INF/views/BoardContent.jsp#L20)
  - Controller에서는 요청을 화면단에서 넘어온 요청을 받고, Service 계층에 로직 처리를 위임합니다.

- **결과 응답** :pushpin: [코드 확인]()
  - Service 계층에서 넘어온 로직 처리 결과(메세지)를 화면단에 응답해줍니다.

### 4.4. Service

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_service1.png)

- **Http 프로토콜 추가 및 trim()** :pushpin: [코드 확인]()
  - 사용자가 URL 입력 시 Http 프로토콜을 생략하거나 공백을 넣은 경우,  
  올바른 URL이 될 수 있도록 Http 프로토콜을 추가해주고, 공백을 제거해줍니다.

- **URL 접속 확인** :pushpin: [코드 확인]()
  - 화면단에서 모양새만 확인한 URL이 실제 리소스로 연결되는지 HttpUrlConnection으로 테스트합니다.
  - 이 때, 빠른 응답을 위해 Request Method를 GET이 아닌 HEAD를 사용했습니다.
  - (HEAD 메소드는 GET 메소드의 응답 결과의 Body는 가져오지 않고, Header만 확인하기 때문에 GET 메소드에 비해 응답속도가 빠릅니다.)

  ![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_service2.png)

- **Jsoup 이미지, 제목 파싱** :pushpin: [코드 확인]()
  - URL 접속 확인결과 유효하면 Jsoup을 사용해서 입력된 URL의 이미지와 제목을 파싱합니다.
  - 이미지는 Open Graphic Tag를 우선적으로 파싱하고, 없을 경우 첫 번째 이미지와 제목을 파싱합니다.
  - 컨텐츠에 이미지가 없을 경우, 미리 설정해둔 기본 이미지를 사용하고, 제목이 없을 경우 생략합니다.


### 4.5. Repository

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_repo.png)

- **컨텐츠 저장** :pushpin: [코드 확인]()
  - URL 유효성 체크와 이미지, 제목 파싱이 끝난 컨텐츠는 DB에 저장합니다.
  - 저장된 컨텐츠는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. 이미지 분석 머신러닝 모델 학습 중 오류 발생 문제
- 이미지 분석 모델은 EfficientNET을 사용하였음.

- 초기 분석 이미지는 의상 데이터가 118000건, 코디 데이터가 20000건

- 머신러닝 모델 활용의 용이성을 위하여 학습 환경은 Google Colab에서 진행

- Colab은 정책상 약 10분 이상 반응이 없을 경우 런타임을 중지시킴
- > 때문에 Colab 학습 중 중단을 막기 위해 개발자 모드에서 임의로 런타임을 연장시킴
  ![image](https://github.com/2023-SMHRD-IS-AI1/RepoUp/assets/148600254/2e6c31c7-6778-42e4-9260-ae300fe8a8b5)
- 단, 이런 경우에도 12시간 이상 활용시 강제로 런타임이 중지됨. 따라서 12시간 안에 학습을 완료시킬 경량화된 코드를 필요로 함

- 이 때문에 EfficientNet B0 모델을 사용
  
- 또한, 이미지의 수가 많아 로드와 전처리 과정에서 잦은 오류가 발생하여 최종적으로 의상 데이터 812건, 코디 데이터 498건으로 데이터 규모 축소

- Colab 특성상 런타임 종료시 업로드한 이미지가 모두 삭제되기 때문에 이미지는 모두 구글 드라이브에 저장하고 Colab과 구글 드라이브를 연결하여 이용


- Colab과 Eclipse를 연결하기가 어려움. 연결 방법을 고민하다가 해당 알고리즘에서는 일단 유사도의 결과만 필요함을 상기,
또한 당장 이미지를 추가할 예정이 없기 때문에 학습이 여러번 반복되어야 할 이유가 없었다.

- 이미지 유사도 분석을 진행하여 옷에 대한 코디의 유사도를 측정하고 DataFrame 형식으로 작성. 
![image](https://github.com/2023-SMHRD-IS-AI1/RepoUp/assets/148600254/73b681bc-1f12-4bf9-9dc2-c20f4a5d4f20)
![image](https://github.com/2023-SMHRD-IS-AI1/RepoUp/assets/148600254/28783a12-eb48-4bc3-b9b6-f5a227b74e93)

- 프로젝트에서는 유사도가 높은 코디를 전부 보여주는 것이 아닌 4위까지 보여줄 것이므로 결과를 내림차순으로 정렬하여 4위까지 정리.
![image](https://github.com/2023-SMHRD-IS-AI1/RepoUp/assets/148600254/a4d99e53-e001-4cf8-938f-9019303e8cbc)
![image](https://github.com/2023-SMHRD-IS-AI1/RepoUp/assets/148600254/775841fb-a3e0-4fd9-ad3c-d615f6e0f782)

- 그리고 결과 DataFrame을 csv형식으로 저장하여 해당 파일을 데이터베이스 중 의상 필드에 컬럼을 추가해서 각각의 의상에 삽입하였다.

- 결과적으로, 특정 의상을 옷장에 넣을 경우 해당 의상과 유사도가 높은 4위까지의 코디를 추천해주는 추천 알고리즘을 구현할 수 있었다.


</br>

## 6. 그 외 트러블 슈팅
<details>
<summary>좋아요 / 옷장 추가 버튼 클릭 시 페이지를 다시 호출하면서 맨 위로 올라가는 문제점</summary>
<div markdown="1">

- Ajax를 활용하여 비동기화 방식으로 전환하여 버튼 클릭시 페이지가 바로 새로고침 되는 것을 막음
- ![image](https://github.com/2023-SMHRD-IS-AI1/RepoUp/assets/148600254/3c99ae12-65b5-4309-aa3c-22cf0196071b)

</div>
</details>

<details>
<summary>vue-devtools 비로그인 이용자의 이용 기능 제한 문제</summary>
<div markdown="1">
  
  - alert 기능을 사용하여 비로그인 사용자의 접근을 제한
  - ![image](https://github.com/2023-SMHRD-IS-AI1/RepoUp/assets/148600254/5ffc2d09-d950-43dd-a1ac-3612388ff948)
  
</div>
</details>

<details>
<summary>기존 데이터와 새로운 데이터를 접목시키는 과정중 인덱스 번호 불일치로 생긴 문제</summary>
<div markdown="1">
  
  - 기존 데이터중 제거된 행이 존재하여 DB상 없는 인덱스 번호 존재함. 
  - 새로운 데이터에서 제거된 행만 따로 뽑기는 긴 수작업이 필요할것으로 예상됨
  - 또한 DB에 입력시 해당 데이터와 동일한 길이의 데이터를 동일한 인덱스번호를 통해 추가해야 되기 때문에 데이터의 길이 및 내용 확인 필요.
  - DB에서 기존 데이터의 인덱스 번호만 꺼내와서 배열로 만들고 해당 배열을 통해 새로운 데이터를 정제하려고 함.
  - 하지만 배열이 튜플 형식으로 되어있어 사용이 어려웠음.
  - 튜플로 된 배열에서 값을 하나씩 꺼내와 리스트로 제작 후 그 값을 전처리 실시.
  - 해당 리스트를 통해 새로운 데이터 정제, DB에 추가함.
  
</div>
</details>

<details>
<summary> 네이버 데이터랩 API의 검색어 개수 제한 문제 </summary>
<div markdown="1">
  
  - 네이버 데이터랩에서 인기 검색어를 10위까지 요청하여 그래프로 제시하려고 하였으나 네이버 데이터랩 API의 검색어 갯수 제한은 5개.
  - 또한 검색량 자체를 제공하는 것이 아닌 5개중 가장 높은 검색어를 기준으로 하여 퍼센티지(%)로 제시하는 방식

![image](https://github.com/2023-SMHRD-IS-AI1/RepoUp/assets/148600254/f8d8c9e0-5b1d-480c-9b0f-3b3aa11e2e34)

  - 따라서 10개의 검색어 중 1위를 제외하고 3개의 조합으로 나누어 요청 자체를 3번 진행했으며 세 번의 요청 모두 API요청값에 1위인 검색어를 모두 포함하여 상대비율을 고정시켰다.
  - 결과적으로 1위 검색어를 100% 기준으로 타 검색어들의 검색량 비율을 알 수 있었고, 해당 데이터를 시각화하였다. 
  
</div>
</details>

    
</br>

## 6. 회고 / 느낀점
>프로젝트 개발 회고 글: https://zuminternet.github.io/ZUM-Pilot-integer/

