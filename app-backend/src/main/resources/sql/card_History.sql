select * from card_History where USER_CARD_ID = 23 order by res_used_date;
drop table card_History;
TRUNCATE table card_History;

select * from CARD_HISTORY;

commit;

delete from CARD_HISTORY where USER_CARD_ID = 23;

SELECT index_name, table_name, uniqueness
FROM user_indexes
WHERE table_name = 'CARD_HISTORY';

DROP INDEX idx_res_used_date;

drop table card;
drop table user_card_company;
drop table user_card;
drop table user_info;
drop table card_benefit;
drop table card_history;
drop table badge;
drop table tbl_posts;
drop table tbl_reply;
drop table reply_likes;
drop table notice;


