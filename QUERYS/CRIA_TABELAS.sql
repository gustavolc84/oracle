
CREATE TABLE TB_USUARIO(
  ID_USUARIO NUMBER(2) NOT NULL,
  NOME VARCHAR2(50) NOT NULL,
  EMAIL VARCHAR2(50) NOT NULL,
  LOGIN VARCHAR2(50) NOT NULL,
  SENHA VARCHAR2(10) NOT NULL,
  DT_NASC DATE NOT NULL,
  ATIVO CHAR NOT NULL,
  CONSTRAINT PK_USUARIO PRIMARY KEY (ID_USUARIO),
  CONSTRAINT CK_ATIVO CHECK (ATIVO IN('A','I')));

CREATE TABLE TB_VENDA(
  ID_VENDA NUMBER(2) NOT NULL,
  ID_USUARIO NUMBER(2) NOT NULL,
  DT_VENDA DATE NOT NULL,  
  CONSTRAINT PK_VENDA PRIMARY KEY(ID_VENDA),
  CONSTRAINT FK_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(ID_USUARIO));
  
  CREATE TABLE TB_PRODUTO(
  ID_PRODUTO NUMBER(2) NOT NULL,
  DESCRICAO VARCHAR2(50) NOT NULL,
  VLR_UNITARIO NUMBER(5,2) DEFAULT 0.0,
  TP_PRODUTO VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_RODUTO PRIMARY KEY(ID_PRODUTO));
  
CREATE TABLE TB_ITENS_VENDIDO(
  ID_ITEM_VENDIDO NUMBER(2) NOT NULL,
  ID_VENDA NUMBER(2) NOT NULL,
  ID_PRODUTO NUMBER(2) NOT NULL,
  CONSTRAINT PK_ITEM_VENDIDO PRIMARY KEY(ID_ITEM_VENDIDO),
  CONSTRAINT FK_VENDA FOREIGN KEY (ID_VENDA) REFERENCES TB_VENDA(ID_VENDA));
  

CREATE SEQUENCE SQ_USUARIO 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 50;
  
CREATE SEQUENCE SQ_VENDA 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1;
  
CREATE SEQUENCE SQ_PRODUTO 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 50;
  
  CREATE SEQUENCE SQ_ITENS_VENDIDO 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1;
  
/*
INSERT INTO TB_USUARIO VALUES(SQ_USUARIO.NEXTVAL,'GUSTAVO','GUSTAVO@GMAIL.COM','GUSTAVO','123','10/09/1984','A');
INSERT INTO TB_USUARIO VALUES(SQ_USUARIO.NEXTVAL,'LUANA','LUANA@GMAIL.COM','LUANA','123','30/04/1983','A');
INSERT INTO TB_USUARIO VALUES(SQ_USUARIO.NEXTVAL,'CLARA','CLARA@GMAIL.COM','CLARA','123','20/04/2006','A');
*/

/*
INSERT INTO TB_VENDA VALUES(SQ_VENDA.NEXTVAL,1,SYSDATE - 20);
INSERT INTO TB_VENDA VALUES(SQ_VENDA.NEXTVAL,1,SYSDATE - 18);
INSERT INTO TB_VENDA VALUES(SQ_VENDA.NEXTVAL,2,SYSDATE - 16);
INSERT INTO TB_VENDA VALUES(SQ_VENDA.NEXTVAL,2,SYSDATE - 14);
INSERT INTO TB_VENDA VALUES(SQ_VENDA.NEXTVAL,3,SYSDATE - 12);
INSERT INTO TB_VENDA VALUES(SQ_VENDA.NEXTVAL,3,SYSDATE - 10);
*/

/*
INSERT INTO TB_PRODUTO VALUES(SQ_PRODUTO.NEXTVAL,'LEITE',3.50,'LATICINIO');
INSERT INTO TB_PRODUTO VALUES(SQ_PRODUTO.NEXTVAL,'SABONETE',1.49,'LIMPEZA');
INSERT INTO TB_PRODUTO VALUES(SQ_PRODUTO.NEXTVAL,'BISCOITO',2.50,'ALIMENTICIO');
INSERT INTO TB_PRODUTO VALUES(SQ_PRODUTO.NEXTVAL,'CARNE',11.30,'ALIMENTICIO');
INSERT INTO TB_PRODUTO VALUES(SQ_PRODUTO.NEXTVAL,'DOCE DE LEITE',5.99,'SOBREMESA');
INSERT INTO TB_PRODUTO VALUES(SQ_PRODUTO.NEXTVAL,'CHOCOLATE',4.50,'DELICIA');
*/

/*
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,1,1);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,1,3);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,2,5);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,2,4);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,3,2);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,3,6);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,4,3);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,4,5);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,5,1);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,5,6);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,6,5);
INSERT INTO TB_ITENS_VENDIDO VALUES(SQ_ITENS_VENDIDO.NEXTVAL,6,2);
*/
  
/*
SELECT
U.NOME
,V.ID_VENDA
,TO_CHAR(V.DT_VENDA,'DD/MM/YYYY') AS DATA_VENDA
,INITCAP(P.DESCRICAO) AS DESC_PRODUTO
FROM TB_USUARIO U
JOIN TB_VENDA V   
ON U.ID_USUARIO = V.ID_USUARIO
JOIN TB_ITENS_VENDIDO IV
ON V.ID_VENDA = IV.ID_VENDA
JOIN TB_PRODUTO P  
ON IV.ID_PRODUTO = P.ID_PRODUTO
ORDER BY U.NOME,V.ID_VENDA;
*/