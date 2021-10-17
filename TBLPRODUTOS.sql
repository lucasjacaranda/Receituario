CREATE TABLE TBLPRODUTOS (
    CODIGO    INTEGER NOT NULL,
    NOME      VARCHAR(60),
    VALOR     NUMERIC(12,2),
    CONTROLE  CHAR(1)
);

/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE TBLPRODUTOS ADD CONSTRAINT PK_TBLPRODUTOS PRIMARY KEY (CODIGO);

/******************************************************************************/
/*                                Descriptions                                */
/******************************************************************************/

COMMENT ON TABLE TBLPRODUTOS IS
'Tabela Produtos';

/******************************************************************************/
/*                            Fields descriptions                             */
/******************************************************************************/

COMMENT ON COLUMN TBLPRODUTOS.CODIGO IS
'Código Produto';

COMMENT ON COLUMN TBLPRODUTOS.NOME IS
'Nome Produto';

COMMENT ON COLUMN TBLPRODUTOS.VALOR IS
'Valor Produto';

COMMENT ON COLUMN TBLPRODUTOS.CONTROLE IS
'Controle Especial Produto';
