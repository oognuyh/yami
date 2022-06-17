INSERT INTO member(member_id, nickname, email, password, phone_number, role) 
VALUES('d1ee2312-ee05-11ec-8ea0-0242ac120002', 'tester', 'tester@yami.org', 'testertester', '01012345678', 'OWNER');

INSERT INTO category(category_id, name)
VALUES('51d25c06-ee06-11ec-8ea0-0242ac120002', '일식');

INSERT INTO restaurant(restaurant_id, member_id, category_id, name, phone_number, zip_code, address1, intro, latitude, longitude)
VALUES(
    '26275020-ea3c-11ec-8fea-0242ac120002', 
    'd1ee2312-ee05-11ec-8ea0-0242ac120002', 
    '51d25c06-ee06-11ec-8ea0-0242ac120002', 
    '나이스샤워', 
    '025586008', 
    '06239', 
    '서울 강남구 테헤란로10길 25 뜨라네아파트', 
    '강남역 최고의 분위기 좋은 텐동전문맛집, 연인들이 데이트 하기 좋은 맛집 나이스샤워',  
    37.739217230, 
    127.07028384);
