use sucos;

insert into tbProduto (PRODUTO,
                       NOME,
                       EMBALAGEM,
                       TAMANHO,
                       SABOR,
                       PRECO_LISTA)
values (1, 'Suco de Laranja', 'Caixa', '1L', 'Laranja', 2.50);

insert into tbVendedores (MATRICULA, NOME, PERCENTUAL_COMISSAO)
VALUES
    ('00235', 'Máricio Almeira Silva', 0.8),
    ('00236', 'Cláudia Morais', 0.8);



select * from tbVendedores;
delete from tbVendedores where MATRICULA = '00233';

-- Cláudia Morais (00236) recebeu aumento e sua comissão passou a ser de 11%.
UPDATE tbVendedores SET PERCENTUAL_COMISSAO = 0.11 WHERE MATRICULA = '00236';
SELECT * FROM tbVendedores;

SELECT NOME FROM tbVendedores;

UPDATE tbVendedores SET NOME = 'José Geraldo da Fonseca Junior' WHERE MATRICULA = '00233';


DELETE FROM tbProduto WHERE PRODUTO = 1;
SELECT * FROM tbProduto;

DELETE FROM tbVendedores WHERE MATRICULA = '00233';
SELECT * FROM tbVendedores;

INSERT INTO tbVendedores (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES ('0404', 'Marcos Vinício Fernandes', 0.15);
