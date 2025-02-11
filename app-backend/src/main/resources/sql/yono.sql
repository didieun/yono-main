-- ==============================================
-- 프로젝트 초기 데이터 입력 SQL (2025-02-10 기준)
-- 해당 데이터는 관리자 페이지에서 직접 입력하는 대체 수단으로도 활용
-- ==============================================

-- 쿼리 문자열로 실행 (&,?,=) 같은 값 허용 (카드 데이터 INSERT 할 때 필수) 
-- 안되면 oracle developer 내에서 쿼리문 실행
set define off;

select * from CARD;
select * from CARD_BENEFIT;

-- ==============================================
-- 1. 카드 정보(CARD) 테이블 데이터 삽입
-- ==============================================

-- KB국민 My WE:SH 카드 
INSERT INTO card (CARD_ID, CARD_TITLE, CARD_PROVIDER, ORGANIZATION_CODE, CARD_IMG_URL, CARD_APPLY_URL, CREATED_AT, UPDATED_AT)
VALUES (CARD_SEQ.nextval, 'KB국민 My WE:SH 카드', 'kb', '0301', '/uploads/images/card/kb/kb-my/kb-my1.png,/uploads/images/card/kb/kb-my/kb-my2.png,/uploads/images/card/kb/kb-my/kb-my3.png,/uploads/images/card/kb/kb-my/kb-my4.png', 'https://m.kbcard.com/CRD/DVIEW/MCAMCXHIACRC0002?allianceCode=09923&mainCC=b',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 현대카드 M카드 
INSERT INTO card (CARD_ID, CARD_TITLE, CARD_PROVIDER, ORGANIZATION_CODE, CARD_IMG_URL,CARD_APPLY_URL, CREATED_AT, UPDATED_AT)
VALUES (CARD_SEQ.nextval, '현대 M카드', 'hyundai', '0302', '/uploads/images/card/hyundai/hyundai-m/hyundai-m1.png,/uploads/images/card/hyundai/hyundai-m/hyundai-m2.png,/uploads/images/card/hyundai/hyundai-m/hyundai-m3.png', 'https://www.hyundaicard.com/cpc/cr/CPCCR0201_01.hc?cardWcd=ME4',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 삼성카드 iD SIMPLE
INSERT INTO card (CARD_ID, CARD_TITLE, CARD_PROVIDER, ORGANIZATION_CODE, CARD_IMG_URL,CARD_APPLY_URL, CREATED_AT, UPDATED_AT)
VALUES (CARD_SEQ.nextval, '삼성 iD SIMPLE카드', 'samsung', '0303', '/uploads/images/card/samsung/samsung-id/samsung-id1.png,/uploads/images/card/samsung/samsung-id/samsung-id2.png,/uploads/images/card/samsung/samsung-id/samsung-id3.png', 'https://www.samsungcard.com/home/card/cardinfo/PGHPPCCCardCardinfoDetails001?code=AAP1767',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 농협 별다줄카드
INSERT INTO card (CARD_ID, CARD_TITLE, CARD_PROVIDER, ORGANIZATION_CODE, CARD_IMG_URL,CARD_APPLY_URL, CREATED_AT, UPDATED_AT)
VALUES (CARD_SEQ.nextval, '농협 별다줄카드', 'nh', '0304', '/uploads/images/card/nh/nh-byul/nh-byul1.png,/uploads/images/card/nh/nh-byul/nh-byul2.png,/uploads/images/card/nh/nh-byul/nh-byul3.png', 'https://card.nonghyup.com/servlet/IpCc2021R.act',URRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 신한 처음카드
INSERT INTO card (CARD_ID, CARD_TITLE, CARD_PROVIDER, ORGANIZATION_CODE, CARD_IMG_URL,CARD_APPLY_URL, CREATED_AT, UPDATED_AT)
VALUES (CARD_SEQ.nextval, '신한 처음카드', 'shinhan', '0306', '/uploads/images/card/shinhan/shinhan-first/shinhan-first1.png,/uploads/images/card/shinhan/shinhan-first/shinhan-first2.png', 'https://www.shinhancard.com/pconts/html/card/apply/credit/1227020_2207.html', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 하나 알뜰카드
INSERT INTO card (CARD_ID, CARD_TITLE, CARD_PROVIDER, ORGANIZATION_CODE, CARD_IMG_URL,CARD_APPLY_URL, CREATED_AT, UPDATED_AT)
VALUES (CARD_SEQ.nextval, '하나 K-PASS', 'hana', '0313', '/uploads/images/card/hana/hana-kpass/hana-kpass1.png', 'https://www.hanacard.co.kr/OP_ACST010N.web?schID=001391', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 국민내일배움카드(체크)
INSERT INTO card (CARD_ID, CARD_TITLE, CARD_PROVIDER, ORGANIZATION_CODE, CARD_IMG_URL,CARD_APPLY_URL, CREATED_AT, UPDATED_AT)
VALUES (CARD_SEQ.nextval, '국민내일배움카드(체크)', 'nh', '0304', '/uploads/images/card/nh/nh-bright-tmr/nh-bright-tmr1.png', 'https://m.blog.naver.com/yeondodo/222634772178', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 올바른POINT체크
INSERT INTO card (CARD_ID, CARD_TITLE, CARD_PROVIDER, ORGANIZATION_CODE, CARD_IMG_URL,CARD_APPLY_URL, CREATED_AT, UPDATED_AT)
VALUES (CARD_SEQ.nextval, '올바른POINT체크', 'nh', '0304', '/uploads/images/card/nh/nh-honest/nh-honest1.png', 'https://card-search.naver.com/item?cardAdId=1243', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 현대카드 ZERO Edition2(할인형)
INSERT INTO card (CARD_ID, CARD_TITLE, CARD_PROVIDER, ORGANIZATION_CODE, CARD_IMG_URL,CARD_APPLY_URL, CREATED_AT, UPDATED_AT)
VALUES (CARD_SEQ.nextval, '현대카드 ZERO Edition2(할인형)', 'hyundai', '0302', '/uploads/images/card/hyundai/hyundai-zero/hyundai-zero1.png', 'https://www.hyundaicard.com/cpc/ca/CPCCA0101_01.hc?inflow=m&cardwcd=ZROE3&eventCode=SBO10' ,CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ==============================================
-- 카드 (CARD) 테이블 데이터 삽입 끝
-- ==============================================

-- ==============================================
-- 2. 카드 혜택(CARD_BENEFIT) 테이블 데이터 삽입
-- ==============================================

-- KB국민 My WE:SH 카드
INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 10, '가맹점', 'KB Pay 할인', '10%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 10, '음식', '음식점 할인', '10%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 10, '편의점', '편의점 할인', '10%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 10, '통신', 'OTT 할인', '30%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 10, '음식', '배달 할인', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 10, '여가', '영화관 할인', '30%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 10, '쇼핑', '올리브 영 할인', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 현대 M카드 
INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 11, '음식', '일반음식점 할인', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 11, '쇼핑', '쇼핑몰 할인', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 11, '가맹점', '국내외 가맹점 할인', '1.5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 11, '가맹점', '해외 가맹점 할인', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 삼성 iD SIMPLE카드
INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 3, '가맹점', '국내외 가맹점 할인', '0.7%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 3, '가맹점', '국내외 가맹점 할인', '1%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 12, '쇼핑', '온라인 쇼핑몰 멤버십 할인', '50%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 12, '여가', '영화 할인', '3,000원', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- 농협 별다줄카드
INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 13, '쇼핑', '국내 온라인 전 가맹점 청구 할인', '7%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 13, '가맹점', 'FLEX, RE-SELL, FUN 가맹점 청구 할인', '14%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 13, '생활', '6대 생활업종 청구 할인', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 13, '항공', '국제공항 라운지 무료 이용', '연 2회', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 13, '여가', '전국 주요 놀이공원 현장 할인', '최대 50%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 신한 처음카드
INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 14, '통신', '통신비 할인', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 5, '음식점', '음식점 할인', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 14, '음식', '음식점 포인트 적립', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 14, '여가', '카페 포인트 적립', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 14, '편의점', '편의점 포인트 적립', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 14, '생활', '일상 속 (생활, 여행, 패션) 적립', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 14, '통신', '정기결제 (통신, OTT, 멤버십) 적립', '최대 20%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 하나 K-PASS

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 15, '교통', '버스/지하철', '10% 캐시백', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 6, '의료', '다이소/올리브영', '1% 캐시백', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 15, '여가', '스타벅스/커피빈', '1% 캐시백', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 국민내일배움카드(체크)

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 16, '주유', '주유소 할인', '40원/L', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 16, '주유', '농협주유소 NH포인트 적립', '3%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 16, '쇼핑', '농협 판매장 NH포인트 적립', '5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 16, '금융', '환전 수수료 우대', '최고 50%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 16, '교육', '전화영어 할인', '최대 50%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 16, '통신', '해외로밍 할인', '서비스 제공', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 16, '여가', '국내외 여행패키지 할인', '최대 5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 16, '항공', '국내공항 라운지 무료 이용', '무료', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 올바른POINT체크
INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 17, '가맹점', '적립한도 없이 NH포인트 적립', '0.2% ~ 0.7%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 17, '항공', '국제공항 라운지 무료 이용', '무료', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 17, '금융', '전자금융 수수료 면제', '면제', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- 현대카드 ZERO Edition2(할인형)
INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 18, '가맹점', '모든 가맹점 할인', '0.7%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 18, '생활', '생활필수영역 할인', '1.5%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO card_benefit (BENEFIT_ID, CARD_ID, BENEFIT_TYPE, BENEFIT_TITLE, BENEFIT_VALUE, CREATED_AT, UPDATED_AT)
VALUES (CARD_BENEFIT_SEQ.nextval, 18, '항공', '비자 영프리미엄 혜택', '제공', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ==============================================
-- 카드 혜택(CARD_BENEFIT) 테이블 데이터 끝
-- ==============================================

commit;
rollback;