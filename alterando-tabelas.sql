USE sucos;

ALTER TABLE tbProduto ADD PRIMARY KEY (PRODUTO);

SELECT * FROM tbProduto;
DELETE FROM tbProduto WHERE PRODUTO = '544931';
update tbProduto set SABOR = 'Uva' where PRODUTO = '544931';

INSERT INTO tbProduto VALUES ('544931', 'Suco de Uva', 'Lata', '1L', 'Uva', 3.50);