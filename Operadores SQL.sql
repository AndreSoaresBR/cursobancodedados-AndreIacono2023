-- ;       : para encerrar o operador
-- USE xxx : seleciona o banco de dados
use sakila;

-- SELECET * FROM xxx : seleciona a tabela com todas as colunas
use sakila;
select * from actor;

-- SELECT xxx FROM xxx : seleciona a coluna da tabela
use sakila;
select actor_id from actor;

-- ORDER BY xxx : organiza por ordem alfabetica a coluna selecionada
use sakila;
select actor_id, first_name, last_name from actor
order by first_name;

-- Variações de ORDER BY
order by amount desc -- ordem decrescente
order by amount asc  -- ordem crescente

-- WHERE xxx = xxx : seleciona o registro especifico
use sakila;
select actor_id, first_name, last_name from actor
where actor_id = 100

-- Variações de WHERE
where actor_id < 10    -- seleciona abaixo
where actor_id > 10    -- seleciona acima
where actor_id < = 10  -- seleciona abaixo e igual
where actor_id > = 10  -- seleciona acima e igual
where amount != 0.99   -- não igual
where amount <> 0.99   -- não igual

-- Modificando uma coluna mostrando desconto
use sakila;
select customar_id, amount, amount - (amount * 0.10) from payment -- xxx - (xxx * desconto) : aparecera uma nova coluna com o desconto

use sakila;
select customar_id, amount, amount - (amount * 0.10) as discount from payment -- as : mudara o nome da nova coluna

use sakila;
select customar_id, amount, amount - (amount * 0.10) as '10% discount' from payment -- as '10% xxx' : mudara o nome da nova coluna com numero
