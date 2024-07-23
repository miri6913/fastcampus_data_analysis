select * from rest_area_parking;

select * from rest_area_score;
select * from rest_area_parking;
select * from rest_area_toilet;

select a.휴게소명, a.시설구분, b.합계, b.대형, b.소형, b.장애인
from rest_area_score a left outer join rest_area_parking b
on a.휴게소명 = b.휴게소명
union
select b.휴게소명, a.시설구분, b.합계, b.대형, b.소형, b.장애인
from rest_area_parking b left outer join rest_area_score a
on a.휴게소명 = b.휴게소명;

select a.휴게소명, a.시설구분, b.남자_변기수, b.여자_변기수
from rest_area_score a left outer join rest_area_toilet b
on a.휴게소명 = b.시설명
union
select b.시설명, a.시설구분, b.남자_변기수, b.여자_변기수
from rest_area_toilet b left outer join rest_area_score a
on a.휴게소명 = b.시설명;

#inner join 교집합
select a.휴게소명, a.시설구분, b.합계, c.남자_변기수, c.여자_변기수
from rest_area_score a, rest_area_parking b, rest_area_toilet c
where a.휴게소명 = b.휴게소명
and b.휴게소명 = c.시설명;

select a.휴게소명, a.시설구분,
avg(b.합계) over(partition by a.시설구분) as avg_parking,
min(b.합계) over(partition by a.시설구분) as min_parking,
max(b.합계) over(partition by a.시설구분) as max_parking
from rest_area_score a inner join rest_area_parking b
on a.휴게소명 = b.휴게소명;

select a.휴게소명, a.평가등급,
sum(b.대형) over(partition by a.평가등급) as 대형 
from rest_area_score a inner join rest_area_parking b
on a.휴게소명 = b.휴게소명;

select t.휴게소명, t.평가등급, t.대형
from(
	select a.휴게소명, a.평가등급, b.대형,
	rank() over(partition by a.평가등급 order by b.대형 desc) as rnk
	from rest_area_score a inner join rest_area_parking b
	on a.휴게소명 = b.휴게소명
) t
where rnk = 1;
------------------------------------------------------

#노선별, 남자 변기수, 여자 변기수 최대값 출력
select 노선, max(남자_변기수), max(여자_변기수)
	from rest_area_toilet
	group by 노선;

select 시설명, 남자_변기수+여자_변기수 as total
from rest_area_toilet
order by total desc limit 1;

select 노선, round(avg(남자_변기수)), round(avg(여자_변기수))
	from rest_area_toilet
	group by 노선;

select t.노선, t.시설명, t.total
from(
	select 노선, 시설명, 남자_변기수+여자_변기수 as total,
rank() over(partition by 노선 order by 남자_변기수+여자_변기수 desc) as rnk
from rest_area_toilet
) t
where t.rnk = 1;

select 노선,
	count(case when 남자_변기수 > 여자_변기수 then 1 end) as male,
	count(case when 여자_변기수 > 남자_변기수 then 1 end) as female,
	count(case when 여자_변기수 = 남자_변기수 then 1 end) as equal,
	count(*) as total
	from rest_area_toilet
	group by 노선;

select s.휴게소명, s.시설구분, p.장애인
from(
	select 휴게소명, 시설구분
	from rest_area_score
	where 평가등급 = '최우수'
) s left outer join rest_area_parking p
on s.휴게소명 = p.휴게소명
order by p.장애인 desc;

select s.휴게소명, s.시설구분, round(p.장애인/p.합계*100,2)
	from(
		select 휴게소명, 시설구분
	from rest_area_score
	where 평가등급 = '우수'
	) s left outer join rest_area_parking p
	on s.휴게소명 = p.휴게소명
	order by round(p.장애인/p.합계*100,2) desc;
	
select * from rest_area_parking;
select * from rest_area_score;

select t.시설구분, round(avg(s.합계)) from 
rest_area_score t inner join rest_area_parking s
on t.휴게소명 = s.휴게소명
group by t.시설구분;

select c.노선, c.대형, c.휴게소명, c.rnk 
from (
	select a.노선, b.대형, b.휴게소명,
	rank() over(partition by a.노선 order by b.대형 desc) as rnk
	from rest_area_toilet a, rest_area_parking b
	where a.시설명 = b.휴게소명
) c
where c.rnk < 4;

-----------------------------------------------------------

select * from rest_area_animal;
select * from rest_area_wifi;

select a.휴게소명, a.종류, w.가능여부
from rest_area_animal a left outer join rest_area_wifi w
on a.휴게소명 = w.휴게소명
where w.가능여부 = 'O';

select count(*) from rest_area_animal
where 운영시간 = '24시간';

select trim(본부), count(*)  from rest_area_wifi
where 가능여부 = 'O'
group by trim(본부)
order by count(*)  desc;


select trim(본부), count(*)  from rest_area_wifi
where 가능여부 = 'O'
group by trim(본부)
having count(*) > 25
order by count(*)  desc;

