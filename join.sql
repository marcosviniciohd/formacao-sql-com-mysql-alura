select * from notas_fiscais;
select * from tabela_de_vendedores;

select * from notas_fiscais nf
inner join tabela_de_vendedores tv on nf.MATRICULA = tv.MATRICULA;

select A.matricula, A.nome, count(*) from tabela_de_vendedores A inner join notas_fiscais B
on A.matricula = B.matricula
group by A.matricula, A.nome;

-- Outra forma de fazer o mesmo select, mais antiga.
select A.matricula, A.nome, count(*) from tabela_de_vendedores A, notas_fiscais B
where A.matricula = B.matricula
group by A.matricula, A.nome;

SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

-- left join
select count(*) from tabela_de_clientes;
select CPF, count(*) from notas_fiscais group by CPF;
select distinct A.CPF, A.NOME, B.CPF from tabela_de_clientes A left join notas_fiscais B on A.CPF = B.CPF where B.CPF is null;
select distinct A.CPF, A.NOME, B.CPF from tabela_de_clientes A left join notas_fiscais B on A.CPF = B.CPF where B.CPF is null and year(B.DATA_VENDA) = 2018;

SELECT * FROM tabela_de_vendedores INNER JOIN  tabela_de_clientes ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
SELECT * FROM tabela_de_vendedores INNER JOIN  tabela_de_clientes ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT tabela_de_vendedores.bairro,
       tabela_de_vendedores.nome,
       tabela_de_clientes.bairro,
       tabela_de_clientes.nome
FROM tabela_de_vendedores INNER JOIN  tabela_de_clientes ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
