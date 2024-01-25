#!pip install pymysql

from tqdm import tqdm as tq  # 진행상황 시각화
import numpy as np
import pandas as pd # 판다스 사용
from pandas import Series, DataFrame
import requests as req
import time # 시간 지연
import os   # 폴더, 파일생성 라이브러리
import pickle # 리스트 저장, 불러오기 위함
import pymysql # mysql 파이썬 연동


# 네이버 검색량 순위 크롤링
driver = wb.Chrome()
driver.get("https://datalab.naver.com/shoppingInsight/sCategory.naver")
driver.maximize_window()

DF_search = pd.DataFrame({})    
driver.find_element(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(5) > div > div > span:nth-child(3) > label").click() 
time.sleep(0.2)
driver.find_element(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(5) > div > div > span:nth-child(4) > label").click() 
time.sleep(1)
driver.find_element(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(2) > div.set_period_target > span:nth-child(1) > div.select.w2 > span").click() 
time.sleep(0.2)
driver.find_element(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(2) > div.set_period_target > span:nth-child(1) > div.select.w2 > ul > li:nth-child(8) > a").click() 
time.sleep(0.2)
driver.find_element(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(2) > div.set_period_target > span:nth-child(1) > div:nth-child(3) > span").click() 
time.sleep(0.2)
data_len = len(driver.find_elements(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(2) > div.set_period_target > span:nth-child(1) > div:nth-child(3) > ul > li"))

for i in range(data_len,data_len+1) :
    time.sleep(0.5)
    driver.find_element(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(2) > div.set_period_target > span:nth-child(1) > div:nth-child(3) > span").click() 
    driver.find_element(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(2) > div.set_period_target > span:nth-child(1) > div:nth-child(3) > span").click() 
    time.sleep(0.5)
    driver.find_element(By.CSS_SELECTOR, f"#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(2) > div.set_period_target > span:nth-child(1) > div:nth-child(3) > ul > li:nth-child({i})").click() 
    time.sleep(0.5)
    driver.find_element(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(2) > div.set_period_target > span:nth-child(3) > div:nth-child(3) > span").click() 
    time.sleep(0.5)
    driver.find_element(By.CSS_SELECTOR, f"#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > div > div:nth-child(2) > div.set_period_target > span:nth-child(3) > div:nth-child(3) > ul > li:nth-child(1)").click() 
    time.sleep(0.5)
    driver.find_element(By.CSS_SELECTOR, "#content > div.section_instie_area.space_top > div > div.section.insite_inquiry > div > a > span").click() 
    time.sleep(1)
    search_list = []
    for j in range(1,11) :
        search = driver.find_element(By.CSS_SELECTOR, f"#content > div.section_instie_area.space_top > div > div:nth-child(2) > div.section_insite_sub > div > div > div.rank_top1000_scroll > ul > li:nth-child({j}) > a").text
        search_list.append(search)
    for k in range(0,10):
        search_list[k] = search_list[k].split("\n")[1]
    DF_searchone = pd.DataFrame(search_list, columns=[f"2024-01-{i}"])
    DF_search = pd.concat([DF_search, DF_searchone], axis=1)



# 네이버 데이터랩의 검색 순위 분석을 위한 데이터 DB입력
conn = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_3', password='smhrd3', db='campus_23IS_LI1_hack_3', charset='utf8', port=3307)
cur = conn.cursor()
for i in range(len(DF_search.columns)) :
    collected_at = DF_search.columns[i]
    top1 = DF_search.iloc[0,i]
    top2 = DF_search.iloc[1,i]
    top3 = DF_search.iloc[2,i]
    top4 = DF_search.iloc[3,i]
    top5 = DF_search.iloc[4,i]
    top6 = DF_search.iloc[5,i]
    top7 = DF_search.iloc[6,i]
    top8 = DF_search.iloc[7,i]
    top9 = DF_search.iloc[8,i]
    top10 = DF_search.iloc[9,i]
    sql = f'insert into datalab(collected_at, top1, top2, top3, top4, top5, top6, top7, top8, top9, top10) values("{collected_at}", "{top1}", "{top2}", "{top3}", "{top4}", "{top5}", "{top6}", "{top7}", "{top8}", "{top9}", "{top10}")'
    cur.execute(sql)
conn.commit()
conn.close()

# 의류 데이터 DB 입력
conn = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_3', password='smhrd3', db='campus_23IS_LI1_hack_3', charset='utf8', port=3307)
cur = conn.cursor()
for i in tq(range(len(DF_cloth))) :
    img_address = DF_cloth.iloc[i,0]
    category = DF_cloth.iloc[i,1]
    color = DF_cloth.iloc[i,2]
    item = DF_cloth.iloc[i,3]
    look = DF_cloth.iloc[i,4]
    sql = f'insert into tb_style(style_cate, style_item, style_img_url, style_color, style_tag) values("{category}", "{item}", "{img_address}", "{color}", "{look}")'
    cur.execute(sql)
conn.commit()
conn.close()


# DB에 입력된 값 가져와서 이미지에 맞는 구글렌즈 주소값 크롤링
conn = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_3', password='smhrd3', db='campus_23IS_LI1_hack_3', charset='utf8', port=3307)
cur = conn.cursor()
sql = 'select style_img_url from tb_style'
cur.execute(sql)
result = cur.fetchall()
conn.commit()
conn.close()

df_google = pd.DataFrame({})
driver = wb.Chrome()
for i in range(len(result)):
    driver.get("https://www.google.com/webhp?hl=ko&sa=X&ved=0ahUKEwiqmqHhn9KDAxV_cfUHHf9wDz8QPAgJ")
    try :
        btn = driver.find_element(By.CSS_SELECTOR, "body > div.L3eUgb > div.o3j99.ikrT4e.om7nvf > form > div:nth-child(1) > div.A8SBwf > div.RNNXgb > div > div.dRYYxd > div.nDcEnd > svg > g > path:nth-child(5)")
        btn.click()
        search = driver.find_element(By.CSS_SELECTOR, "#ow9 > div.M8H8pb > c-wiz > div.ea0Lbe > div > div.gIYJUc > div.f6GA0 > c-wiz > div.PXT6cd > input")
        time.sleep(0.5)
        search.send_keys(result[i])
        img_url = result[i]
        search.send_keys(Keys.ENTER)
        current_url = driver.current_url
    except :
        img_url = "none"
        current_url = "none"
    df_googleone = pd.DataFrame({'img_url':[img_url], 'current_url':[current_url]})
    df_google = pd.concat([df_google, df_googleone], axis=0)


# 코디 데이터 DB 입력
conn = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_3', password='smhrd3', db='campus_23IS_LI1_hack_3', charset='utf8', port=3307)
cur = conn.cursor()
for i in tq(range(len(DF_cody))) :
    cody_idx = DF_cody.index[i]
    cody_name = DF_cody.iloc[i,0]
    season = DF_cody.iloc[i,1]
    style = DF_cody.iloc[i,3]
    look = DF_cody.iloc[i,4]
    cody_img = DF_cody.iloc[i,5]
    sql = f'insert into tb_cody(cody_name, cody_img_url, cody_season, cody_style_tag, cody_look) values("{cody_name}", "{cody_img}", "{season}", "{style}", "{look}")'
    cur.execute(sql)
conn.commit()
conn.close()    


# 코디 아이템 DB 입력
conn = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_3', password='smhrd3', db='campus_23IS_LI1_hack_3', charset='utf8', port=3307)
cur = conn.cursor()
for i in tq(range(len(df_item))) :
    cody_idx = df_item.index[i]
    for j in tq(range(len(df_item.iloc[i,2].replace(' ','').replace('[','').replace(']','').replace('"','').replace("'","").replace("(","").replace(")","").split(',')))) :
        item_name = df_item.iloc[i,0].replace('[','').replace(']','').replace('"','').replace("'","").replace("(","").replace(")","").split(',')[j]
        item_img_url = df_item.iloc[i,1].replace('[','').replace(']','').replace('"','').replace("'","").replace("(","").replace(")","").split(',')[j]
        item_url = df_item.iloc[i,2].replace(' ','').replace('[','').replace(']','').replace('"','').replace("'","").replace("(","").replace(")","").split(',')[j]
        sql = f'insert into tb_item(item_name, item_img_url, item_url, cody_idx) values("{item_name}", "{item_img_url}", "{item_url}", "{cody_idx}")'
        cur.execute(sql)
conn.commit()
conn.close()


# 머신러닝 결과값 DB에 추가
conn = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_3', password='smhrd3', db='campus_23IS_LI1_hack_3', charset='utf8', port=3307)
cur = conn.cursor()
for i in tq(range(len(top4_sim.columns))) :
    style_idx = test[i]
    top01 = top4_sim.iloc[0,i]
    top02 = top4_sim.iloc[1,i]
    top03 = top4_sim.iloc[2,i]
    top04 = top4_sim.iloc[3,i]
    sql = f'update tb_style set top1 = {top01}, top2 = {top02}, top3 = {top03}, top4 = {top04} where style_idx = {style_idx}'
    cur.execute(sql)
conn.commit()
conn.close()


# 기사 데이터 DB에 입력
conn = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_3', password='smhrd3', db='campus_23IS_LI1_hack_3', charset='utf8', port=3307)
cur = conn.cursor()
for i in tq(range(len(article))) :
    article_name = article.iloc[i,0]
    article_url = article.iloc[i,1]
    sql = f'insert into tb_news(news_title, news_url) values("{article_name}", "{article_url}")'
    cur.execute(sql)
conn.commit()
conn.close()




