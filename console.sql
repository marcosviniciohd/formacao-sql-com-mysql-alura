CREATE DATABASE sucos;
use sucos;
drop database sucos;
create database sucos;
use sucos;


create table tbCliente(
    CPF varchar(11),
    NOME varchar(100),
    ENDERECO1 varchar(150),
    ENDERECO2 varchar(150),
    BAIRRO varchar(100),
    CIDADE varchar(100),
    ESTADO varchar(50),
    CEP varchar(8),
    IDADE SMALLINT,
    SEXO varchar(1),
    LIMITECREDITO FLOAT,
    VOLUME_COMPRA FLOAT,
    PRIMEIRA_COMPRA BIT(1));

create table TABELA_DE_VENDEDORES (
    MATRICULA VARCHAR(5),
    NOME VARCHAR(100),
    PERCENTUAL_COMISSAO FLOAT
);

CREATE TABLE tbProduto (
    PRODUTO VARCHAR(20),
    NOME VARCHAR(150),
    EMBALAGEM VARCHAR(50),
    TAMANHO VARCHAR(50),
    SABOR VARCHAR(50),
    PRECO_LISTA FLOAT
);