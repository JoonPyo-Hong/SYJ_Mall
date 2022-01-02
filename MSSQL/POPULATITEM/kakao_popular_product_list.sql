/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-13   
	Description : 인기페이지 상품 바둑판처럼 배열하는 로직
	     
	History	: 2021-08-13 Seunghwan Shin	#최초 생성 : 아직 구매 로직이 없어서 이미지 뜨는지만 테스트
			  2021-08-13 Seunghwan Shin	#가져올 상품 갯수 변경
			  2021-08-14 Seunghwan Shin	#구매정보에 기반한 데이터 추가
			  2021-08-19 Seunghwan Shin	#rownumber 추가
			  2021-08-22 Seunghwan Shin	#장바구니 이미지 불러오기 추가
			  2021-08-24 Seunghwan Shin	#회원장바구니 목록 불러오기 로직오류 수정
			  2021-08-26 Seunghwan Shin	#장바구니 쿠키정보 구분자 '#'으로 변경
			  2021-09-19 Seunghwan Shin	#product_count > 0 인 상품들만 보여주기
			  2022-01-02 Seunghwan Shin	#성능을 위해 인기 판매량 테이블을 직접 만들어 조인(KAKAO_JOB_RANK_POPULAR)
			   
	
	Real DB :	exec dbo.kakao_popular_product_list 1,2000001,''
				exec dbo.kakao_popular_product_list 1,0,'13#21#11#3#'
*/
CREATE proc dbo.kakao_popular_product_list
	@paging			int				-- 페이지 넘버
,	@qoouser_seq	int				-- 회원고유번호
,	@basket_info	varchar(3000)	-- 쿠키정보
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	--로그인이 안되어 있는경우 : 쿠키 사용
	if (@qoouser_seq = 0)
	begin
		
		select
			pdc.rn
		,	pdc.productId
		,	pdc.productImg
		,	pdc.basket
		from
		(
			select
				row_number() over (order by kjrp.buy_cnt desc) as rn
			,	kjrp.product_id as productId
			,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as productImg
			,	kjrp.buy_cnt
			,	case 
					when ss.value is null then 'cart.png'
				else 'cart_on.png'
				end as basket
			from dbo.KAKAO_JOB_RANK_POPULAR kjrp with(nolock) 
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpi.product_id = kjrp.product_id
			left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kjrp.product_id
			where kpi.rep_img_yn = 'Y' and kpi.head_img_yn = 'Y'
		) as pdc
		where rn between (@paging * 18) - 17 and (@paging * 18)

	end
	--로그인이 되어있는 경우
	else
	begin
		select
			pdc.rn
		,	pdc.productId
		,	pdc.productImg
		,	pdc.basket
		from
		(
			select
				row_number() over (order by kjrp.buy_cnt desc) as rn
			,	kjrp.product_id as productId
			,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as productImg
			,	kjrp.buy_cnt
			,	case 
					when kusc.product_id is null then 'cart.png'
				else 'cart_on.png'
				end as basket
			from dbo.KAKAO_JOB_RANK_POPULAR kjrp with(nolock) 
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpi.product_id = kjrp.product_id
			left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq and kusc.product_id = kpi.product_id and kusc.cart_del_yn = 'N'
			where kpi.rep_img_yn = 'Y' and kpi.head_img_yn = 'Y'
		) as pdc
		where rn between (@paging * 18) - 17 and (@paging * 18)
	end

end

