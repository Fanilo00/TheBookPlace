create sequence dept_id_seq
    as integer;

alter sequence dept_id_seq owner to nomena;

create sequence emp_id_seq
    as integer;

alter sequence emp_id_seq owner to nomena;

create table if not exists dept
(
    iddept integer default nextval('dept_id_seq'::regclass) not null
        primary key,
    label  varchar(20)                                      not null,
    numero integer
);

alter table dept
    owner to nomena;

alter sequence dept_id_seq owned by dept.iddept;

create table if not exists emp
(
    idemp     integer default nextval('emp_id_seq'::regclass) not null
        primary key,
    label     varchar(20)                                     not null,
    embauche  date                                            not null
        constraint emp_date_embauche_check
            check (embauche < CURRENT_DATE),
    salaire   numeric                                         not null
        constraint emp_salaire_check
            check (salaire > (0)::numeric),
    iddeptemp integer                                         not null
        constraint emp_id_dept_fkey
            references dept
);

alter table emp
    owner to nomena;

alter sequence emp_id_seq owned by emp.idemp;

create table if not exists genesis_user
(
    id        serial
        primary key,
    username  varchar not null,
    password  varchar not null,
    authority integer not null
);

alter table genesis_user
    owner to nomena;

create table if not exists genesis_token
(
    id         serial
        primary key,
    token      varchar   not null
        unique,
    authority  integer   not null,
    expiration timestamp not null,
    active     integer   not null
);

alter table genesis_token
    owner to nomena;

create or replace view v_genesis_token_active(id, token, authority, expiration, active) as
SELECT genesis_token.id,
       genesis_token.token,
       genesis_token.authority,
       genesis_token.expiration,
       genesis_token.active
FROM genesis_token
WHERE genesis_token.expiration > CURRENT_TIMESTAMP
  AND genesis_token.active = 10;

alter table v_genesis_token_active
    owner to nomena;

create or replace function insertdefault() returns void
    language plpgsql
as
$$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM genesis_user WHERE username = 'admin') THEN
        INSERT INTO genesis_user VALUES (default, 'admin', 'root', 10);
    END IF;
    RETURN;
END;
$$;

alter function insertdefault() owner to nomena;


