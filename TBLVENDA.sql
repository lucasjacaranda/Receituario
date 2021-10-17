CREATE TABLE TBLVENDA (
    CODIGO          INTEGER NOT NULL,
    CODIGO_CLIENTE  INTEGER NOT NULL,
    CODIGO_TECNICO  INTEGER,
    DATA            DATE NOT NULL,
    STATUS          CHAR(1) NOT NULL
);

/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE TBLVENDA ADD CONSTRAINT PK_TBLVENDA PRIMARY KEY (CODIGO);

/******************************************************************************/
/*                                Foreign keys                                */
/******************************************************************************/

ALTER TABLE TBLVENDA ADD CONSTRAINT FK_VENDACLIENTE FOREIGN KEY (CODIGO_CLIENTE) REFERENCES TBLCLIENTE (CODIGO);

ALTER TABLE TBLVENDA ADD CONSTRAINT FK_VENDATECNICO FOREIGN KEY (CODIGO_TECNICO) REFERENCES TBLTECNICO (CODIGO);

/******************************************************************************/
/*                            Fields descriptions                             */
/******************************************************************************/

COMMENT ON COLUMN TBLVENDA.CODIGO IS
'Código da Venda';

COMMENT ON COLUMN TBLVENDA.CODIGO_CLIENTE IS
'Código do Cliente';

COMMENT ON COLUMN TBLVENDA.CODIGO_TECNICO IS
'Código do Técnico';

COMMENT ON COLUMN TBLVENDA.DATA IS
'Data da Venda';

COMMENT ON COLUMN TBLVENDA.STATUS IS
'Status do Pedido';
