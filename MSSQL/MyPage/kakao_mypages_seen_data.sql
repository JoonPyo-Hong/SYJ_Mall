/* 
	Author      : Seunghwan Shin 
	Create date : 2021-12-01  
	Description : 마이페이지 - 최근본 상품
	     
	History	:	2021-12-01	Seunghwan Shin	#최초 생성
				2021-12-02	Seunghwan Shin	#금액 format 변경, 이미지 형식 변경
				2021-12-27	Seunghwan Shin	#순서를 위해 임시테이블 변수 사용

	
	Real DB : exec dbo.kakao_mypages_seen_data '119#118#9'

*/
alter proc dbo.kakao_mypages_seen_data
	@seen_data varchar(3000)	-- 쿠키정보
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
	--임시테이블 객체 생성 => 순서를 지정해주기 위함
	declare @CLR_TABLE table(
		product_id bigint primary key
	,	idx	int identity(1,1)
	)

	insert into @CLR_TABLE
	select convert(bigint,value) from string_split(@seen_data,'#')

	select
		kpt.product_id as prodId
	,	kpt.product_nm as prodNm
	,	format(kpt.product_price,'#,#') as prodPrice
	,	kpt.discount_rate as discRate
	,	case when kpt.discount_rate = 0 then '0'
			 else format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#')
		end as dcPrice
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as picUrl
	from @CLR_TABLE ss
	inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = ss.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
	where kpi.rep_img_yn = 'Y'
	and   kpi.head_img_yn = 'Y'
	order by ss.idx desc
			
end

