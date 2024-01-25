#!pip install selenium


from bs4 import BeautifulSoup as bs
from selenium import webdriver as wb
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver import ActionChains
from tqdm import tqdm as tq  # 진행상황 시각화
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import requests as req
import time
import random


driver = wb.Chrome()
DF_cloth = pd.DataFrame({})
for k in range(1, 5617):
    url = f"https://www.fashionnet.or.kr/trend/search-fashion-image/page/{k}/"
    driver.get(url)
    time.sleep(0.6)
    driver.maximize_window()
    for i in range(1, 21):
        driver.find_element(By.CSS_SELECTOR, f"#container > div > ul > li:nth-child({i})").click()  
        category = [];
        color = [];
        item = [];
        look = [];
        time.sleep(0.5)
        img_address = driver.find_element(By.CSS_SELECTOR, f"#container > div > ul > li:nth-child({i}) > a").get_attribute('style')
        atagLength = len(driver.find_elements(By.CSS_SELECTOR, "body > div.pu.pu_s.pu_f_img > div.tx > ul >li"))
        for j in range(1,(atagLength+1)):
            
            type = driver.find_element(By.CSS_SELECTOR, f"body > div.pu.pu_s.pu_f_img > div.tx > ul > li:nth-child({j}) > a").get_attribute('data-type')
            if(type =="category"):
                category.append(driver.find_element(By.CSS_SELECTOR, f"body > div.pu.pu_s.pu_f_img > div.tx > ul > li:nth-child({j}) > a").text)
            elif(type=="color"):
                color.append(driver.find_element(By.CSS_SELECTOR, f"body > div.pu.pu_s.pu_f_img > div.tx > ul > li:nth-child({j}) > a").text)
            elif(type=="item"):
                item.append(driver.find_element(By.CSS_SELECTOR, f"body > div.pu.pu_s.pu_f_img > div.tx > ul > li:nth-child({j}) > a").text)
            elif(type=="look"):
                look.append(driver.find_element(By.CSS_SELECTOR, f"body > div.pu.pu_s.pu_f_img > div.tx > ul > li:nth-child({j}) > a").text)
            else:
                pass;
        time.sleep(0.5)
        DF_clothone = pd.DataFrame({'img_address':[img_address], 'category':[category], 'color':[color], 'item':[item], 'look':[look]})
        DF_cloth = pd.concat([DF_cloth, DF_clothone], axis=0)
        driver.find_element(By.CSS_SELECTOR, "body > div.pu.pu_s.pu_f_img > a").click();
DF_cloth.to_csv(DF_cloth, encoding='utf-8')


# 데이터 공백으로 수집된 열 삭제
droplist = []
for i in range(len(DF_cloth_final)) :
    if len(DF_cloth_final.iloc[i,2]) > 2:
        pass
    else :
        droplist.append(i)

DF_cloth_final.drop(index=droplist, axis=0, inplace=True)
DF_cloth_final['index'] = range(len(DF_cloth_final))
DF_cloth_final = DF_cloth_final.set_index('index')

droplist = []
for i in range(len(DF_cloth_final)) :
    if len(DF_cloth_final.iloc[i,3]) > 2:
        pass
    else :
        droplist.append(i)

DF_cloth_final.drop(index=droplist, axis=0, inplace=True)
DF_cloth_final['index'] = range(len(DF_cloth_final))
DF_cloth_final = DF_cloth_final.set_index('index')
droplist = []
for i in range(len(DF_cloth_final)) :
    if len(DF_cloth_final.iloc[i,4]) > 2:
        pass
    else :
        droplist.append(i)

DF_cloth_final.drop(index=droplist, axis=0, inplace=True)
DF_cloth_final['index'] = range(len(DF_cloth_final))
DF_cloth_final = DF_cloth_final.set_index('index')


# 두개의 의류로 구성된 데이터 찾기
for i in tq(range(len(DF_cloth_final))):
    delete2 = len(DF_cloth_final.iloc[i,1].replace(' ','').replace('[','').replace(']','').replace('"','').replace("'","").split(','))
    if delete2 > 1:
        DF_cloth_final.iloc[i,1] = [","]


# 위에서 찾은 컬럼 날리기

droplist = []
for i in range(len(DF_cloth_final)):
    if len(DF_cloth_final.iloc[i,1]) > 4:
        pass
    else :
        droplist.append(i)
DF_cloth_final.drop(index=droplist, axis=0, inplace=True)
DF_cloth_final['index'] = range(len(DF_cloth_final))
DF_cloth_final = DF_cloth_final.set_index('index')


# 각 항목에 접근해서 공백, 기호 제거 후 해당 단어가 포함된 글자들을 리스트에 담음
delete = []
delete1 = []
for k in tq(range(len(DF_cloth_final))) :
    check = DF_cloth_final.iloc[k,1].replace(' ','').replace('[','').replace(']','').replace('"','').replace("'","").split(',')
    for i in range(len(check)) :
        delete.append([s for s in check if "드레스" in s])
    for i in range(len(delete)):
        for j in range(len(delete[i])) :
            delete1.append(delete[i][j])
            # testList.append(delete[i][j])
delete1 = set(delete1)
delete1 = list(delete1)


# 위 리스트에 담긴 단어들이 포함되어있는 열을 수정
DF_cloth_finaltag = []
for i in tq(range(len(DF_cloth_final))):
# for i in tq(range(1,10)):
    # for j in range(len(DF_cloth_final.iloc[i,1])) :
    matching = DF_cloth_final.iloc[i,1].replace(' ','').replace('[','').replace(']','').replace('"','').replace("'","").split(',')
    cody_list = []
    for k in range(len(matching)) :
        if matching[k] in delete1 : 
            DF_cloth_final.iloc[i,1] = [","]
            

# 위에서 수정된 열 찾아서 날리기
droplist = []
for i in range(len(DF_cloth_final)):
    if len(DF_cloth_final.iloc[i,1]) > 3:
        pass
    else :
        droplist.append(i)
DF_cloth_final.drop(index=droplist, axis=0, inplace=True)
DF_cloth_final['index'] = range(len(DF_cloth_final))
DF_cloth_final = DF_cloth_final.set_index('index')