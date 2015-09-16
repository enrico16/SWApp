drop database if exists swapp;
create database if not exists swapp;
use swapp;

# bestld
drop table if exists swapp.bestld;

create table swapp.bestld (
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
into table swapp.bestld
ignore 1 lines
(Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID);

# gene.mesh
drop table if exists swapp.gene_mesh;

create table swapp.gene_mesh (
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
into table swapp.gene_mesh
ignore 1 lines
(Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID);
