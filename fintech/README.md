# fintech
## 교육 기간
- 2020.09.14. ~

## 교육 내용
### 09.14
#### 파이썬 문법 복습

### 09.15
- 네이버 주식 사이트를 통한 '현대백화점' 데이터 크롤링 (`requests`, `BeautifulSoup` 사용)
- `SQlite3`에 연동하여 데이터 적재 / 개인적으로는 `BigQuery`도 사용
- 간단한 시각화 진행

### 09.16
- CJ ENM 주가 데이터 크롤링
- 이동평균선을 통한 모멘텀 분석
  - 이동평균선이란?
    - 기술적 분석에 있어 가장 기본적이면서 중요한 것
    - n일동안의 종가의 평균점을 이은 선
   - 단기이평선(5일), 장기이평선(30일)을 설정하여 장단기이평선을 분석
   - 마케팅 시장평가의 지점 확인 가능
- 크로스포인트
  - 골든크로스 : 단기 이평선이 장기 이평선을 아래서 위로 통과
  - 데드크로스 : 단기 이평선이 장기 이평선을 위에서 아래로 통과
  - 이를 통해 시장에 반영된 마케팅 효과를 가늠
- 캔들차트 + 이평선 분석을 통한 마케팅 포인트 확인
  - 캔들차트란?
    ![image](https://user-images.githubusercontent.com/67505208/93467231-73800800-f928-11ea-8f0d-b013295a3594.png)

    - 시가, 고가, 저가, 종가를 분석하여 마케팅 적시의 효과 확인 가능
    - 양봉, 음봉
    - 망치형, 역망치형, doji형
  - 캔들차트 시각화
    - OPEN_PRICE, CLOSE_PRICE, HIGH_PRICE, LOW_PRICE 데이터 필요
    - 설치 및 라이브러리 호출 방법
      ```python
      ! pip install mpl_finance
      from mpl_finace import candlestick_ohlc
      ```
- 경쟁사('GS 홈쇼핑') 주가 데이터 수집
  - 경쟁사 단기이평선과 CJ ENM 단기이평선과 비교

### 09.17
#### Naver Data Lab 서비스 API 구현
- [Naver Developer](https://developers.naver.com/products/datalab/) 접속 후 '오픈 API 이용 신청'
- 발급된 'client_ID'와 'client_secret'와 함께 [Python용 소스코드](https://developers.naver.com/docs/datalab/search/#python)입력
#### 주가와 Data Lab 검색량의 관계
- 동일한 기간 내의 주가와 키워드 데이터(마케팅 이벤트 등으로 선정)를 비교
- 주가 변동과 키워드 검색량의 변화를 보며 과거의 효과적인 마케팅 요소를 분석
