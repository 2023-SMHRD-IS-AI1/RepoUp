!pip install pymysql

from bs4 import BeautifulSoup as bs
from selenium import webdriver as wb 
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver import ActionChains
from tqdm import tqdm as tq  # 진행상황 시각화
import numpy as np
import pandas as pd # 판다스 사용
from pandas import Series, DataFrame
import requests as req
import time # 시간 지연
import os   # 폴더, 파일생성 라이브러리
import pickle # 리스트 저장, 불러오기 위함
import pymysql # mysql 파이썬 연동

conn = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_3', password='smhrd3', db='campus_23IS_LI1_hack_3', charset='utf8', port=3307)
cur = conn.cursor()

sql = 'select style_img_url from tb_style'
cur.execute(sql)
result = cur.fetchall()
print(len(result))

conn.commit()
conn.close()

# df_google = pd.DataFrame({})
driver = wb.Chrome()

for i in tq(range(0, 812)):
    driver.get("https://www.google.com/webhp?hl=ko&sa=X&ved=0ahUKEwiqmqHhn9KDAxV_cfUHHf9wDz8QPAgJ")

    
    try :
        btn = driver.find_element(By.CSS_SELECTOR, "body > div.L3eUgb > div.o3j99.ikrT4e.om7nvf > form > div:nth-child(1) > div.A8SBwf > div.RNNXgb > div > div.dRYYxd > div.nDcEnd > svg > g > path:nth-child(5)")
        btn.click()

        search = driver.find_element(By.CSS_SELECTOR, "#ow9 > div.M8H8pb > c-wiz > div.ea0Lbe > div > div.gIYJUc > div.f6GA0 > c-wiz > div.PXT6cd > input")
        time.sleep(1)
        # search.send_keys("https://m.le-mons.com/web/product/big/202208/1923a807708d9ac4d5bde1a7ba09fb23.jpg")
        search.send_keys(result[i])
        img_url = result[i]
        search.send_keys(Keys.ENTER)
        current_url = driver.current_url
        
    except :
        current_url = "none"
        img_url = "none"
    
    df_google = pd.DataFrame({'img_url':[img_url], 'current_url':[current_url]})
    
    time.sleep(0.5)

df_google.to_csv('im', encoding='utf-8')