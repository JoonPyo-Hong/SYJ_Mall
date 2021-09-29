create table dbo.KAKAO_ORDER(
	seq bigint, -- 번호
	p_seq bigint, -- 물품번호
	sum bigint, -- 물품 수량
);

create table dbo.KAKAO_SHIPPING(
	seq bigint, -- 번호
	reg_dt date not null default getdate(), -- 요청일
	reg_nm nvarchar(20), -- 이름
	reg_phone_num varchar(100), -- 전화번호
	adress nvarchar(500), --주소	
	message nvarchar(500), -- 요청사항
	pay varchar(2) -- 결제 수단
	stat varchar(2) -- 주문 상태
	price money, -- 전체 가격
);