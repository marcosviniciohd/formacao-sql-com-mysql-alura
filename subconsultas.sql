select distinct bairro from tabela_de_vendedores;

SELECT * FROM tabela_de_clientes WHERE bairro IN ('TIJUCA', 'JARDINS', 'COPACABANA', 'SANTO AMARO');

SELECT * FROM tabela_de_clientes WHERE bairro  IN (select distinct bairro from tabela_de_vendedores);

