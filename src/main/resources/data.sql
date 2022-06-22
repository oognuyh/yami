INSERT INTO categories(category_id, name) VALUES('26275020-ea3c-11ec-8fea-0242ac120002', '튀김');
INSERT INTO categories(category_id, name) VALUES('d1ee2312-ee05-11ec-8ea0-0242ac120002', '국물요리');
INSERT INTO categories(category_id, name) VALUES('51d25c06-ee06-11ec-8ea0-0242ac120002', '떡볶이/분식');
INSERT INTO categories(category_id, name) VALUES('572c44eb-6505-4377-8c14-dd90204ffea6', '간편식사/밀키트/반찬');
INSERT INTO categories(category_id, name) VALUES('ae355eb5-bd08-43c2-b05f-f77974cd5aa5', '피자/햄버거');
INSERT INTO categories(category_id, name) VALUES('8afc30bf-10c6-4490-b7d5-7b72787054c9', '베이커리');
INSERT INTO categories(category_id, name) VALUES('bc7715a4-f4e7-4674-978f-790cfcb11f9c', '간식/과자');
INSERT INTO categories(category_id, name) VALUES('3f017cff-45a9-4820-9769-7784168dcb92', '육가공');
INSERT INTO categories(category_id, name) VALUES('411414b9-5ef6-4e11-ad76-af795a98a064', '정육');
INSERT INTO categories(category_id, name) VALUES('d62670d6-6fb3-4286-aee6-357b95a09a37', '수산물/건어물');
INSERT INTO categories(category_id, name) VALUES('3f006a84-cb34-4669-a98a-6d0eeeb2a93e', '소스/드레싱/장류');
INSERT INTO categories(category_id, name) VALUES('15651ae7-5995-4217-9298-07271104d383', '가루/조미료/오일');
INSERT INTO categories(category_id, name) VALUES('6cb3df2b-c354-4308-a5ac-057edd74656c', '농산물가공');
INSERT INTO categories(category_id, name) VALUES('71e27f98-39c5-4d83-b09c-cae91961afc6', '커피/음료재료');
INSERT INTO categories(category_id, name) VALUES('490830d9-1433-49c9-a613-f6e6f7c678cc', '차/음료/생수');
INSERT INTO categories(category_id, name) VALUES('c3e1fa2e-2f64-4cdb-ab50-4b1782f859b9', '유제품/치즈');
INSERT INTO categories(category_id, name) VALUES('89d01dc9-8302-46bd-8d76-7fec9fa5fc79', '다이어트/건강/키즈식품');
INSERT INTO categories(category_id, name) VALUES('4078c25e-8cbb-436f-8cbf-6946b83ea003', '배달/매장용품');
INSERT INTO categories(category_id, name) VALUES('ffc63427-d643-4185-96cb-20d9aa8bb27d', '생활/주방용품');
INSERT INTO categories(category_id, name) VALUES('cd30d460-2e1e-4638-8d96-d9f2cd713b7b', '선물세트');

INSERT INTO users(user_id, name, nickname, email, password, postcode, address1, address2) 
VALUES('d1ee2312-ee05-11ec-8ea0-0242ac120002', 'tester01', 'tester01', 'tester01@yami.org', '$2a$10$awhFJwrWH4O3keLdqCecT.hplUuJSTlK6mGNY/86FWTh5EX3jwjou', '06234','서울특별시 강남구 테헤란로 124', '삼원타워 5층');
INSERT INTO users(user_id, name, nickname, email, password, postcode, address1, address2) 
VALUES('5a6a5894-0c46-48a5-99ac-ce72453c518f', 'tester02', 'tester02', 'tester02@yami.org', '$2a$10$k7xbQDf4e48HPp5spbqPuetQkAQmCPPnee98aOJZGrlT0hCa6VDgy', '06234', '서울특별시 강남구 테헤란로 124', '삼원타워 5층');

INSERT INTO products(product_id, category_id, name, price, summary, image_url) 
VALUES('29a9c685-64bd-48db-a6cd-fafa2d4aed3c', '26275020-ea3c-11ec-8fea-0242ac120002', '크리스피 통새우 후라이드 200g_에어프라이어 전용 새우튀김!', 4900, '', 'https://www.foodingfactory.com/data/goods/21/02/08/1000007431/1000007431_detail_082.jpg');

INSERT INTO images(image_id, target_id, path) VALUES('4aef2ca1-150a-4d2f-ac06-752267e96f33', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_01.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('219a8fc6-7ddf-4c91-b8f8-b6c7acfe2431', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_02.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('332f22da-5f23-4e08-9676-d99c3f459376', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_03.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('cf3c3699-b9d7-43f8-b35e-763b210e154e', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_04.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('66b7a08f-2af8-42b8-b56b-84eaea38da31', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_05.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('e8b16b07-e763-4ee1-9c10-89271ec0625d', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_06.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('4d156058-64f0-4941-847a-cd427cdb4240', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_07.jpg');


INSERT INTO orderitems
(order_item_id, user_id, order_id, product_id, quantity, created_at, updated_at)
VALUES('13213506-7f60-41db-86ca-c3b2005d3489', 'd1ee2312-ee05-11ec-8ea0-0242ac120002', '41c60ad4-0042-406b-915e-7f2668751990', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 2, SYSDATE, SYSDATE);

INSERT INTO orderitems
(order_item_id, user_id, order_id, product_id, quantity, created_at, updated_at)
VALUES('9471b9a0-28f6-456e-9ad2-771181965777', 'd1ee2312-ee05-11ec-8ea0-0242ac120002', '41c60ad4-0042-406b-915e-7f2668751990', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 3, SYSDATE, SYSDATE);

INSERT INTO orderitems
(order_item_id, user_id, order_id, product_id, quantity, created_at, updated_at)
VALUES('20ed09eb-6a3d-4203-a2b9-07fbe32fb924', 'd1ee2312-ee05-11ec-8ea0-0242ac120002', '41c60ad4-0042-406b-915e-7f2668751990', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 4, SYSDATE, SYSDATE);