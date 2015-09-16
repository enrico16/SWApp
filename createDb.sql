drop database if exists swapp;
create database if not exists swapp;
use swapp;

# STOPGAP
drop table if exists swapp;

create table swapp (
	ID integer not null auto_increment,
	Gene varchar(50) not null,
	SNP varchar(50) not null,
	Trait varchar(250) not null,
	PValue double not null,
    GeneScore integer not null,
    GeneRank integer not null,
    PubMedID integer not null,
	primary key (ID)
) engine = innodb;

load data local infile 'data/swapp.txt'
into table swapp
ignore 1 lines
(Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID);

# STOPGAP Best LD
drop table if exists swappbestld;

create table swappbestld (
	ID integer not null auto_increment,
	Gene varchar(50) not null,
	SNP varchar(50) not null,
	Trait varchar(250) not null,
	PValue double not null,
    GeneScore integer not null,
    GeneRank integer not null,
    PubMedID integer not null,
	primary key (ID)
) engine = innodb;

load data local infile 'data/swapp.bestld.txt'
into table swappbestld
ignore 1 lines
(Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID);

# STOPGAP Gene MeSH
drop table if exists swappgenemesh;

create table swappgenemesh (
	ID integer not null auto_increment,
	Gene varchar(50) not null,
	SNP varchar(50) not null,
	Trait varchar(250) not null,
	PValue double not null,
    GeneScore integer not null,
    GeneRank integer not null,
    PubMedID integer not null,
	primary key (ID)
) engine = innodb;

load data local infile 'data/swapp.gene.mesh.txt'
into table swappgenemesh
ignore 1 lines
(Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID);
