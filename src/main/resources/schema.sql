CREATE TABLE cartitems
(
  cart_item_id VARCHAR2(40) NOT NULL,
  user_id      VARCHAR2(40) NOT NULL,
  product_id   VARCHAR2(40) NOT NULL,
  quantity     NUMBER      ,
  created_at   DATE         DEFAULT SYSDATE,
  updated_at   DATE         DEFAULT SYSDATE,
  CONSTRAINT PK_cartitems PRIMARY KEY (cart_item_id)
);

CREATE TABLE categories
(
  category_id VARCHAR2(40)      NOT NULL,
  name        VARCHAR2(20 CHAR) NOT NULL,
  created_at  DATE              DEFAULT SYSDATE,
  updated_at  DATE              DEFAULT SYSDATE,
  CONSTRAINT PK_categories PRIMARY KEY (category_id)
);

CREATE TABLE images
(
  image_id   VARCHAR2(40)  NOT NULL,
  target_id  VARCHAR2(40) ,
  path       VARCHAR2(300) NOT NULL,
  created_at DATE          DEFAULT SYSDATE,
  updated_at DATE          DEFAULT SYSDATE,
  CONSTRAINT PK_images PRIMARY KEY (image_id)
);

CREATE TABLE users
(
  user_id  VARCHAR2(40)       NOT NULL,
  name       VARCHAR2(20 CHAR)  NOT NULL,
  nickname   VARCHAR2(20 CHAR)  NOT NULL,
  email      VARCHAR2(200)      NOT NULL,
  password   VARCHAR2(200)      NOT NULL,
  postcode   VARCHAR2(20)      ,
  address1   VARCHAR2(200 CHAR),
  address2   VARCHAR2(200 CHAR),
  role       VARCHAR2(10)       DEFAULT 'ROLE_USER' NOT NULL,
  created_at DATE               DEFAULT SYSDATE,
  updated_at DATE               DEFAULT SYSDATE,
  CONSTRAINT PK_users PRIMARY KEY (user_id)
);

ALTER TABLE users
  ADD CONSTRAINT UQ_nickname UNIQUE (nickname);

ALTER TABLE users
  ADD CONSTRAINT UQ_email UNIQUE (email);

CREATE TABLE orders
(
  order_id           VARCHAR2(40)       NOT NULL,
  user_id            VARCHAR2(40)       NOT NULL,
  name               VARCHAR2(100 CHAR),
  total_price        NUMBER            ,
  updated_at         DATE               DEFAULT SYSDATE,
  recipient_email    VARCHAR2(200)     ,
  recipient_name     VARCHAR2(20 CHAR) ,
  recipient_tel      VARCHAR2(20)      ,
  recipient_postcode VARCHAR2(20)      ,
  recipient_address1 VARCHAR2(200 CHAR),
  recipient_address2 VARCHAR2(200 CHAR),
  created_at         DATE               DEFAULT SYSDATE,
  CONSTRAINT PK_orders PRIMARY KEY (order_id)
);

CREATE TABLE orderitems
(
  order_item_id VARCHAR2(40) NOT NULL,
  user_id     VARCHAR2(40) NOT NULL,
  order_id      VARCHAR2(40) NOT NULL,
  product_id    VARCHAR2(40) NOT NULL,
  quantity      NUMBER       NOT NULL,
  created_at    DATE         DEFAULT SYSDATE,
  updated_at    DATE         DEFAULT SYSDATE,
  CONSTRAINT PK_orderitems PRIMARY KEY (order_item_id)
);

CREATE TABLE payments
(
  payment_id     VARCHAR2(40)       NOT NULL,
  order_id       VARCHAR2(40)       NOT NULL,
  imp_uid        VARCHAR2(100)     ,
  pay_method     VARCHAR2(50)      ,
  buyer_email    VARCHAR2(200)     ,
  buyer_name     VARCHAR2(20 CHAR) ,
  buyer_tel      VARCHAR2(20)      ,
  buyer_postcode VARCHAR2(20)      ,
  buyer_address1 VARCHAR2(200 CHAR),
  buyer_address2 VARCHAR2(200 CHAR),
  total_price    NUMBER            ,
  created_at     DATE               DEFAULT SYSDATE,
  updated_at     DATE               DEFAULT SYSDATE,
  CONSTRAINT PK_payments PRIMARY KEY (payment_id)
);

CREATE TABLE products
(
  product_id  VARCHAR2(40)       NOT NULL,
  category_id VARCHAR2(40)       NOT NULL,
  name        VARCHAR2(100 CHAR) NOT NULL,
  price       NUMBER             NOT NULL,
  summary     VARCHAR2(200 CHAR),
  image_url   VARCHAR2(300)     ,
  created_at  DATE               DEFAULT SYSDATE,
  updated_at  DATE               DEFAULT SYSDATE,
  CONSTRAINT PK_products PRIMARY KEY (product_id)
);

ALTER TABLE products
  ADD CONSTRAINT FK_categories_TO_products
    FOREIGN KEY (category_id)
    REFERENCES categories (category_id);

ALTER TABLE payments
  ADD CONSTRAINT FK_orders_TO_payments
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id);

ALTER TABLE orders
  ADD CONSTRAINT FK_users_TO_orders
    FOREIGN KEY (user_id)
    REFERENCES users (user_id);

ALTER TABLE cartitems
  ADD CONSTRAINT FK_users_TO_cartitems
    FOREIGN KEY (user_id)
    REFERENCES users (user_id);

ALTER TABLE orderitems
  ADD CONSTRAINT FK_orders_TO_orderitems
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id);

ALTER TABLE orderitems
  ADD CONSTRAINT FK_products_TO_orderitems
    FOREIGN KEY (product_id)
    REFERENCES products (product_id);

ALTER TABLE cartitems
  ADD CONSTRAINT FK_products_TO_cartitems
    FOREIGN KEY (product_id)
    REFERENCES products (product_id);

ALTER TABLE orderitems
  ADD CONSTRAINT FK_users_TO_orderitems
    FOREIGN KEY (user_id)
    REFERENCES users (user_id);