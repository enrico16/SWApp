drop database if exists swapp;
create database if not exists swapp;
use swapp;

# STOPGAP
drop table if exists swapp;

create table swapp (
	id integer not null auto_increment,
	gene varchar(50) not null,
	snp.ld varchar(50) not null,
	msh varchar(250) not null,
	pvalue double not null,
	gene.score integer not null,
	gene.rank.min integer not null,
	evidence varchar(50) not null,
    gene.best varchar(50) not null,
    evidence.best varchar(50) not null,
	pubmedid integer not null,
	primary key (id)
) engine = innodb;

load data local infile 'data/swapp.txt'
into table swapp
ignore 1 lines
(gene, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid);

# STOPGAP Best LD
drop table if exists swapp.bestld;

create table swapp.bestld (
	id integer not null auto_increment,
	gene varchar(50) not null,
	snp.ld varchar(50) not null,
	msh varchar(250) not null,
	pvalue double not null,
	gene.score integer not null,
	gene.rank.min integer not null,
	evidence varchar(50) not null,
    gene.best varchar(50) not null,
    evidence.best varchar(50) not null,
	pubmedid integer not null,
	primary key (id)
) engine = innodb;

load data local infile 'data/swapp.bestld.txt'
into table swapp.bestld
ignore 1 lines
(gene, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid);

# STOPGAP gene MeSH
drop table if exists swapp.gene.mesh;

create table swapp.gene.mesh (
	id integer not null auto_increment,
	gene varchar(50) not null,
	snp.ld varchar(50) not null,
	msh varchar(250) not null,
	pvalue double not null,
	gene.score integer not null,
	gene.rank.min integer not null,
	evidence varchar(50) not null,
    gene.best varchar(50) not null,
    evidence.best varchar(50) not null,
	pubmedid integer not null,
	primary key (id)
) engine = innodb;

load data local infile 'data/swapp.gene.mesh.txt'
into table swapp.gene.mesh
ignore 1 lines
(gene, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid);
