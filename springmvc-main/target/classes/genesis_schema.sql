-- db : demo_spring

create table if not exists genesis_user(
    id serial primary key,
    username varchar not null,
    password varchar not null,
    authority int not null
);
create table if not exists genesis_token(
    id serial primary key,
    token varchar not null unique,
    authority int not null,
    expiration timestamp not null,
    active int not null
);

create or replace view v_genesis_token_active as
select *
from genesis_token
where expiration>current_timestamp and active=10;

CREATE OR REPLACE FUNCTION insertDefault() RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM genesis_user WHERE username = 'admin') THEN
        INSERT INTO genesis_user VALUES (default, 'admin', 'root', 10);
    END IF;
    RETURN;
END;
$$ LANGUAGE plpgsql;

select insertDefault();