create database Clinica;
use Clinica;

create Table medico (
    codm int auto_increment primary key,
    nomem varchar(50),
    especialidade varchar(30),
    sexo char(1),
    dt_nasc date
);

create table paciente (
    codp int auto_increment primary key,
    nomep varchar(50),
    dt_nasc date,
    problema varchar(50),
    sexo char(1)
);



create table consulta (
    codc int auto_increment primary key,
    codm int,
    codp int,
    dt_consulta date,
    hora time,
    valor_consulta Numeric(9,2 ),
    foreign key (codm)
        references medico (codm),
    foreign key (codp)
        references paciente (codp)
);


insert into medico( nomem, especialidade, sexo, dt_nasc) values

('Claudia Avila', 'Ginecologista', 'F','1960-08-10'),
('Claudio Felix', 'Oftalmologista', 'M', '1970-01-02'),
('Luciano Fernandes', 'Ginecologista', 'M', '1980-03-04'),
('Manoel Jose', 'Cardiologista', 'M', '1964-11-15'),
('Marcos Paulo', 'Neurologista', 'M', '1975-07-12'),
('Maria Jose', 'Cardiologista', 'F', '1974-12-13'),
('Roberto Carlos', 'Neuropediatra', 'M', '1977-06-05');


insert into paciente ( nomep, dt_nasc, problema, sexo) values
('Maria Paula', '1960-08-19','Cardiaco', 'F'),
('Maria do Carmo', '1979-03-10','Hipertensao', 'F'),
('Luiz Inacio', '1950-01-12', 'Diabetes', 'M'),
('Carolina Freitas', '1985-11-05','Miopia', 'F'),
('Luiz Marcelo', '1973-05-15', 'Cardiaco', 'M'),
('Luciano Fernandes', '1980-03-04','Cardiaco', 'M');


insert into consulta (codm,codp,dt_consulta,hora,valor_consulta) values
(1, 2, '2017-06-10', '16:00:00', 150.00),
(3, 1, '2017-06-15', '14:00:00', 180.00),
(3, 2, '2017-06-22', '14:00:00', 150.00),
(1, 1, '2017-06-25', '16:00:00', 150.00),
(4, 5, '2017-06-27', '15:00:00', 130.00),
(2,4, '2017-07-10', '13:00:00', 180.00),
(1, 2, '2017-07-12', '15:00:00', 180.00),
(4, 5, '2017-07-14', '14:00:00', 150.00),
(5, 3, '2017-07-17', '16:30:00', 130.00),
(5, 2, '2017-07-20', '15:00:00', 180.00),
(6, 4, '2017-07-23', '14:00:00', 150.00),
(6, 6, '2017-07-25', '15:00:00', 140.00),
(3, 2, '2017-08-22', '13:00:00', 180.00),
(1, 1, '2017-08-25', '13:00:00', 180.00),
(4,5,'2018-01-22','13:00:00',250.00),
(5,3,'2018-01-25','13:00:00',230.00),
(6, 4, '2019-06-22', '13:00:00', 300.00),
(1, 2, '2019-06-25', '13:00:00', 300.00);


Select *
from information_schema.user_privileges;

Select * from information_schema.user_privileges Where grantee like '%MARCOSVF%';
Select * from information_schema.user_privileges Where grantee like '%ADM%';
Select * from information_schema.user_privileges Where grantee like '%EST%';

-- CONCEDER PERMISSÃO AO USUÁRIO CRIADO
grant SELECT, INSERT, DELETE ON Clinica.medico TO 'marcosvf'@'localhost';

-- EXIBIR PERMISSÕES CONSEDIDAS AO USUÁRIO
show grants for 'marcosvf'@'localhost';

-- REVOGAR TODAS AS PERMISSÕES CONCEDIDAS AO USUÁRIO
revoke all privileges, grant option from 'marcosvf'@'localhost';

-- REVOGAR PERMISSÃO DE INSERT E DELETE CONCEDIDAS AO USUÁRIO
revoke insert, delete on Clinica.medico from 'marcosvf'@'localhost';

-- EXIBIR PERMISSÕES CONSEDIDAS AO USUÁRIO
show grants for 'marcosvf'@'localhost';

-- CRIAR UM NOVO USUÁRIO
create user 'adm_clinica'@'localhost' identified by '12345';
create user 'est_clinica'@'localhost' identified by '12345';

-- CONCEDER PERMISSÃO TOTAL AO USUÁRIO ADM_CLINICA COM POSSIBILIDADE DE REPASSE DE PRIVILÉGIOS
grant all privileges on Clinica.* to 'adm_clinica'@'localhost' with grant option;
-- grant all privileges on Clinica.* to 'adm_clinica'@'localhost';

SHOW GRANTS FOR 'adm_clinica'@'localhost';

-- Através do usuario adm_clinica, conceda privilegio de leitura nas tabelas do banco de dados clinica para o usuario est_clinica.
grant select on Clinica.* to 'est_clinica'@'localhost';
SHOW GRANTS FOR 'est_clinica'@'localhost';

-- Conceda privilégios para criação de procedimentos para o usuário est_clinica
grant create routine on Clinica.* to 'est_clinica'@'localhost';

-- Utilizando o usuario est_clinica, crie um procedimento para inserir dados na tabela medico
create procedure Clinica.insere_medico (in nomem varchar(50), in especialidade varchar(50), in sexo char(1), in dt_nasc date)
begin
    insert into Clinica.medico (nomem, especialidade, sexo, dt_nasc) values (nomem, especialidade, sexo, dt_nasc);
end;

-- Conceda privilégio de insert na tabela médico para o usuário est_clinica
grant insert on Clinica.medico to 'est_clinica'@'localhost';
show grants for 'est_clinica'@'localhost';
-- Conceda privilégios para execução de procedimentos para o usuário est_clinica

grant select on Clinica.medico to 'marcosvf'@'localhost';

create user 'marcosvf'@'localhost' identified by '12345';

-- Backup
SELECT m.nomem, p.nomep, c.dt_consulta, c.hora
INTO OUTFILE '/F:\_IFTM\3_Periodo\BD_AVANCADO\relatorio.csv'
FIELDS TERMINATED BY ':'
LINES TERMINATED BY '\n'
FROM medico m, paciente p, consulta c
WHERE m.codm = c.codm AND p.codp = c.codp;

-- Como gerar um consulta com nome medico, nome paciente, data e hora da consulta
SELECT m.nomem, p.nomep, c.dt_consulta, c.hora

