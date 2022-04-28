CREATE TABLE testmember
(
    tuser_no   NUMBER(4)
        CONSTRAINT M_NO_PK PRIMARY KEY,
    tuser_name VARCHAR2(20 CHAR)
        CONSTRAINT M_NAME_NN NOT NULL,
    tuser_id   VARCHAR2(20 CHAR)
        CONSTRAINT M_ID_UK UNIQUE
        CONSTRAINT M_ID_NN NOT NULL,
    tuser_pw   VARCHAR2(20 CHAR)
        CONSTRAINT M_PW_NN NOT NULL,
    tuser_mail VARCHAR2(50 CHAR)
        CONSTRAINT M_MAIL_UK UNIQUE
        CONSTRAINT M_MAIL_NN NOT NULL,
    tuser_tel  VARCHAR2(15 CHAR)
        CONSTRAINT M_TEL_UK UNIQUE
        CONSTRAINT M_TEL_NN NOT NULL,
    tuser_gen  CHAR(1)
        CONSTRAINT M_GEN_CK CHECK (tuser_gen IN ('F', 'M', 'N'))
        CONSTRAINT M_GEN_NN NOT NULL,
    tuser_avt  NUMBER (4) DEFAULT 10
        CONSTRAINT M_AVT_NN NOT NULL,
    tjoindate  DATE    DEFAULT sysdate
        CONSTRAINT M_JOIN_NN NOT NULL,
    tisShow    CHAR(1) DEFAULT 'N'
        CONSTRAINT M_SHOW_CK CHECK (tisshow IN ('Y', 'N'))
        CONSTRAINT M_SHOW_NN NOT NULL
);

ALTER TABLE testmember
MODIFY tuser_avt
CONSTRAINT M_AVT_UK UNIQUE ;

INSERT INTO
    testmember(tuser_no, tuser_name, tuser_id, tuser_pw, tuser_mail, tuser_tel, tuser_gen)
VALUES(
    10, '윤한기', 'sevil', '12345', 'euns@githrd.com', '010-3175-9042', 'M'
);
COMMIT ;

CREATE TABLE testavatar
(
    tavt_no    NUMBER(4)
        CONSTRAINT A_NO_FK REFERENCES testmember(tuser_avt)
        CONSTRAINT A_NO_PK PRIMARY KEY,
    tavt_sname VARCHAR2(50 CHAR)
        CONSTRAINT A_SNAME_NN NOT NULL,
    tavt_gen   CHAR(1)
        CONSTRAINT A_GEN_FK REFERENCES testmember(tuser_gen)
        CONSTRAINT A_GEN_CK CHECK (tavt_gen IN ('F', 'M', 'N'))
        CONSTRAINT A_GEN_NN NOT NULL,
    tavt_sdir  VARCHAR2(100 CHAR)
        CONSTRAINT A_SDIR_NN NOT NULL,
    tisShow    CHAR(1) DEFAULT 'N'
        CONSTRAINT A_SHOW_CK CHECK (tisshow IN ('Y', 'N'))
        CONSTRAINT A_SHOW_NN NOT NULL
);