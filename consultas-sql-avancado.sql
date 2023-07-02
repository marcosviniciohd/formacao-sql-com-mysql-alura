use sucos_vendas;
select * from tabela_de_produtos;

select EMBALAGEM, TAMANHO from tabela_de_produtos;

-- clausula distinct
select distinct EMBALAGEM, TAMANHO from tabela_de_produtos;
select distinct EMBALAGEM, TAMANHO from tabela_de_produtos order by TAMANHO;
select distinct EMBALAGEM, TAMANHO from tabela_de_produtos order by TAMANHO desc;
select distinct NOME_DO_PRODUTO, EMBALAGEM, TAMANHO from tabela_de_produtos where SABOR = 'LARANJA' order by TAMANHO;

-- clausula limit
select * from tabela_de_produtos limit 5;
select * from tabela_de_produtos limit 5 offset 5;
select NOME_DO_PRODUTO, EMBALAGEM, TAMANHO from tabela_de_produtos where SABOR = 'LARANJA' order by TAMANHO limit 5;

 -- order by
select NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, PRECO_DE_LISTA from tabela_de_produtos order by PRECO_DE_LISTA desc;
select * from tabela_de_produtos order by NOME_DO_PRODUTO;
select * from tabela_de_produtos order by NOME_DO_PRODUTO desc;

-- SUM, AVG, MIN, MAX, COUNT
select ESTADO, LIMITE_DE_CREDITO from tabela_de_clientes;
select ESTADO, SUM(LIMITE_DE_CREDITO) from tabela_de_clientes group by ESTADO;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) FROM tabela_de_produtos GROUP BY EMBALAGEM;
SELECT EMBALAGEM, COUNT(*) AS CONTADOR FROM tabela_de_produtos GROUP BY EMBALAGEM;
SELECT NOME_DO_PRODUTO, COUNT(*) AS NOME FROM tabela_de_produtos GROUP BY NOME_DO_PRODUTO;

SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;

SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
GROUP BY ESTADO, BAIRRO;

SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
WHERE CIDADE = 'Rio de Janeiro'
GROUP BY ESTADO, BAIRRO
ORDER BY BAIRRO;









select  NOME_DO_PRODUTO, PRECO_DE_LISTA,
        case
            when PRECO_DE_LISTA >= 12 then 'PRODUTO CARO'
            when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 then 'PRODUTO EM CONTA'
            else 'PRODUTO BARATO'
            end as STATUS_PRECO
from tabela_de_produtos;


select EMBALAGEM,
        case
            when PRECO_DE_LISTA >= 12 then 'PRODUTO CARO'
            when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 then 'PRODUTO EM CONTA'
            else 'PRODUTO BARATO'
            end as STATUS_PRECO, avg(PRECO_DE_LISTA) as MEDIA_PRECO
from tabela_de_produtos
group by EMBALAGEM,
        case
            when PRECO_DE_LISTA >= 12 then 'PRODUTO CARO'
            when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 then 'PRODUTO EM CONTA'
            else 'PRODUTO BARATO'
            end;


select * from tabela_de_clientes;

-- classificando clientes por idade
select nome, DATA_DE_NASCIMENTO,
       case
           when DATA_DE_NASCIMENTO < '1990-01-01' then 'Cliente são velhos'
           when DATA_DE_NASCIMENTO >= '1990-01-01' and DATA_DE_NASCIMENTO <= '1995-12-31' then 'Clientes são jovens'
             else 'Clientes são crianças'
              end as STATUS_CLIENTE
from tabela_de_clientes
order by DATA_DE_NASCIMENTO;

-- outra forma de fazer
select nome,
       case when year(DATA_DE_NASCIMENTO) < 1990 then 'Cliente são velhos'
            when year(DATA_DE_NASCIMENTO) >= 1990 and year(DATA_DE_NASCIMENTO) <= 1995 then 'Clientes são jovens'
            else 'Clientes são crianças'
            end as "CLASSIFICAÇÃO POR IDADE"
from tabela_de_clientes
order by DATA_DE_NASCIMENTO;