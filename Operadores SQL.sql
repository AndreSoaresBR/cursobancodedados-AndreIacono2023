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

-- Join
use sakila;
select * from customer join payment          -- join : seleciona todas as informações de duas tabelas
on customer.customer_id = payment.payment_id -- on   : sincroniza as informações das tabelas

use sakila;
select customer.customer_id,
       customer.first_name, 
       customer.last_name,
       address,
       payment.rental_id,
       payment.amount                       -- selecionando as informações que irão aparecer
from customer 
join payment on customer.customer_id = payment.payment_id -- sincronizando as informações das tabelas
join address on customer.customer_id = address_id         -- adicionando mais uma tabela

-- Alia : abreviação do nome da coluna
use sakila;
select cus.customer_id,
       cus.first_name, 
       cus.last_name,
       adr.address,
       pay.rental_id,
       pay.amount
from customer cus
join payment pay on cus.customer_id = pay.payment_id
join address adr on cus.customer_id = adr.address_id
-- "cus", "pay" , "adr" abreviação ser colocado apos o nome da coluna

-- Adicionando uma linha a tabela
-- Coluna language possui (language_id, name, last_update)
use sakila;
insert into language
values (default, 'Portuguese', '2023-10-18 20:39:00')
-- Seleciono a coluna, depois adiciono as informações, "default" ira manter a sequencia da coluna.

-- Adicionando uma linha em multiplas tabelas
-- Coluna city (city_id, city, country_id, last_update)
-- Coluna country (country_id, country, last_update)
use sakila;
insert into country
values
	(default, 'Brasil2' , '2023-10-18 20:48:00');
insert into city
values
	(default, 'Sao Jose', last_insert_id(), '2023-10-18 20:48:00')
-- Brasil2 foi adicionado com country_id 110
-- Sao Jose foi adicionado com city_id 601 onde "last_insert_id()" foi o ultimo country_id adicionado, no caso Brasil2
-- no lugar de "last_insert_id()" posso colocar no numero do country_id que desejar, ex: 110

-- Copiando uma tabela completa
use sakila;
create table payment_backup as -- criando o nome da nova tabela
select * from payment

-- Removendo uma tabela
Clico com o botao direito na tabela, seleciono 'Truncate table' para remover as informações da tabela
Clico com o botao direito na tabela, seleciono 'Drop table' para remover a tabela completa

-- Atualizando a informação da tabela
use sakila;
update payment
set amount = 15.99
where payment_id = 1
-- seleciono a tabela, depois a coluna "=" nova informação, depois escolho o registro especifico

-- Deletando um registro
use sakila;
delete from payment
where payment_id = 1001

-- SQL Funções
-- AVG()   : verificar qual o valor medio
-- COUNT() : verificar quantas vendas feitas
-- FIRST() : verificar qual o primeiro valor
-- LAST()  : verificar qual o ultimo valor
-- MAX()   : verificar qual o valor mais alto
-- MIN()   : verificar qual o valor mais baixo
-- SUM()   : verificar qual a soma dos valores
-- USING() : seleciona coluna como referencia

use sakila;
select 
	max(amount) as Maior,
    min(amount) as Menor,
    avg(amount) as 'Media de valores',
    sum(amount) as 'Total de vendas',
    count(amount) as 'Numeros de vendas'
from payment
-- praticamente foi feito um resumo da tabela

use sakila;
select customer_id,
	sum(amount) as total
from payment
group by customer_id
-- selecionado o total de vendas
-- selecionado por grupo

use sakila;
select 
	cus.customer_id as ID,
	cus.first_name as Nome,
	cus.last_name as Sobrenome,
	sum(amount) as Total,
    count(amount) as Compras
from payment pay
join customer cus using(customer_id)
group by customer_id
having Total >= 150 and Compras >= 40
order by Total desc
-- adicionado mais colunas
-- adicionado as : apelido
-- selecionando o total de vendas
-- selecionando o total de compras
-- tabela de pagamento
-- adicionando tabela 'customer'
-- usando 'customer_id' como referencia
-- selecionado por grupo
-- feito filtro por valor e compras
-- selecionado por ordem descrecente

-- Criando uma subquery
use sakila;
select * from payment
where amount > 
(
    select AVG (amount) from payment
)
-- selecionado o 'amount' e foi pedido para mostrar todos os pagamentos maiores '>' que o valor medio 'AVG'

use sakila;
select max(amount) from payment
where customer_id = 1
-- selecionado o 'customer_id = 1' e foi pedido para mostrar o maior valor de compra dele 'max(amount)'

use sakila;
select * from payment
where amount =
(
	select max(amount) from payment
    where customer_id = 1
)
-- selecionado o 'amount' e foi pedido para mostrar todos os pagamentos iguais ao maior valor do 'customer_id = 1'

use sakila;
select * from customer
where customer_id in
(
    select customer_id from payment
    group by customer_id
    having count(*) > 35
)
-- selecionado o 'customer' e foi pedido para mostrar o'customer_id' de acordo com a tabela 'payment'
-- selecionado o 'customer_id' e foi pedido para mostrar todas as compras feitas
-- foi filtrado as comprar maiores que 35

--Views - criando atalho para a query
use sakila;
create view vendas_por_cliente as
select 
	cus.customer_id, 
    cus.first_name, 
    cus.last_name,
    pay.amount
from customer cus
join payment pay
on cus.customer_id = pay.payment_id
-- esse seria o codigo completo

SELECT * FROM sakila.vendas_por_cliente
-- criando a view, todo aquele codigo se resume a este

SELECT * FROM sakila.vendas_por_cliente
where amount >= 9.99
-- em poucas linhas você pesquisa na view criada

use sakila;
create or replace view vendas_por_cliente as
select 
	cus.customer_id, 
    cus.first_name, 
    cus.last_name,
    pay.amount
from customer cus
join payment pay
on cus.customer_id = pay.payment_id
order by pay.amount desc 
-- 'create or replace view' serve para atualizar uma view ja criada
-- adicionado 'order by'

-- Database
create database mapa_mundo; -- cria uma query
drop database mapa_mundo;   -- deleta uma query

use mapa_mundo;
create table continentes
(id int not null auto_increment,
 continente varchar(200) not null,
 primary key (id)
);
alter table continentes add 'xxx' varchar (200) not null -- adicionando mais coluna

insert into continentes (continente)
values
('America'), ('Africa'), ('Asia'),('Europa'), ('Oceania'),('Antartida');
-- inserindo valores na coluna

create table paises 
(id int not null auto_increment,
 pais varchar(200) not null,
 sigla varchar(200) not null,
 continente_id int not null,
 primary key (id),
 foreign key (continente_id) references continentes(id)
);
-- usando 'continente_id' e referenciando na tabela 'continentes(id)'

insert into paises (pais, sigla, continente_id)
values
('Brasil', 'BRA', '1'),
('Argentina', 'ARG', '1'),
('Alemanha', 'DEU', '4'),
('Portugal', 'PRT', '4');

create table estados
(id int not null auto_increment,
 estado varchar(200) not null,
 sigla varchar(200) not null,
 capital varchar(200) not null,
 pais_id int not null,
 primary key (id),
 foreign key (pais_id) references paises(id)
 );
 
insert into estados (estado, sigla, capital, pais_id)
values
('Santa Catarina', 'SC', 'Florianopolis', '1'),
('Rio Grande do Sul', 'RS', 'Porto Alegre', '1'),
('Buenos Aries', 'BA', 'La Plata', '2'),
('La Pampa', 'AR-L', 'Santa Rosa', '2'),
('Berlim', 'BE', 'Barlim', '3'),
('Brandenburg', 'BB', 'Potsdam', '3'),
('Aveiro', 'x', 'Aveiro', '4'),
('Faro', 'x', 'Faro', '4');

-- RENAME TABLE xxx TO xxx; -- para renomar uma tabela
-- ALTER TABLE xxx CHANGE xxx xxx VARCHAR(200); -- selecione a tabela, depois a coluna atual e depois a nova coluna