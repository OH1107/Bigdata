# 1. 아시아경제 청년취업아카데미 산업융합 빅데이터 전문가 과정
## 과정 소개
- 기간 :  2020.07.27 ~ 2020.10.26
![image](https://user-images.githubusercontent.com/67505208/93056365-48d34c80-f6a7-11ea-9b44-75af3ee03a6a.png)

## 교육 내용
- `Python`
  + 기간 : 2020.07.27 ~ 2020.08.10
  + `jupyter notebook` 사용
  + `Python` 기초 문법 학습
  + 데이터 분석을 위한 다양한 라이브러리 활용 (`pandas`, `numpy`, `matplotlib`, `seaborn` 등)
  + 데이터 수집을 위한 다양한 라이브러리 활용 (`BeautifulSoup`, `Selenium`, `requests`, API 수집 등)
  + `titanic`, `tips`, `iris` 등의 dataset을 활용하여 데이터 전처리, 시각화 실습  
    
    
- SQL
  - 기간 : 2020.08.11 ~ 2020.08.14
  - `MySQL Workbench` 사용
  - Dataset `Employees`을 활용하여 Data Handling 실습
  - select 등 다양한 명령문 학습
  ```sql
  -- 가장 많이 받는 급여
  select max(salary) from salaries where to_date>curdate();
  -- 급여를 많이 받는 사원의 번호
  select emp_no from salaries where salary=(select max(salary) from salaries) and to_date>curdate();
  ```
  - `ERD`를 활용하여 테이블간 시각화 실습  
    
    
- Machine Learning & Deep Learning
  - 기간 : 2020.08.18 ~ 2020.08.28
  - `Google colab`, `BigQuery`, `github` 사용
  - ML의 기본적인 개념 학습
  - ML을 학습을 위해 `sklearn`의 다양한 내장 함수 활용
  - `Decision tree`, `Entropy Impurtiy`를 시각화를 통해 이해 및 실습
  - 로지스틱 회귀모형을 통해 수행되는 머신러닝 이해 및 실습
  - 선형회귀분석 기법으로 ML학습, K-fold를 활용해 RMSE, MSE 값의 변동 확인 및 실습
  - `K_fold`를 활용한 `RMSE`, `MSE` 값 조정 실습
  - `LightGBM`으로 ML 학습과정 실습  
  
    
- NLP 자연어 처리
  - 기간 : 2020.08.29 ~ 2020.09.11
  - `jupyter notebook` 사용
  - 형태소 분석기 설치를 통한 토큰화 실습
  - 단어표현실습 (BoW, TDM, TF_IDF)
  - ML 학습을 통해 감정분석 미니 프로젝트(Navie Bayes)
  - DL 학습을 통해 감정분석 미니 프로젝트(tensorflow-RNN)
  - 토픽모델링(LDA, LSA)을 이용한 미니 프로젝트
