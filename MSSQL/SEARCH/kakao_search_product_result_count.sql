/* 
	Author      : Seunghwan Shin 
	Create date : 2021-09-12
	Description : 물품 검색결과 -> 총 물품의 갯수를 가져와준다.
	     
	History	:	2021-09-12 Seunghwan Shin	#최초 생성
				2021-11-07 Seunghwan Shin	#캐릭터 필터링 옵션 추가

	Real DB : exec dbo.kakao_search_product_result_count N'라이언', null
			  exec dbo.kakao_search_product_result_count N'라이언', 48	

*/ 
CREATE proc dbo.kakao_search_product_result_count
	@input_name nvarchar(100)
,	@prod_seq varchar(10)
,	@sorted_option_char varchar(10)
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	
	if (@sorted_option_char = '0')
	begin
		if (@prod_seq is null)
		begin
			select
					count(*) as cnt
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
			where kpt.product_nm like N'%' + @input_name + N'%'
			and kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
		end
		else
		begin
			select
				count(*) as cnt
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
			where kpt.product_id = convert(bigint,@prod_seq)
			and kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
		end
	end
	else
	begin
		if (@prod_seq is null)
		begin
			select
					count(*) as cnt
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
			inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
			where kpt.product_nm like N'%' + @input_name + N'%'
			and kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
			and kcp.char_seq = convert(int,@sorted_option_char)
		end
		else
		begin
			select
				count(*) as cnt
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
			inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
			where kpt.product_id = convert(bigint,@prod_seq)
			and kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
			and kcp.char_seq = convert(int,@sorted_option_char)
		end
	end
end

