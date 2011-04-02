create table guestbook (
  muid    bigint(20) unsigned not null,
  name    varchar(32) not null default '',
  comment varchar(255) not null default '',
  created datetime not null,

  PRIMARY KEY (muid)
) ENGINE=InnoDB;
