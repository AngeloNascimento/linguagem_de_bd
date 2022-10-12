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
