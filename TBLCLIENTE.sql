CREATE TABLE TBLCLIENTE (
    CODIGO  INTEGER NOT NULL,
    NOME    VARCHAR(60),
    CPF     VARCHAR(14)
);

/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE TBLCLIENTE ADD CONSTRAINT PK_TBLCLIENTE PRIMARY KEY (CODIGO);


/******************************************************************************/
/*                                Descriptions                                */
/******************************************************************************/

COMMENT ON TABLE TBLCLIENTE IS
'Tabela Cliente';

/******************************************************************************/
/*                            Fields descriptions                             */
/******************************************************************************/

COMMENT ON COLUMN TBLCLIENTE.CODIGO IS
'Código Cliente';

COMMENT ON COLUMN TBLCLIENTE.NOME IS
'Nome Cliente';

COMMENT ON COLUMN TBLCLIENTE.CPF IS
'CPF Cliente';
