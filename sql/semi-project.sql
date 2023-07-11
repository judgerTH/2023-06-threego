alter session set "_oracle_script" = true;

create user threego
identified by threego
default tablespace users;

grant connect, resource to threego;
alter user threego quota unlimited on users;

drop user threego cascade;

---------------------------------------------------------------

create table member(
    id 	varchar2(30),	
    pwd	varchar2(300) not null,
    name varchar2(50) not null,
    email varchar2(200),	
    phone char(12) not null,
    member_role char(1) default 'U',	
    address	varchar2(400) not null,
    reg_date date default sysdate,	
    constraints pk_member_id primary key(id),
    constraints uq_member_phone unique(phone),
    constraints uq_member_email unique(email),
    constraints ck_member_role check (member_role in ('A', 'R', 'U'))
        );

 alter table member modify phone char(11);   

insert into member values (
    'daeho', 'daeho','daeho@nate.com',01033233372,'A',
);        

delete member where id='dbsdk';

insert into member values (
    'dbsdk', '12345', 'yuna@naver.com' , '01020983684' , default , '경기도 평택시 서정동 파밀리에 421동 1603호', default
);     
select * from member;
create table ticket(
    tic_id 	varchar2(30),	
    tic_name varchar2(30) not null,
    tic_cnt number not null,
    tic_price number not null,
    constraint  pk_ticket_no primary key(tic_id)
    );        
                

        
create table payment(
    p_no	number,
    p_mem_id	varchar2(30),
    p_tic_id varchar2(30),
    p_date date default sysdate,
    p_cnt number, 
    p_use_cnt number,
    constraint  pk_payment_p_no primary key(p_no),
    constraints fk_payment_mem_id foreign key(p_mem_id) references member (id),
    constraints fk_paymente_tic_no foreign key(p_tic_id) references ticket(tic_id) 
   );     
   
create table board(
    b_no number,
    b_type	varchar2(30) not null,
    b_tittle varchar2(500) not null,
    b_writer varchar2(30) not null,
    b_content varchar2(4000) not null,
    b_reg_date date default sysdate,
    b_cnt	 number default 0,
    constraints pk_board_b_no primary key(b_no),
    constraints fk_board_b_writer foreign key(b_writer) references member(id) on delete cascade,
    constraints ck_board_b_type check(b_type in ('0', '1', '2', '3'))
);

create table board_comment(
    c_no number,
    c_level number default 1,
    c_writer varchar2(30),
    c_content varchar2(4000) not null,
    c_board_no number not null,
    c_reg_date date default sysdate,
    constraints pk_board_comment_c_no primary key(c_no),
    constraints fk_board_comment_c_writer foreign key(c_writer) references member(id) on delete cascade,
    constraints fk_board_comment_c_ref foreign key(c_board_no) references board( b_no) on delete cascade
);

create table location(
    l_id varchar2(30),	
    l_name	varchar2(20) not null,
    constraints pk_location_l_no primary key(l_id)
);

create table rider(
    r_id varchar2(30),
    r_location_id varchar2(30),
    r_status char(1),
    r_reg_date date default sysdate,
    up_date	date,
    constraints pk_r_id primary key(r_id),
    constraints fk_rider_r_id  foreign key(r_id) references member(id) on delete cascade,
    constraints fk_rider_location_id foreign key(r_location_id) references location(l_id),
    constraints ck_rider_r_status check (r_status in ('0', '1'))
    -- 0   승인대기 , 1    승인완료
);

create table request(
    req_no	number,
    req_writer varchar2(30) not null,
    req_location_id	varchar2(30) not null,
    req_photo varchar2(200) not null,
    req_status	char(1) default 0,
    req_date	date default sysdate,
    req_rider varchar2(30), 
    req_cp_date date default sysdate,
    constraints pk_request_req_no primary key(req_no),
    constraints fk_request_id foreign key(req_writer) references member(id), 
    constraints fk_request_location_id foreign key(req_location_id) references location(l_id),
    constraints fk_req_rider foreign key(req_rider) references rider(r_id),
    constraints ck_request_status check( req_status in ('0', '1', '2', '3'))
  -- 0 = 신청접수, 1 = 수거대기중, 2 = 수거완료, 3 = 수거취소
);

create table del_member(

del_id varchar2(30),
del_pwd varchar2(300)	 not null,
del_email	varchar2(200),	
del_phone number(11)	not null,
del_role	 char(1),	
del_address 	varchar2(400)	not null,
del_reg_date date,	
del_date date,	
constraints pk_del_member_del_id primary key(del_id),
constraints fk_del_member_del_id foreign key(del_id) references member(id)
);

create table warning(
w_no	 number,		
w_req_no	number not null,	
w_writer  varchar2(30)	not null,	
w_content varchar2(4000)	not null,	
w_reg_date date default sysdate,
w_confirm number default 0, 
w_caution varchar2(4000),
constraints pk_warning_w_no primary key(w_no),
constraints fk_warning_w_req_no foreign key(w_req_no) references request(req_no),
constraints fk_warning_w_id foreign key(w_writer) references member(id),
constraints ck_warning_w_confirm check(w_confirm in('0', '1'))
);



