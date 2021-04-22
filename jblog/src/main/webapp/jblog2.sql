--제약조건째로 테이블 날리는 법
drop table blog CASCADE constraints;
----------------------------------------------------------------------------
CREATE TABLE users (
    userNo    NUMBER(5) primary key,
    id        VARCHAR2(50) not null unique,
    userName  VARCHAR2(100) not null,
    password  VARCHAR2(50) not null ,
    joinDate  DATE not null 
);

comment on table users is '회원정보';
comment on column users.userNo is '회원식별번호';
comment on column users.id is '아이디';
comment on column users.userName is '회원이름';
comment on column users.password is '패스워드';
comment on column users.joinDate is '가입일';
----------------------------------------------------------------------------
CREATE TABLE blog (
    id         VARCHAR2(50) primary key,
    blogTitle  VARCHAR2(200) not null,
    logoFile   VARCHAR2(200),
    constraint id_fk foreign key (id)
    references users(id)
);

comment on table blog is '블로그';
comment on column blog.id is '식별번호';
comment on column blog.blogTitle is '블로그제목';
comment on column blog.logoFile is '블로그이미지경로';
----------------------------------------------------------------------------
CREATE TABLE category (
    cateNo    NUMBER primary key,
    id        VARCHAR2(50),
    cateName  VARCHAR2(200) not null,
    description  VARCHAR2(500),
    regDate  DATE not null,
    constraint c_id_fk foreign key (id)
    references blog(id)
);

comment on table category is '카테고리';
comment on column category.cateNo is '식별번호';
comment on column category.id is '회원번호';
comment on column category.cateName is '카테고리명';
comment on column category.description is '카테고리설명';
comment on column category.regDate is '등록일';
----------------------------------------------------------------------------
CREATE TABLE post (
    postNo       NUMBER primary key,
    cateNo       NUMBER,
    postTitle    VARCHAR2(300) not null,
    postContent  VARCHAR2(4000),
    regDate      DATE not null,
    constraint cateNo_fk foreign key (cateNo)
    references category(cateNo)
);

comment on table post is '글';
comment on column post.postNo is '식별번호';
comment on column post.cateNo is '카테고리번호';
comment on column post.postTitle is '글 제목';
comment on column post.postContent is '글 내용';
comment on column post.regDate is '글 작성일';
----------------------------------------------------------------------------
CREATE TABLE comments (
    cmtNo        NUMBER primary key,
    postNo       NUMBER,
    userNo       NUMBER,
    cmtContent   VARCHAR2(1000) not null,
    regDate      DATE not null,
    constraint postNo_fk foreign key (postNo)
    references post(postNo),
    constraint userNo_fk foreign key (userNo)
    references users(userNo)
);

comment on table comments is '댓글';
comment on column comments.cmtNo is '식별번호';
comment on column comments.postNo is '글번호';
comment on column comments.userNo is '회원번호';
comment on column comments.cmtContent is '댓글내용';
comment on column comments.regDate is '등록일';
----------------------------------------------------------------------------
CREATE SEQUENCE seq_users_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_category_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_post_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

CREATE SEQUENCE seq_comments_no
INCREMENT BY 1
START WITH 1
NOCACHE ;
