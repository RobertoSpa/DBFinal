CREATE TABLE "endereco" (
  "end_cd_id" serial not null,
  "end_tx_rua" varchar(50)  not null,
  "end_tx_bairro" varchar(30) not null,
  "end_tx_cidade" varchar(30) not null,
  "end_tx_estado" varchar(2) not null,
  "end_int_cep" varchar(8) not null,
  PRIMARY KEY ("end_cd_id")
);

CREATE TABLE "cliente" (
  "cli_cd_id" serial not null,
  "cli_tx_nome" varchar(30) not null,
  "cli_int_telefone" int8 not null,
  "cli_tx_nome_usuario" varchar(30) not null,
  "cli_tx_email" varchar(30) not null,
  "cli_int_cpf" varchar(11) not null,
  "cli_dt_data_de_nascimento" date not null,
  "end_cd_id" int4 not null,
  PRIMARY KEY ("cli_cd_id"),
  CONSTRAINT "FK_cliente.end_cd_id"
    FOREIGN KEY ("end_cd_id")
      REFERENCES "endereco"("end_cd_id")
);

CREATE TABLE "categoria" (
  "cat_cd_id" serial not null,
  "cat_tx_nome" varchar(30) not null,
  "cat_tx_descricao" varchar(30) not null,
  PRIMARY KEY ("cat_cd_id")
);

CREATE TABLE "funcionario" (
  "func_cd_id" serial not null,
  "func_tx_nome" varchar(30) not null,
  "func_int_cpf" int8 not null,
  PRIMARY KEY ("func_cd_id")
);

CREATE TABLE "produto" (
  "prod_cd_id" serial not null,
  "prod_tx_descricao" varchar(30) not null,
  "prod_dt_data_fabricacao" date not null,
  "prod_tx_nome" varchar(30) not null,
  "prod_int_qtde_estoque" int4 not null,
  "prod_dec_valor_unitario" decimal not null,
  "cat_cd_id" int4 not null,
  "func_cd_id" int4 not null,
  PRIMARY KEY ("prod_cd_id"),
  CONSTRAINT "FK_produto.cat_cd_id"
    FOREIGN KEY ("cat_cd_id")
      REFERENCES "categoria"("cat_cd_id"),
  CONSTRAINT "FK_produto.func_cd_id"
    FOREIGN KEY ("func_cd_id")
      REFERENCES "funcionario"("func_cd_id")
);


CREATE TABLE "pedido" (
  "ped_cd_id" serial not null,
  "ped_dt_data_do_pedido" date not null,
  "cli_cd_id" int4 not null,
  PRIMARY KEY ("ped_cd_id"),
  CONSTRAINT "FK_pedido.cli_cd_id"
    FOREIGN KEY ("cli_cd_id")
      REFERENCES "cliente"("cli_cd_id")
);



CREATE TABLE "itemPedido" (
  "iped_int_qtd_produto" int4 not null,
  "ped_cd_id" int4 not null,
  "prod_cd_id" int4 not null,
  "prod_dec_valor_produto" decimal not null,
  PRIMARY KEY ("ped_cd_id", "prod_cd_id"),
  CONSTRAINT "FK_itemProduto.ped_cd_id"
    FOREIGN KEY ("ped_cd_id")
      REFERENCES "pedido"("ped_cd_id"),
  constraint "FK_itemProduto.prod_cd_id"
    FOREIGN KEY ("prod_cd_id")
      REFERENCES "produto"("prod_cd_id")
);


-- comando alter

ALTER TABLE cliente ALTER COLUMN cli_tx_email TYPE varchar(60);
ALTER TABLE categoria ALTER COLUMN cat_tx_descricao TYPE varchar(100);
ALTER TABLE produto ALTER COLUMN prod_tx_nome TYPE varchar(50);
ALTER TABLE produto ALTER COLUMN prod_tx_descricao TYPE varchar(300);


-- comando insert

insert into endereco (end_tx_rua, end_tx_bairro, end_tx_cidade, end_tx_estado, end_int_cep) 
values ('Rua Flavio Bortoluzi de Souza, 675','Alto','Teresópolis', 'RJ',25959139 ),	
	('Alameda do Lago, 951', 'Posse', 'Teresópolis', 'RJ', 25973480),  
	('Rua Gilberto Amado, 630','Carlos Guinle','Teresópolis', 'RJ',25958670 ),
	('Servidão Davi F. da Silva, 178','Meudon','Teresópolis', 'RJ',25954295), 
	('Rua Gilberto Amado, 189','Carlos Guinle','Teresópolis', 'RJ',25958670),
	('Rua Joana Rodrigues Adane, 849','Conselheiro Paulino','Nova Friburgo', 'RJ',25934530),
	('Rua Joaquim Sydney Soares, 444','Loteamento Nosso Sonho','Nova Friburgo', 'RJ',25923630),
	('Rua Marinus Eduardo de Uries, 454','Parque Maria Teresa','Nova Friburgo', 'RJ',25934140);

insert into cliente (cli_tx_nome,cli_int_telefone,cli_tx_nome_usuario, cli_tx_email, cli_int_cpf, cli_dt_data_de_nascimento, end_cd_id)
values ('Manuela Natália Andreia Brito',21985867690, 'brito.manuela', 'manuela_brito@spires.com.br', 08061163748,'1988-05-13', 1),
	('Evelyn Kamilly Analu Baptista',21985523223, 'baptista.evelyn', 'evelyn-baptista79@jammer.com.br', 73610530766,'1966-06-17', 2),
	('Kevin Matheus da Rocha',21985792381, 'rocha.kevin', 'kevin_darocha@babo.adv.br', 66869794731,'1956-05-01', 3),
	('Rafael Paulo Lopes',21996144729, 'lopes.rafael', 'rafael_paulo_lopes@bighost.com.br', 27346701780,'1968-07-11', 4),
	('Cláudia Heloise Cardoso',21991242750, 'cardoso.claudia', 'claudia-cardoso91@yogoothies.com.br', 15221713713,'1969-06-12', 5),
	('Milena Sônia Sabrina Ribeiro',22992290799, 'ribeiro.milena', 'milena-ribeiro77@hoatmail.com', 68417913796,'1955-04-14', 6),
	('Elisa Jennifer Natália Melo',22985366467, 'melo.elisa', 'elisa_jennifer_melo@protenisbarra.com.br', 38131387712,'1955-05-26', 7),
	('Mirella Analu Oliveira',22991885230, 'oliveira.mirella', 'mirella_oliveira@me.com.br', 22823775757,'1947-07-12', 8);
	; 
	
insert into categoria (cat_tx_nome, cat_tx_descricao)
values ('Cães', 'Toda linha petshop para seu cão.'),
	('Gatos', 'Toda linha petshop para seu gato.'),
	('Pássaros', 'Toda linha petshop para aves'),
	('Medicamentos', 'Medicamentos veterinários'),
	('Higiente', 'Linha de higiene animal.');

insert into funcionario (func_tx_nome, func_int_cpf)
values ('Benedita Ana Andreia Peixoto', 13685297144),
	('Marcelo Gustavo Yuri Moreira',97366959480),
	('Lara Liz Ester Assunção', 99907156108),
	('Alexandre Theo Mendes', 70022040765),
	('Alexandre Pedro da Costa', 54529438201);

insert into produto (prod_tx_nome, prod_tx_descricao, prod_dt_data_fabricacao, prod_int_qtde_estoque, prod_dec_valor_unitario, cat_cd_id, func_cd_id)
values ('Ração raças grandes','Ração para cães adultos de grande porte frango e carne. Pacote contém 15KG', '2022-01-01',50, 140.99, 1,1),
	('Ração raças pequenas','Ração para cães adultos de pequeno porte frango e carne. Pacote contém 5KG', '2022-01-01',50, 35.90, 1,1),
	('Ração para filhotes','Ração para cães filhotes sabor carne. Pacote contém 5KG', '2022-02-01',50, 35.90, 1,1),
	('Ração adultos','Ração para gatos adultos. Pacote contém 5KG', '2022-01-01',50, 35.90, 2,2),
	('Ração para filhotes','Ração para gatos filhotes. Pacote contém 5KG', '2022-02-01',50, 35.90, 2,2),
	('Biscoito para aves','Biscoito Biscottini Pet Para Papagaios Aves Da Mata - 80g', '2021-12-01',30, 11.90,3,2),
	('Ração para calopsita', 'Ração Para Calopsita E Agapornis Sempre Vita – 500g ', '2022-03-01', 30, 6.90,3,3),
	('Vermífugo','Vermífugo de amplo espectro indicado para Cães e Gatos. Contém 4 comprimidos palatáveis. Dosagem recomendada: 1 comprimido para cada 10 kg.', '2022-05-01', 20, 59.90,4,3),
	('Antipulgas','Coleira antipulgas indicada para Cães e Gatos. Efeito pode durar até 6 (seis) meses. Indicado para animais de pequeno e médio portes, até 10Kg e a partir de 3 (três) meses.', '2022-03-01', 50, 80.00, 4, 4),
	('Suplementos','Suplemento vitamínico indicado para Cães e Gatos. Indicado para animais de todos os portes. Contém 60 (sessenta) comprimidos. Dosagem recomendada: 1 comprimido para cada 10 kg diários.','2022-05-15',20, 35.90, 4, 5),
	('Banho a seco', 'Banho a Seco Pet Clean para Cães e Gatos 500ml', '2022-05-05',20, 14.90,5,5),
	('Sabonete antipulgas', 'Sabonete Ibasa Anti Pulgas para Cães e Gatos 80g', '2021-12-10',30, 19.99,5,5);

-- realizando pedidos nº 1:12

insert into pedido (cli_cd_id, ped_dt_data_do_pedido)
values (1,'2022-08-25'),
	(3,'2022-05-30'),
	(6,'2022-06-22'),
	(7,'2022-06-23'),
	(3,'2022-07-08'),
	(7,'2022-07-14'),
	(5,'2022-07-16'),
	(4,'2022-07-21'),
	(8,'2022-07-26'),
	(1,'2022-07-28'),
	(2,'2022-08-15'),
	(3,'2022-08-21')
;


INSERT INTO "itemPedido" (ped_cd_id, prod_cd_id, prod_dec_valor_produto, iped_int_qtd_produto)
VALUES(1, 1, 140.99, 2), 
	(1, 5, 35.90,1);
INSERT INTO public."itemPedido" (iped_int_qtd_produto,ped_cd_id,prod_cd_id,prod_dec_valor_produto) 
	VALUES (3,2,12,19.99),
		(2,2,11,14.90), 
		(2,2,5,35.90), 
		(1,3,8,59.9), 
		(4,3,7,6.9), 
		(3,4,3,35.9), 
		(2,4,2,35.90), 
		(1,5,9,80), 
		(2,5,1,140.9), 
		(1,6,5,35.90), 
		(3,6,10,35.9), 
		(4,6,11,14.9), 
		(1,7,1,140.9), 
		(2,7,9,80), 
		(1,8,3,35.90),
		(2,8,2,35.90), 
		(4,8,12,19.99), 
		(1,9,4,35.90), 
		(1,9,6,11.9), 
		(3,10,10,35.9), 
		(1,10,12,19.99), 
		(3,11,7,6.9), 
		(1,11,11,14.9),
		(2,12,1,140.9); 

select * from "itemPedido" ip
where ped_cd_id = 1;

-- Nota Fiscal Pedido nº 1

select
	p.ped_cd_id as "Nº Pedido",
	prod.prod_tx_nome as "Produto",
	ip.iped_int_qtd_produto as "Quantidade",
	prod.prod_dec_valor_unitario as "Valor",
	c.cli_tx_nome as "Nome do Cliente",
	p.ped_dt_data_do_pedido as "Data do Pedido"
from
	pedido p
inner join cliente c
on
	(p.cli_cd_id = c.cli_cd_id )
inner join "itemPedido" ip 
on
	(ip.ped_cd_id = p.ped_cd_id)
inner join produto prod 
on
	(prod.prod_cd_id = ip.prod_cd_id)
where p.ped_cd_id = :idpedido	
union all
select
	null, null, null, null, null, null	
from
	"itemPedido" ip
where ip.ped_cd_id = :idpedido
union all
select
	null, 'Total',null, SUM(prod_dec_valor_produto * iped_int_qtd_produto) as "Valor Total", null, null	
from
	"itemPedido" ip
where ip.ped_cd_id = :idpedido;


--BACKUP DATABASE DBFinal
--TO DISK = 'C:\Users\thais\bancodedados\DBFinal';
