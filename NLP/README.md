# 자연어 처리(NLP)

## 교육 기간
- 2020.08.31 ~ 

## 교육 내용
### 08.31
#### 자연어 처리(NLP)란?
- 인간의 언어(자연어)로 명령을 내리면 기계가 자연어 처리를 통해 이해하여 처리하고 그 결과를 사용자에게 전달하는 것
#### 자연어 처리의 중요성
- 비정형 데이터의 중요성
- 온라인 데이터의 중요성 (비정형 80%, 정형 20%)
- 소통 패러다임의 변화

### 09.01
#### 텍스트마이닝
- 비정형 데이터에서 분석 도구를 이용하여 새롭고 유용한 정보를 찾아내는 과정
  - 텍스트 문서에서 의미있는 정보를 추출하는 기술
  - 비정형 텍스트 데이터를 정형화하고 특징을 추출하는 과정 필요
  - 컴퓨터가 인식해 처리하는 자연어 처리(NLP) 기술에 기반을 두고 데이터를 가공하는 기술
#### 텍스트마이닝 기법
- 단어 빈도분석
- 군집분석
- 토픽모델링
- 감정분석
- 연관어 분석
#### 자연어 처리 텍스트 분석 절차
1. 데이터 수집 단계
    - 데이터 수집
    - 데이터 정제
2. 텍스트 전처리 단계
    - 토큰화
    - 품사 부착
    - 원형 복원
    - 불용어 처리
3. 텍스트 분석
    - 주제어 찾기
    - 문서 요약
    - 문서 분류
    - 감정 분석
4. 시각화
    - `Word Cloud`
    - `Sentiment Pie Chart`
### 09.02
#### 맥북 형태소 분석기 설치
1. 자바 jdk 설치
    - https://www.oracle.com/java/technologies/javase-jdk14-downloads.html (mac installer)
2. 터미널에서 `Python 3.6` 가상환경 만들기
    - 가상환경 만들기
    ```
    conda create -n py36 python=3.6
    ```
    - 가상환경 목록 확인
    ```
    conda env list
    ```
    - 가상환경 선택
    ```
    source activate py36
    ```
3. 터미널에서 `Konlpy` 설치
    ```
    pip install konlpy
    ```
4. 터미널에서 Homebrew 설치 (이미 설치가 되어있다면 생략)
    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)
    ```
5. 터미널에서 `Mecab` 언어팩 설치
    ```
    bash <(curl -s https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh)
    ```
#### `Konlpy` 라이브러리 호출, 선언, 실습
```
# 코모란
from konlpy.tag import Komoran
# 선언
komoran = Komoran()
# 토큰화 : morphs
komoran_tokens = komoran.morphs(text)
print(komoran_tokens)
```
- 3가지 주요 함수
  - `morphs()` 토큰화, `pos()` 품사부착, `noun()` 명사 추출
- 호출 가능 라이브러리
  ```
  from konlpy.tag import Komoran
  from konlpy.tag import Hannanum
  from konlpy.tag import Okt
  from konlpy.tag import Kkma
  ```
  - 각각 라이브러리마다 분석 정도에 따른 처리 속도가 다르니 필요한 것을 골라 사용해야 한다.
#### 뉴스 기사 크롤링 및 텍스트 전처리 + `MeCab` 토큰화
- `Konlpy`의 각 라이브러리에 대한 태그 정의서 : https://docs.google.com/spreadsheets/d/1OGAjUvalBuX-oZvZ_-9tEfYD2gQe7hTGsgUpiiBSXI8/edit#gid=0
#### 단어의 표현
- 단어의 표현이 필요한 이유
  - 문자열을 수치화하여 연산을 가능케 하기 위함
- 단어표현의 분류
  - Local Representation
    - 표현하고자 하는 단어만을 수치화
  - Distributed Representation
    - 주변단어를 함께 참고하여 수치화
![word_representation](https://user-images.githubusercontent.com/67505208/91978937-efdaee80-ed5f-11ea-9659-c45a0691736b.PNG)
#### OneHotEncoding 직접 구현 및 `sklearn` 라이브러리를 통해서 구현
- 표현하고자하는 단어의 갯수를 백터차원으로 출력
- 표현하고자 하는 단어의 인덱스에는 '1' 다른 인덱스에는 '0'을 부여
#### BoW 직접 구현
- 문서 내 단어의 출현 순서를 무시한 채, 출현 빈도수만으로 단어를 표현
##09.03
#### BoW `sklearn` 라이브러리와 `gensim` 라이브러리를 통해서 구현
- 차이점 : 결과 값에 대한 차이점은 없으나, 입력데이터 형태의 차이가 있다.
  - `sklearn` : 문자열 데이터 필요
  - `gensim` : 토큰화된 데이터 필요
#### DTM, TDM 직접 구현 및 `sklearn` 라이브러리와 `gensim` 라이브러리를 통해서 구현
- BoW 방법 중 하나
  - BoW는 1차원 배열의 결과 값을 출력
  - DTM과 TDM은 토큰화 된 단어와 문서로 이루어진 2차원 배열의 결과 값을 출력
- DTM : 행-문서, 열-토큰화 단어 / TDM은 : 행-토큰화된 단어 / 열-문서
#### TF_IDF 직접구현
- TF_IDF 가중치 계산하는 방법에는 여러가지 방법이 있다, 그러나 본 교육에서는 자주 사용되는 방법으로 실습을 진행하였다.
  - TF : 단어빈도 ( 특정단어 등장빈도 / 문서내 전체단어 등장빈도 ), 한 문서 내에서 얼마나 많이 등장 했는가
  - IDF : 역문서빈도 ( log(총 문서 수 / 특정 단어가 등장한 문서 수), 단어가 얼마나 많은 문서에서 등장했는지를 나타내는 DF의 역수
  - TF_IDF : TF * IDF
### 09.05
#### TF_IDF `sklearn` 라이브러리와 `gensim` 라이브러리를 통해서 구현
#### 감정분석
- 문서, 단락, 문장 내에서 긍정,부정,중립 등을 감지하는 텍스트 분석방법
- 문서 내 감정표현을 분석 - 특징을 정량화된 자료로 제시
- 감정분석 방법
  - Lexicon-based approach (사전기반 감정분석)
  - Machine Learning Approach
  - Deep Learning Approach
  
#### Machine Learning Approach 중 Naive Bayes Classifier 직접 구현 및 `sklearn` 라이브러리를 통해서 구현
##### Baye's theorem
- 두 확률변수의 사전확률과 사후확률 사이의 관계를 나타내는 정리
![캡처](https://user-images.githubusercontent.com/67505208/92302072-0cffff00-efa4-11ea-8156-810f588adb36.PNG)
![image](https://user-images.githubusercontent.com/67505208/92302131-8e579180-efa4-11ea-9e63-60d885826cd3.png)
- 확률을 구할 때, 발전된 방향으로 업데이트 시켜나가기 때문에 머신러닝 분야에 베이즈 정리를 많이 사용한다.
- `Laplace Smoothing`
  - 기존에 등장하지 않았던 새로운 단어가 입력되는 경우 새로운 입력 단어의 확률은 0이다.
  - 그러므로 다른 단어들과 조건부확률을 구하게 되면 모든 확률값이 0이 나오게 된다.
  - 이러한 경우를 방비하기 위해 모든 단어가 1번이상 등장한다고 가정한다.
  - 계산시 분자에 '1'을 더해주고, 분모에는 '모든 unique한 데이터의 수'를 더해준다.
- `Underflow`
  - 0은 아니지만 0에 매우가가운 수로 무한히 작아지는 경우
  - log를 취함으로써 'Underflow'를 예방할 수 있다.
#### Naive Bayes를 이용한 네이버 영화 댓글 감정분석 실습
- 정리 다시하기
