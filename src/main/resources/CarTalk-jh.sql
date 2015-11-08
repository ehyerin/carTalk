select * from talk_board;
select * from trade_board;
select * from trade_comment;

select * from member
select * from testabcd.member where member_id='jh4395' and member_password='1111';
select member_id,member_password,member_name,member_email from testabcd.member where member_id='jh4395' and member_password='1111';
insert into testabcd.member (member_id,member_password,member_name,member_email) values('jh4395','1234','이주형','jh4395@ajou.ac.kr')
select * from testabcd.member where member_id='jh4395';
update testabcd.member set member_name='주니', member_email='jh4395@hanmail.com', member_password='1111' where member_id='jh4395'
	
select member_id,member_password,member_name,member_email from testabcd.member
		where member_id=#{memberId} and member_password=#{memberPassword}
		
insert into testabcd.talk_board (talk_member_id,talk_time_posted,talk_contents) values('jh4395',NOW(),'살려줘1')
delete from testabcd.talk_board;


								
		SELECT talk_no, talk_member_id, talk_contents,
		DATE_FORMAT(talk_time_posted,'%Y.%m.%d %H:%i') as talk_time_posted
		FROM talk_board
		order by talk_no desc limit 0,10
 	
	
		delete from talk_board;
		
					SELECT talk_no, talk_member_id, talk_contents,talk_time_posted
					from(	 
						SELECT talk_no, talk_member_id, talk_contents,talk_time_posted,
						10*1-10 as startlimit, 10*1-1 as endlimit
						from(
						SELECT talk_no, talk_member_id, talk_contents,
						DATE_FORMAT(talk_time_posted,'%Y.%m.%d %H:%i') as talk_time_posted
						from testabcd.talk_board
						order by talk_no desc 
						)paging1
						)paging2 limit startlimit,endlimit
						
						
						
select 10*1-10 as startlimit, 10*1-1 as endlimit


		
		

