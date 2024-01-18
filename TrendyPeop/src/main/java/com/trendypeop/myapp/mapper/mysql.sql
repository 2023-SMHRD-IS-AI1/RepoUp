select * from tb_user;

alter table tb_closet add column style_idx int unsigned not null;

alter table tb_closet add foreign key(style_idx) references tb_style(style_idx);

alter table tb_closet drop column upload_img;

alter table tb_closet change column uploaded_at added_at datetime default now();

select * from tb_closet;

alter table tb_user alter column user_type set default 'u';

alter table tb_cody drop column cody_color;

select * from tb_cody;

delete from tb_cody_favorite;

select * from tb_cody_favorite;