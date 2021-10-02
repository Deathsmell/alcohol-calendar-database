create table event
(
    id       bigint not null auto_increment,
    created  datetime(6),
    updated  datetime(6),
    start    datetime(6),
    title    varchar(255),
    owner_id bigint,
    primary key (id)
) engine = InnoDB;

create table event_aud
(
    id       bigint  not null,
    rev      integer not null,
    revtype  tinyint,
    created  datetime(6),
    updated  datetime(6),
    start    datetime(6),
    title    varchar(255),
    owner_id bigint,
    primary key (id, rev)
) engine = InnoDB;
create table revinfo
(
    rev      integer not null auto_increment,
    revtstmp bigint,
    primary key (rev)
) engine = InnoDB;

create table user
(
    id       bigint not null auto_increment,
    created  datetime(6),
    updated  datetime(6),
    password varchar(255),
    status   varchar(64),
    username varchar(64),
    primary key (id)
) engine = InnoDB;

create table user_aud
(
    id       bigint  not null,
    rev      integer not null,
    revtype  tinyint,
    password varchar(255),
    status   varchar(64),
    username varchar(64),
    primary key (id, rev)
) engine = InnoDB;

alter table event
    add constraint FKpukp8q71te29sy099ik1kv9c6 foreign key (owner_id) references user (id);
alter table event_aud
    add constraint FK76r0s14ewob41mu1pe3qdbdke foreign key (rev) references revinfo (rev);
alter table user_aud
    add constraint FK89ntto9kobwahrwxbne2nqcnr foreign key (rev) references revinfo (rev);