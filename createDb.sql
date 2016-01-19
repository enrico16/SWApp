drop database if exists swapp;
create database if not exists swapp;
use swapp;

# STOPGAP
drop table if exists swapp;

create table swapp (
	id integer not null auto_increment,
	gene varchar(50) not null,
	snp_ld varchar(50) not null,
	msh varchar(250) not null,
	pvalue double not null,
	gene_score integer not null,
	gene_rank_min integer not null,
	evidence varchar(50) not null,
    gene_best varchar(50) not null,
    evidence_best varchar(50) not null,
	pubmedid integer not null,
	primary key (id)
) engine = innodb;

load data local infile 'data/swapp.txt'
into table swapp
ignore 1 lines
(gene, snp_ld, msh, pvalue, gene_score, gene_rank_min, evidence, gene_best, evidence_best, pubmedid);

# STOPGAP Best LD
drop table if exists swapp.bestld;

create table swapp.bestld (
	id integer not null auto_increment,
	gene varchar(50) not null,
	snp_ld varchar(50) not null,
	msh varchar(250) not null,
	pvalue double not null,
	gene_score integer not null,
	gene_rank_min integer not null,
	evidence varchar(50) not null,
    gene_best varchar(50) not null,
    evidence_best varchar(50) not null,
	pubmedid integer not null,
	primary key (id)
) engine = innodb;

load data local infile 'data/swapp.bestld.txt'
into table swapp.bestld
ignore 1 lines
(gene, snp_ld, msh, pvalue, gene_score, gene_rank_min, evidence, gene_best, evidence_best, pubmedid);

# STOPGAP gene MeSH
drop table if exists swapp.gene_mesh;

create table swapp.gene_mesh (
	id integer not null auto_increment,
	gene varchar(50) not null,
	snp_ld varchar(50) not null,
	msh varchar(250) not null,
	pvalue double not null,
	gene_score integer not null,
	gene_rank_min integer not null,
	evidence varchar(50) not null,
    gene_best varchar(50) not null,
    evidence_best varchar(50) not null,
	pubmedid integer not null,
	primary key (id)
) engine = innodb;

load data local infile 'data/swapp.gene.mesh.txt'
into table swapp.gene_mesh
ignore 1 lines
(gene, snp_ld, msh, pvalue, gene_score, gene_rank_min, evidence, gene_best, evidence_best, pubmedid);
