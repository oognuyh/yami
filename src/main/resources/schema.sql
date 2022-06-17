CREATE TABLE Book
(
  book_id       VARCHAR2(40) NOT NULL,
  restaurant_id VARCHAR2(40) NOT NULL,
  member_id     VARCHAR2(40) NOT NULL,
  status        VARCHAR2(10) NOT NULL,
  deposit       NUMBER      ,
  head_count    NUMBER      ,
  visiting_date DATE        ,
  created_at    DATE         DEFAULT SYSDATE,
  updated_at    DATE         DEFAULT SYSDATE,
  canceled_at   DATE        ,
  completed_at  DATE        ,
  CONSTRAINT PK_Book PRIMARY KEY (book_id)
);

CREATE TABLE Bookmark
(
  bookmark_id   VARCHAR2(40) NOT NULL,
  restaurant_id VARCHAR2(40) NOT NULL,
  member_id     VARCHAR2(40) NOT NULL,
  created_at    DATE         DEFAULT SYSDATE,
  updated_at    DATE         DEFAULT SYSDATE,
  CONSTRAINT PK_Bookmark PRIMARY KEY (bookmark_id)
);

CREATE TABLE Category
(
  category_id VARCHAR2(40)      NOT NULL,
  name        VARCHAR2(20 CHAR) NOT NULL,
  created_at  DATE              DEFAULT SYSDATE,
  updated_at  DATE              DEFAULT SYSDATE,
  CONSTRAINT PK_Category PRIMARY KEY (category_id)
);

CREATE TABLE Food
(
  food_id       NUMBER             NOT NULL,
  restaurant_id VARCHAR2(40)       NOT NULL,
  name          VARCHAR2(50 CHAR)  NOT NULL,
  price         NUMBER            ,
  description   VARCHAR2(300 CHAR),
  created_at    DATE               DEFAULT SYSDATE,
  updated_at    DATE               DEFAULT SYSDATE,
  CONSTRAINT PK_Food PRIMARY KEY (food_id)
);

CREATE TABLE Image
(
  image_id   VARCHAR2(40) NOT NULL,
  target_id  VARCHAR2(40),
  path       VARCHAR2    ,
  created_at DATE         DEFAULT SYSDATE,
  updated_at DATE         DEFAULT SYSDATE,
  CONSTRAINT PK_Image PRIMARY KEY (image_id)
);

CREATE TABLE Member
(
  member_id     VARCHAR2(40)      NOT NULL,
  nickname      VARCHAR2(30 CHAR) NOT NULL,
  email         VARCHAR2(30)      NOT NULL,
  password      VARCHAR2(150)     NOT NULL,
  phone_number  VARCHAR2(12)      NOT NULL,
  role          VARCHAR2(10)      NOT NULL,
  created_at    DATE              DEFAULT SYSDATE,
  updated_at    DATE              DEFAULT SYSDATE,
  CONSTRAINT PK_Member PRIMARY KEY (member_id)
);

CREATE TABLE Payment
(
  payment_id  VARCHAR2(40) NOT NULL,
  book_id     VARCHAR2(40) NOT NULL,
  total_price NUMBER       NOT NULL,
  is_canceled CHAR(1)      DEFAULT '0',
  created_at  DATE         DEFAULT SYSDATE,
  updated_at  DATE         DEFAULT SYSDATE,
  canceled_at DATE        ,
  CONSTRAINT PK_Payment PRIMARY KEY (payment_id)
);

CREATE TABLE Restaurant
(
  restaurant_id VARCHAR2(40)       NOT NULL,
  member_id     VARCHAR2(40)       NOT NULL,
  category_id   VARCHAR2(40)       NOT NULL,
  name          VARCHAR2(30 CHAR)  NOT NULL,
  zip_code      VARCHAR2(10)       NOT NULL,
  address1      VARCHAR2(200 CHAR) NOT NULL,
  address2      VARCHAR2(200 CHAR),
  phone_number  VARCHAR2(12)       NOT NULL,
  latitude      NUMBER             NOT NULL,
  longitude     NUMBER             NOT NULL,
  intro         VARCHAR2(300 CHAR),
  created_at    DATE               DEFAULT SYSDATE,
  updated_at    DATE               DEFAULT SYSDATE,
  CONSTRAINT PK_Restaurant PRIMARY KEY (restaurant_id)
);

CREATE TABLE Review
(
  review_id     VARCHAR2(40)       NOT NULL,
  content       VARCHAR2(300 CHAR),
  rating        NUMBER            ,
  created_at    DATE               DEFAULT SYSDATE,
  updated_at    DATE               DEFAULT SYSDATE,
  member_id     VARCHAR2(40)       NOT NULL,
  restaurant_id VARCHAR2(40)       NOT NULL,
  CONSTRAINT PK_Review PRIMARY KEY (review_id)
);