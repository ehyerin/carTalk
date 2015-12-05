select * from talk_board;
select * from trade_board;
select * from trade_comment;
select * from carpool;
select * from carpool_location;
select * from member;
select LAST_INSERT_ID();
 select LAST(carpool_no) from carpool;
 select carpool_no,carpool_member_id, carpool_price, carpool_startTime,carpool_endTime,carpool_Companion,carpool_Type
	from carpool where carpool_Type='하교';
 
 
SELECT carpool.carpool_no,carpool.carpool_startTime, carpool.carpool_endTime,
carpool.carpool_Companion,carpool.carpool_Type,carpool_location.carpool_location as carpool
FROM carpool
INNER JOIN carpool_location
ON carpool.carpool_no=carpool_location.carpool_no
and carpool_location.carpool_location like concat ('%','시청','%')
and '1' <= carpool.carpool_Companion
and '2015-11-29 18:30'>= carpool.carpool_startTime
and '2015-11-29 18:30'<= carpool.carpool_endTime
and '하교' = carpool.carpool_Type
ORDER BY carpool.carpool_endTime desc;


delete from carpool where carpool_no='1'

select * from testabcd.member where member_id='jh4395' and member_password='1111';
select member_id,member_password,member_name,member_email from testabcd.member where member_id='jh4395' and member_password='1111';
insert into testabcd.member (member_id,member_password,member_name,member_email) values('jh4395','1234','이주형','jh4395@ajou.ac.kr')
select * from testabcd.member where member_id='jh4395';
update testabcd.member set member_name='주니', member_email='jh4395@hanmail.com', member_password='1111' where member_id='jh4395'
	
select member_id,member_password,member_name,member_email from testabcd.member
		where member_id=#{memberId} and member_password=#{memberPassword}
		
insert into talk_board (talk_member_id,talk_time_posted,talk_contents) values('jh4395',NOW(),'살려줘1')
delete from talk_board;

insert into carpool(
	 carpool_member_id, carpool_price, carpool_startTime,carpool_endTime,carpool_Companion,carpool_Type
  )  values('jh4395',1000,'2011/11/13 10:01', '2011/11/13 10:10', 3, '등교')

								
		SELECT talk_no, talk_member_id, talk_contents,
		DATE_FORMAT(talk_time_posted,'%Y.%m.%d %H:%i') as talk_time_posted
		FROM talk_board
		order by talk_no desc limit 0,10
 
		
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


		
		

