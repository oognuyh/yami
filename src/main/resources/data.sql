INSERT INTO categories(category_id, name) VALUES('26275020-ea3c-11ec-8fea-0242ac120002', '국/찌개/탕');
INSERT INTO categories(category_id, name) VALUES('d1ee2312-ee05-11ec-8ea0-0242ac120002', '찜/전골');
INSERT INTO categories(category_id, name) VALUES('51d25c06-ee06-11ec-8ea0-0242ac120002', '파스타/면요리');
INSERT INTO categories(category_id, name) VALUES('572c44eb-6505-4377-8c14-dd90204ffea6', '기타 간편요리');

INSERT INTO users(user_id, name, nickname, email, password, postcode, address1, address2) 
VALUES('d1ee2312-ee05-11ec-8ea0-0242ac120002', 'tester01', 'tester01', 'tester01@yami.org', '$2a$10$awhFJwrWH4O3keLdqCecT.hplUuJSTlK6mGNY/86FWTh5EX3jwjou', '06234','서울특별시 강남구 테헤란로 124', '삼원타워 5층');
INSERT INTO users(user_id, name, nickname, email, password, postcode, address1, address2) 
VALUES('5a6a5894-0c46-48a5-99ac-ce72453c518f', 'tester02', 'tester02', 'tester02@yami.org', '$2a$10$k7xbQDf4e48HPp5spbqPuetQkAQmCPPnee98aOJZGrlT0hCa6VDgy', '06234', '서울특별시 강남구 테헤란로 124', '삼원타워 5층');

INSERT INTO products(product_id, category_id, name, price, summary, image_url) 
VALUES('29a9c685-64bd-48db-a6cd-fafa2d4aed3c', '26275020-ea3c-11ec-8fea-0242ac120002', '가/국/찌개/탕', 4900, '', 'https://www.foodingfactory.com/data/goods/21/02/08/1000007431/1000007431_detail_082.jpg');
INSERT INTO products(product_id, category_id, name, price, summary, image_url) 
VALUES('7e9c9a3f-c1e9-4c56-9567-b303ae9c95f9', '26275020-ea3c-11ec-8fea-0242ac120002', '/국/찌개/나/탕', 4900, '', 'https://www.foodingfactory.com/data/goods/21/02/08/1000007431/1000007431_detail_082.jpg');
INSERT INTO products(product_id, category_id, name, price, summary, image_url) 
VALUES('70b8295b-8bd4-45b3-8465-b0918a973312', '26275020-ea3c-11ec-8fea-0242ac120002', '가/국/찌개/탕', 4900, '', 'https://www.foodingfactory.com/data/goods/21/02/08/1000007431/1000007431_detail_082.jpg');
INSERT INTO products(product_id, category_id, name, price, summary, image_url) 
VALUES('f2438614-4a9f-4132-aa0f-37e6292527ad', 'd1ee2312-ee05-11ec-8ea0-0242ac120002', '나/찜/전골', 4900, '', 'https://www.foodingfactory.com/data/goods/21/02/08/1000007431/1000007431_detail_082.jpg');
INSERT INTO products(product_id, category_id, name, price, summary, image_url) 
VALUES('806644e3-1c92-432e-8cde-e07adff38b8a', 'd1ee2312-ee05-11ec-8ea0-0242ac120002', '가찜/전골', 4900, '', 'https://www.foodingfactory.com/data/goods/21/02/08/1000007431/1000007431_detail_082.jpg');
INSERT INTO products(product_id, category_id, name, price, summary, image_url) 
VALUES('f94a3ee5-de7a-4872-b103-41f2d05abd74', 'd1ee2312-ee05-11ec-8ea0-0242ac120002', '찜/전/나/골', 4900, '', 'https://www.foodingfactory.com/data/goods/21/02/08/1000007431/1000007431_detail_082.jpg');


INSERT INTO images(image_id, target_id, path) VALUES('4aef2ca1-150a-4d2f-ac06-752267e96f33', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_01.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('219a8fc6-7ddf-4c91-b8f8-b6c7acfe2431', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_02.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('332f22da-5f23-4e08-9676-d99c3f459376', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_03.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('cf3c3699-b9d7-43f8-b35e-763b210e154e', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_04.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('66b7a08f-2af8-42b8-b56b-84eaea38da31', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_05.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('e8b16b07-e763-4ee1-9c10-89271ec0625d', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_06.jpg');
INSERT INTO images(image_id, target_id, path) VALUES('4d156058-64f0-4941-847a-cd427cdb4240', '29a9c685-64bd-48db-a6cd-fafa2d4aed3c', 'https://img.bizthenaum.com/img2021/fried_shrimp_07.jpg');