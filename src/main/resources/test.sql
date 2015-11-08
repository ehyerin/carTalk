	insert into trade_board( trade_title, trade_member_id, trade_content, trade_time_posted)
		values( '2345','ㅇㅅㅁㄷㅅ','추가', sysdate())
		
		
		select * from trade_board;
	select * from trade_comment;
				insert into trade_comment( trade_no, trade_comment_member_id, trade_comment_content, trade_comment_time_posted)
		values(4, 'aaaa', '댓글 테스트', sysdate())
    
		SELECT @ROWNUM := @ROWNUM + 1 AS ROWNUM , trade_no, trade_title, trade_member_id, trade_time_posted,trade_hit, trade_board.* 
		FROM 
		(	 
			SELECT trade_no, trade_title, trade_member_id, trade_time_posted,trade_hit,
				CEIL(rownum/10) AS page
			FROM 
			( 
				SELECT trade_no, trade_title, trade_member_id, trade_hit,
					to_char(trade_time_posted,'YYYY.MM.DD') as trade_time_posted
				FROM trade_board,    (SELECT @ROWNUM := 0) R;
				order by trade_no desc
			) 
		) 
		WHERE PAGE=1;
		
			update trade_board set trade_title='과연', trade_content='될것인가악2222'
	where trade_no=1
	
	
select 	 trade_no, trade_title, trade_member_id, trade_time_posted,trade_hit
from (SELECT trade_no, trade_title, trade_member_id, trade_time_posted,trade_hit,
				CEIL(rownum/10) AS page 	FROM trade_board
				order by trade_no desc)
where page=1;
l
select trade_no, trade_title, trade_member_id, trade_time_posted,trade_hit from trade_board order by trade_no limit 0,10;
	
select trade_no, trade_title, trade_member_id, trade_time_posted,trade_hit
from ( select @rownum:=@rownum+1 as rownum, a.*
from (select trade_no, trade_title, trade_member_id, trade_time_posted,trade_hit from trade_board order by trade_no desc) a, (select @ rownum:=0)b)c
where
c.rownum between 0 and 1;
	

SELECT SQL_CALC_FOUND_ROWS A.* FROM (select trade_no, trade_title, trade_member_id, trade_time_posted,trade_hit from trade_board ) A LIMIT 0 OFFSET 10;

SELECT FOUND_ROWS() AS TOTAL;

		select count(*) from trade_board
		
		
	select  trade_no, trade_title, trade_member_id, trade_content, 
DATE_FORMAT(trade_time_posted, '%Y-%m-%d') as trade_comment_time_posted , trade_hit
	from xe.trade_board 
	where  trade_no=1

		select trade_no, trade_title, trade_member_id, DATE_FORMAT(trade_time_posted, '%Y-%m-%d') as trade_time_posted,trade_hit 
	from trade_board 
	order by trade_no 
	limit 0,10
	
	select * from member;
	
			insert into member(member_id, member_password, member_name, member_email)
		values('admin', '1234', '관리자', 'admin@gmail.com')