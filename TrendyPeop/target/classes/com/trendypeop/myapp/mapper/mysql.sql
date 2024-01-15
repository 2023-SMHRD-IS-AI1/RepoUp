select * from tb_user;

alter table tb_closet add column style_idx int unsigned not null;

alter table tb_closet add foreign key(style_idx) references tb_style(style_idx);

alter table tb_closet drop column upload_img;

alter table tb_closet change column uploaded_at added_at datetime default now();

select * from tb_closet;