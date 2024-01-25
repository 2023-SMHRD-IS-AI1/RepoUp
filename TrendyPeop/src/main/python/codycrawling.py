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
import os   # 폴더, 파일생성 라이브러리
import pickle # 리스트 저장, 불러오기 위함


# 품목별 태그 가져옴
DF_cody = pd.DataFrame({})
driver = wb.Chrome()
driver.get("https://www.musinsa.com/app/codimap/lists?style_type=&tag_no=&brand=&display_cnt=60&list_kind=big&sort=date&page=1")
driver.find_element(By.CSS_SELECTOR, "#footerCommonPc > div.sc-pvystx-0.iRAZYo > button:nth-child(3)").click()  
driver.maximize_window()

for k in range(1, 203):
    url = f"https://www.musinsa.com/app/codimap/lists?style_type=&tag_no=&brand=&display_cnt=60&list_kind=big&sort=date&page={k}"
    driver.get(url)
    time.sleep(0.6)
    cody_img = []
    for i in range(1, 61):
        time.sleep(0.3)
        cody_name = (driver.find_element(By.CSS_SELECTOR, f"body > div.wrap > div.right_area > form > div.right_contents.hover_box > div > ul > li:nth-child({i}) > div.style-list-information > a").get_attribute('title'))
        cody_img.append(driver.find_element(By.CSS_SELECTOR, f"body > div.wrap > div.right_area > form > div.right_contents.hover_box > div > ul > li:nth-child({i}) > div.style-list-item__thumbnail > a > div > img").get_attribute('src'))
        driver.find_element(By.CSS_SELECTOR, f"body > div.wrap > div.right_area > form > div.right_contents.hover_box > div > ul > li:nth-child({i}) > div.style-list-item__thumbnail > a").click()  
        cody_tag = [];  
        item_img = [];
        item_name = [];
        item_address = [];
        try:
            itemLength = len(driver.find_elements(By.CSS_SELECTOR, "#style_info > div.styling_goods.codimap-goods > div > div > div > div.styling_list.swiper-wrapper > div"))
            for x in range(1,(itemLength+1)):
                item_img.append(driver.find_element(By.CSS_SELECTOR, f"#style_info > div.styling_goods.codimap-goods > div > div > div > div.styling_list.swiper-wrapper > div:nth-child({x}) > div.box-img > a > img").get_attribute('src'))
                item_name.append(driver.find_element(By.CSS_SELECTOR, f"#style_info > div.styling_goods.codimap-goods > div > div > div > div.styling_list.swiper-wrapper > div:nth-child({x}) > a.brand_item").text)
                item_address.append(driver.find_element(By.CSS_SELECTOR, f"#style_info > div.styling_goods.codimap-goods > div > div > div > div.styling_list.swiper-wrapper > div:nth-child({x}) > div.box-img > a").get_attribute('href'))
        except:
            itemLength = len(driver.find_elements(By.CSS_SELECTOR, "#style_info > div.styling_goods.codimap-goods > div > div:nth-child(3) > div > div.styling_list.swiper-wrapper > div"))
            for x in range(1,(itemLength+1)):
                item_img.append(driver.find_element(By.CSS_SELECTOR, f"#style_info > div.styling_goods.codimap-goods > div > div:nth-child(3) > div > div.styling_list.swiper-wrapper > div:nth-child({x}) > div.box-img > a > img").get_attribute('src'))
                item_name.append(driver.find_element(By.CSS_SELECTOR, f"#style_info > div.styling_goods.codimap-goods > div > div:nth-child(3) > div > div.styling_list.swiper-wrapper > div:nth-child({x}) > a.brand_item").text)
                item_address.append(driver.find_element(By.CSS_SELECTOR, f"#style_info > div.styling_goods.codimap-goods > div > div:nth-child(3) > div > div.styling_list.swiper-wrapper > div:nth-child({x}) > div.box-img > a").get_attribute('href'))
        time.sleep(0.2)
        atagLength = len(driver.find_elements(By.CSS_SELECTOR, "#style_info > div.styling_tag > div > a"))
        for j in range(1,(atagLength+1)):
            cody_tag.append(driver.find_element(By.CSS_SELECTOR, f"#style_info > div.styling_tag > div > a:nth-child({j})").get_attribute('data-tagname'))
        time.sleep(0.4)
        DF_codyone = pd.DataFrame({'cody_name':[cody_name], 'cody_tag':[cody_tag], 'cody_img':[cody_img], 'item_name':[item_name], 'item_img':[item_img], 'item_address':[item_address]})
        DF_cody = pd.concat([DF_cody, DF_codyone], axis=0)
        driver.back()
DF_cody['index'] = range(len(DF_cody))
DF_cody = DF_cody.set_index('index')


# 제대로 수집되지 않은 항목 제거
droplist = []
for i in range(len(DF_cody)):
    if len(DF_cody.iloc[i,1]) > 2:
        pass
    else :
        droplist.append(i)
DF_cody.drop(index=droplist, axis=0, inplace=True)
DF_cody['index'] = range(len(DF_cody))
DF_cody = DF_cody.set_index('index')
for i in range(len(DF_cody)) :
    DF_cody.iloc[i,1] = DF_cody.iloc[i,1].replace(' ','').replace('[','').replace(']','').replace('"','').replace("'","")
    DF_cody.iloc[i,1] = DF_cody.iloc[i,1].split(',')
DF_cody.to_csv('DF_cody', encoding='utf-8')


# 각 행에 접근하여 특정 단어만 추출
df_codytag = []
for i in tq(range(len(DF_cody))):
    for j in range(len(DF_cody.iloc[i,1])) :
        matching = DF_cody.iloc[i,1].replace(' ','').replace('[','').replace(']','').replace('"','').replace("'","").split(',')
        cody_list = []
        for k in range(len(matching)) :
            if matching[k] in usable_tag :
                cody_list.append(matching[k])
        cody_list = ','.join(cody_list)
    df_codytag.append((cody_list))
df_codytag = pd.DataFrame(df_codytag, columns=["tagList1"])


# 특정 단어가 포함여부 확인 및 제거
matching = []
deleteList2 = []
filtered_tag = []

for i in range(len(deleteList)) :
    deleteitem = deleteList[i]
    matching.append([s for s in cody_tag if deleteitem in s])
for i in range(len(matching)):
    for j in range(len(matching[i])) :
        deleteList2.append(matching[i][j])
for i in range(len(cody_tag)) :
    if cody_tag[i] in deleteList2:
        pass
    else :
        filtered_tag.append(cody_tag[i])
filtered_tag1 = pd.DataFrame(filtered_tag)


# 사용가능한 단어들에 접근하여 각각 컬럼으로 분류작업 실시
look2 = []
for i in tq(range(len(DF_cody))):
    for j in range(len(DF_cody.iloc[i,1])) :
        matching = DF_cody.iloc[i,1].replace(' ','').replace('[','').replace(']','').replace('"','').replace("'","").split(',')
        look1_list = []
        count = 0
        for k in range(len(matching)) :
            if matching[k] in look1 :
                if count == 1 :
                    pass
                else :
                    count = 1
                    look1_list.append(matching[k])
    look2.append((look1_list))
look = pd.DataFrame(look2, columns=["look"])


# 분류된 컬럼 기존 DataFrame에 접합.
DF_cody = pd.concat([DF_cody, look], axis=1)


# 기존 미분류된 태그모음 제거 및 컬럼 재정렬
DF_cody = DF_cody.drop('cody_tag', axis=1)
DF_cody = DF_cody[['cody_name','season','feeling','style','look','cody_img','item_name','item_img','item_address']]
