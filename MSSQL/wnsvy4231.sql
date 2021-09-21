create table dbo.KAKAO_ORDER(
	seq bigint, -- 번호
	reg_dt date not null default getdate(), -- 등록일
	reg_nm nvarchar(20), -- 등록자
	reg_email varchar(100), --등록메일
	country nvarchar(20), --국가
	reg_phone_num nvarchar(100), -- 등록폰번호 
	price money, -- 가격
	stat varchar(2) -- 주문 상태
);

create table dbo.KAKAO_SHIPPING(
	seq bigint, -- 번호
	reg_nm nvarchar(20), -- 등록자
	reg_phone_num varchar(100), -- 등록폰번호 
	adress nvarchar(500), --주소
	country nvarchar(20), --국가	
	message nvarchar(500), -- 요청사항
	stat varchar(2) -- 기본 배송지 상태
);