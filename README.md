# テーブル設計   

## usersテーブル  

| Column || Type   || Options |  
| --- || --- || --- |  
| email || string || NOT NULL, ユニーク制約 |  
| encrypted_password  || string ||NOT NULL |  
| name || string || NOT NULL |  
| profile || text || NOT NULL |  
| occupation | text || NOT NULL |  
| position || text || NOT NULL |  

### Association  
- has_many :users_comments  
- has_many :users_prototypes  

## commentsテーブル  

| Column || Type || Options ||  
|--- || --- || --- |  
| content || text || NOT NULL |  
| prototype ||references || NOT NULL, 外部キー |  
| user ||references | NOT NULL, 外部キー |  

### Association  
- belongs_to :users  
- belongs_to :prototype  

## prototypesテーブル  
| Column || Type || Options |  
| --- | --- | --- |  
| title || string || NOT NULL |  
| catch_copy || text || NOT NULL ||  
| user || references || NOT NULL, 外部キー |  

### Association  
- has_many :prototypes_comments  
- belongs_to :users  
