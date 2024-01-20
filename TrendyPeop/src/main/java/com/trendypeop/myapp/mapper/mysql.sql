select * from tb_user;

alter table tb_closet add column style_idx int unsigned not null;

alter table tb_closet add foreign key(style_idx) references tb_style(style_idx);

alter table tb_closet drop column upload_img;

alter table tb_closet change column uploaded_at added_at datetime default now();

select * from tb_closet;

alter table tb_user alter column user_type set default 'u';

alter table tb_cody drop column cody_color;

select count(*) from tb_style;

select * from tb_style_favorite;

delete from tb_style_favorite;

select * from tb_cody;

select count(*) from tb_cody;


select count(*) from tb_item;

select * from tb_cody where cody_idx=1002;

select * from tb_style where style_idx=363 ;

select * from tb_cody_favorite;

delete from tb_cody_favorite where cody_idx=10 ;

delete from tb_item where cody_idx=676 ;

delete from tb_cody where cody_idx=10 ;

-- delete from tb_item where style_idx=676;

select * from tb_cody inner join tb_cody_favorite on tb_cody.cody_idx = tb_cody_favorite.cody_idx;

ALTER TABLE tb_item DROP FOREIGN KEY cody_idx;

ALTER TABLE tb_item ADD CONSTRAINT FOREIGN KEY (cody_idx) REFERENCES tb_cody(cody_idx) ON DELETE CASCADE;

ALTER TABLE tb_cody_favorite ADD CONSTRAINT FOREIGN KEY (cody_idx) REFERENCES tb_cody(cody_idx) ON DELETE CASCADE;

show full processlist;


kill 208964;

select * 
		from tb_style inner join tb_closet 
		on tb_style.style_idx = tb_closet.style_idx 
		where tb_closet.user_id = 1;

