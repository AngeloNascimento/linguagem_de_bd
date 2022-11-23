create database sucos_vendas;

select * from tabela_de_produtos where sabor = 'manga' and not(tamanho = '470ml');

select * from tabela_de_produtos where sabor = 'Manga' or sabor = 'sabor';

select * from tabela_de_produtos where sabor in ('manga','laranja');

select * from tabela_de_clientes where cidade in ('rio de janeiro','são paulo') and idade >= 20;

select distinct embalagem, tamanho from tabela_de_produtos;

select distinct embalagem, tamanho from tabela_de_produtos where sabor = 'laranja';

select distinct embalagem, tamanho, sabor from tabela_de_produtos; 

select * from tabela_de_clientes where cpf limit 2,3;

select * from notas_fiscais where DATA_VENDA = '2017/01/01' limit 10;

select * from tabela_de_clientes order by nome;/*organiza em ordem crescente*/

select * from tabela_de_clientes order by nome desc;/*desc organiza em ordem decrescente*/

select * from tabela_de_produtos order by EMBALAGEM, NOME_DO_PRODUTO;

select * from tabela_de_clientes;

select estado, LIMITE_DE_CREDITO from tabela_de_clientes;

select estado, sum(LIMITE_DE_CREDITO) FROM tabela_de_clientes group by estado;

select embalagem, count(*) as contador from tabela_de_produtos group by embalagem;


select ESTADO, sum(LIMITE_DE_CREDITO) as soma_limite from tabela_de_clientes group by estado;/*sum = soma dos valores*/

select estado, sum(LIMITE_DE_CREDITO) as SOMA_LIMITE from tabela_de_clientes group by estado having sum(LIMITE_DE_CREDITO) > 900000;

select embalagem, max(preco_de_lista) as maior_preco, min(preco_de_lista) as menor_preco from tabela_de_produtos group by embalagem;/*min = minimo, max = maximu*/

select embalagem, max(preco_de_lista) as maior_preco, min(preco_de_lista) as menor_preco from tabela_de_produtos group by EMBALAGEM having sum(PRECO_DE_LISTA)<=80;/*as "dar uma apelido" para a consulta*/

select embelagem, max(preco_de_lista) as maior_preco, min(preco_de_lista) as menor_preco from tabela_de_produtos group by EMBALAGEM having sum(PRECO_DE_LISTA)<=80 and max(PRECO_DE_LISTA) >=5;

select * from tabela_de_produtos;

/*uso do case*/
select nome_do_produto, preco_de_lista, 
case 
	when preco_de_lista >= 12 then 'produto caro' 
	when preco_de_lista >= 7 and preco_de_lista < 12 then 'produto em conta'
	else 'produto barato'
	end as status_preco
from tabela_de_produtos;

/*junção de tabelas*/
select * from tabela_de_vendedores;
select * from notas_fiscais;  

select * from tabela_de_vendedores A
inner join notas_fiscais B/*inner join junta as tabelas*/
on A.MATRICULA = B.MATRICULA;/*compara os valores*/

select A.MATRICULA, A.nome, count(*) from 
tabela_de_vendedores A
inner join notas_fiscais B
on A.MATRICULA = B.matricula
group by A.MATRICULA, A.nome;/*group by agrupa os elementos*/

select count(*) from tabela_de_clientes;
select c.cpf, c.nome, nf.cpf from tabela_de_clientes c inner join notas_fiscais nf on c.cpf = nf.cpf group by c.cpf;

select distinct a.cpf, a.nome, b.cpf from tabela_de_clientes a left join notas_fiscais b on a.cpf = b.cpf;/*left join compara a tabela da esquerda com a da direita*/

/*Funções sql*/
select ltrim('      olá') as resultado/*ltrim remove todo espaço da esquerda*/;
select rtrim('olá     ') as resultado/*rtrim remove todo espaço da direita*/;
select trim('  olá  ') as resultado/*trim remove os espaços dos dois lados*/;
select concat('olá',' ','tudo bem?')/*concat junta concatena as palavras*/;
select lower('OLA, BOM DIA!')/*lower converte tudo em minuscula*/;
select lcase('OLA, BOM DIA!')/*lcase converte tudo em minuscula*/;
select upper('ola, bom dia!')/*upper converte tudo em maiuscula*/;
select ucase('ola, bom dia!')/*ucase converte tudo em maiuscula*/;
select substring('ola, tudo bem com vocÊs?', 5) as resultado;
select substring('ola, tudo bem com vocÊs?', 5,6) as resultado;

select concat(nome, ' (',cpf,')') as resultado from tabela_de_clientes;/*concatena as informações*/

select concat(nome, ' = ', endereco_1,', ', bairro,', ', cidade, '-',estado) as resultado from tabela_de_clientes; 

select curdate();/*exibe a data atual*/
select current_time();/*exibe a hora atual*/
select current_timestamp();/*exibe a data e a hora atual*/
select monthname(current_timestamp);/*exibe o nome do mes atual*/
select datediff(current_timestamp, '1999-06-11');/*exibe a diferença da data atual com a data anterior*/

select distinct data_venda, dayname(data_venda) as dia, monthname(data_venda) as mês, year(data_venda) as ano from notas_fiscais;

select nome, timestampdiff(year, data_de_nascimento, curdate()) as resultado from tabela_de_clientes;

/*transaction*/
start transaction;/*sem start transaction as alterações feitas no banco nao surtirão efeito*/
select * from tabela_de_vendedores;
update tabela_de_vendedores set percentual_comissao = percentual_comissao * 1.15;
rollback;/*retorna ao estado anterior*/

/*auto_increment*/

/*create table tab_indentity (ID INT auto_increment, DESCRITOR varchar(20), primary key(ID));

/*insert*/

insert into tab_indentity (descritor) values ('cliente1');
insert into tab_indentity (descritor) values ('cliente2');
insert into tab_indentity (descritor) values ('cliente3');
insert into tab_indentity (id, descritor) values (null, 'cliente4');/*auto increment nao aceita valores null*/
insert into tab_indentity (id, descritor) values (null, 'cliente5');
insert into tab_indentity (id, descritor) values (100, 'cliente6');
insert into tab_indentity (id, descritor) values (null, 'cliente7');
insert into tab_indentity (id, descritor) values (2, 'cliente8');
insert into tab_indentity (id, descritor) values (null, 'cliente9');

/*delete*/
delete from tab_indentity where id = 2;
delete from tab_indentity where id = 5;
delete from tab_indentity where id = 101;


select * from tab_indentity;


/*trigger*/
create table faturamento(data_venta date null, total_venda float);
alter table faturamento
rename column data_venta to data_venda;

select * from faturamento;

delete FROM notas_fiscais;
delete from itens_notas_fiscais;

insert into notas_fiscais(CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO) values ('19290992743', '00238', '2002-11-22', '0101', 0.10);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0101", "1000889", "10", 5);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0101", "1002334", "300", 15);

insert into notas_fiscais(CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO) values ('19290992743', '00238', '2002-11-22', '0102', 0.10);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0102", "1000889", "10", 5);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0102", "1002334", "300", 15);

insert into notas_fiscais(CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO) values ('19290992743', '00238', '2002-11-22', '0103', 0.10);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0103", "1000889", "10", 5);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0103", "1002334", "300", 15);

insert into notas_fiscais(CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO) values ('19290992743', '00238', '2002-11-22', '0104', 0.10);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0104", "1000889", "10", 5);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0104", "1002334", "300", 15);

insert into notas_fiscais(CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO) values ('19290992743', '00238', '2002-11-22', '0105', 0.10);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0105", "1000889", "10", 5);
insert into itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO) values ("0105", "1002334", "300", 15);

select * from notas_fiscais A inner join itens_notas_fiscais B on A.numero = B.numero ;

insert into faturamento
select A.data_venda, sum(B.quantidade * B.PRECO) AS TOTAL_VENDA FROM notas_fiscais A inner join itens_notas_fiscais B on A.NUMERO = B.NUMERO GROUP BY A.DATA_VENDA;

/*insert*/
Delimiter // 
create trigger tg_calcula_faturamento_insert after insert on itens_notas_fiscais for each row begin

delete from faturamento;
insert into faturamento
select A.data_venda, sum(B.quantidade * B.PRECO) AS TOTAL_VENDA FROM notas_fiscais A inner join itens_notas_fiscais B on A.NUMERO = B.NUMERO GROUP BY A.DATA_VENDA;
 

end //  /*delimter delimita onde começa e onde termina a operção*/

/*update*/
Delimiter // 
create trigger tg_calcula_faturamento_update after update on itens_notas_fiscais for each row begin

delete from faturamento;
insert into faturamento
select A.data_venda, sum(B.quantidade * B.PRECO) AS TOTAL_VENDA FROM notas_fiscais A inner join itens_notas_fiscais B on A.NUMERO = B.NUMERO GROUP BY A.DATA_VENDA;
 

end //  /*delimter delimita onde começa e onde termina a operção*/

/*delete*/
Delimiter // 
create trigger tg_calcula_faturamento_delete after delete on itens_notas_fiscais for each row begin

delete from faturamento;
insert into faturamento
select A.data_venda, sum(B.quantidade * B.PRECO) AS TOTAL_VENDA FROM notas_fiscais A inner join itens_notas_fiscais B on A.NUMERO = B.NUMERO GROUP BY A.DATA_VENDA;
 

end //  /*delimter delimita onde começa e onde termina a operção*/


update itens_notas_fiscais set quantidade = 30 where numero = '0105' and codigo_do_produto = '1002334';

delete from itens_notas_fiscais where numero = '0105' and codigo_do_produto = '1002334';


select * from itens_notas_fiscais
