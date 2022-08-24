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
  "cli_tx_endereco" varchar(30) not null,
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
  "prod_cd_id" int4 not null,
  PRIMARY KEY ("ped_cd_id"),
  CONSTRAINT "FK_pedido.cli_cd_id"
    FOREIGN KEY ("cli_cd_id")
      REFERENCES "cliente"("cli_cd_id")
);

drop table "itemProduto"
CREATE TABLE "itemProduto" (
  "ipod_int_qtd_produto" int4 not null,
  "ped_cd_id" int4 not null,
  "prod_cd_id" int4 not null,
  PRIMARY KEY ("ped_cd_id", "prod_cd_id"),
  CONSTRAINT "FK_itemProduto.ped_cd_id"
    FOREIGN KEY ("ped_cd_id")
      REFERENCES "pedido"("ped_cd_id"), 
   CONSTRAINT "FK_itemProduto.prod_cd_id"
    FOREIGN KEY ("prod_cd_id")
      REFERENCES "produto"("prod_cd_id")
      );
 
     select * from cliente 
