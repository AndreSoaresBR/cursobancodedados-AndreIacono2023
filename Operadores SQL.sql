-- ;       : para encerrar o operador
-- USE xxx : seleciona o banco de dados
use sakila;

-- SELECT * FROM xxx : seleciona a tabela com todas as colunas
use sakila;
select * from actor;

-- SELECT xxx FROM xxx : seleciona a coluna da tabela
use sakila;
select actor_id from actor;

-- Limitando uma informação da tabela
use sakila;
select * from actor limit 5, 10 -- limit : ignora ate a informação "5" e mostrarar as proximas "10"

-- Modificando uma coluna mostrando desconto
use sakila;
select customar_id, amount, amount - (amount * 0.10) from payment -- xxx - (xxx * desconto) : aparecera uma nova coluna com o desconto

use sakila;
select customar_id, amount, amount - (amount * 0.10) as discount from payment -- as : mudara o nome da nova coluna

use sakila;
select customar_id, amount, amount - (amount * 0.10) as '10% discount' from payment -- as '10% xxx' : mudara o nome da nova coluna com numero

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
where store_id = 1 and active = 0      -- and     : "e" busca informações de mais uma coluna
where staff_id = 1 or amount = 0.99    -- or      : "ou" busca informações de mais uma coluna
where not staff_id = 1                 -- not     : "negando" uma coluna
where district in ('Alberta', 'Texas') -- in      : "e" busca informações de dentro da coluna
where amount between 1.99 and 3.99     -- between : entre um valor e outro
where first_name like 'A%'             -- like    : "inicia%" busca dentro da coluna o dado que inicia ex: Andre
where first_name like 'AL%'            -- like    : "inicia%" busca dentro da coluna o dado que inicia ex: Alberto
where first_name like '%N'             -- like    : "%termina" busca dentro da coluna o dado que termina ex: Alyson
where adrdress2 is null                -- is null : selecina os dados da coluna que não tem informação
where first_name regexp 'a'            -- regexp  : procura todos os dados com a letra "a"
where first_name regexp '^a'           -- regexp  : procura todos os dados que inicia com a letra "a"
where first_name regexp '^a|b'         -- regexp  : procura todos os dados que inicia com a letra "a" e dados com a letra "b"
where first_name regexp '^a|^b'        -- regexp  : procura todos os dados que inicia com a letra "a" e inica com a letra "b"
where first_name regexp '[bcd]a'       -- regexp  : procura todos os dados com a letra "ba", "ca" e "da"
where first_name regexp '^[bcd]a'      -- regexp  : procura todos os dados que inicia com a letra "ba", "ca" e "da"
