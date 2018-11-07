# server

temple table

# user

- uid int auto_increment int

- phone varchar(30)
- nick_name varchar(100);
- Mail var(100);



# vip

- uid
- start_time default time (datestamp)
- Deleted tinyint (1) default 0
- End_time





# artical

- Aid atto increment
- Content 文章或相对地址 varchar(1000)
- title 倒排索引 varchar(200)
- deleted tinyint (1) default 0
- top tinyint (1) default 0
- cover varchar(1000)



# comment

- cid int auto_increment
- parent_cid
- aid
- uid
- Parent_uid
- content varchar(500)
- Top
- Create_time
- deleted

# star

- Sid int auto
- uid
- aid
- Deleted



# donate

- did
- uid
- amount  double
- Create_time default current_timestamp