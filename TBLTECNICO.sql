CREATE TABLE TBLTECNICO (
    CODIGO    INTEGER NOT NULL,
    NOME      VARCHAR(60),
    CPF       VARCHAR(14),
    REGISTRO  VARCHAR(10)
);

/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE TBLTECNICO ADD CONSTRAINT PK_TBLTECNICO PRIMARY KEY (CODIGO);

/******************************************************************************/
/*                                Descriptions                                */
/******************************************************************************/

COMMENT ON TABLE TBLTECNICO IS
'Tabela Técnico Agrícola';

/******************************************************************************/
/*                            Fields descriptions                             */
/******************************************************************************/

COMMENT ON COLUMN TBLTECNICO.CODIGO IS
'Código Técnico Agrícola';

COMMENT ON COLUMN TBLTECNICO.NOME IS
'Nome Técnico Agrícola';

COMMENT ON COLUMN TBLTECNICO.CPF IS
'CPF Técnico Agrícola';

COMMENT ON COLUMN TBLTECNICO.REGISTRO IS
'Número de Registro Técnico Agrícola';
