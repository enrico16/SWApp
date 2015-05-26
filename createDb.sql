drop database if exists stopgap;
create database if not exists stopgap;
use stopgap;

drop table if exists swapp;

create table swapp (
	swapp_id integer not null auto_increment,
	Gene varchar(50) not null,
	SNP varchar(50) not null,
	Trait varchar(250) not null,
	PValue double not null,
    GeneScore integer not null,
    GeneRank integer not null,
    PubMedID integer not null,
	primary key (swapp_id)
) engine = innodb;

load data infile 'data/swapp.txt'
into table swapp
(Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID);
