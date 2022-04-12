CREATE TABLE BookInfo
(
    binfo_no        NUMBER(6)
        CONSTRAINT BINFO_NO_PK PRIMARY KEY,
    binfo_name      VARCHAR2(50)
        CONSTRAINT BINFO_NAME_NN NOT NULL,
    binfo_author    VARCHAR2(50)
        CONSTRAINT BINFO_AUTHOR_NN NOT NULL,
    binfo_cno       NUMBER(6)
        CONSTRAINT BINFO_CNO_FK REFERENCES CATEGORY (ctg_no),
    binfo_publisher VARCHAR2(20)
        CONSTRAINT BINFO_PUB_NN NOT NULL,
    binfo_pdate     DATE
        CONSTRAINT BINFO_PDATE_NN NOT NULL,
    binfo_fpdate    DATE
        CONSTRAINT BINFO_FPDATE_NN NOT NULL,
    binfo_enum      NUMBER(3) DEFAULT 1
        CONSTRAINT BINFO_ENUM_NN NOT NULL,
    binfo_edate     DATE
        CONSTRAINT BINFO_EDATE_NN NOT NULL,
    binfo_gdate     DATE    DEFAULT SYSDATE
        CONSTRAINT BINFO_GDATE_NN NOT NULL,
    isshow          CHAR(1) DEFAULT 'Y'
        CONSTRAINT BINFO__SHOW_CK CHECK (isshow IN ('Y', 'N'))
        CONSTRAINT BINFO__SHOW_NN NOT NULL
)


CREATE TABLE CATEGORY
(
    ctg_no    NUMBER (6)
        CONSTRAINT CTG_NO_PK PRIMARY KEY,
    ctg_mainc VARCHAR2(10)
        CONSTRAINT CTG_MAINC_NN NOT NULL,
    ctg_subc  VARCHAR2(10)
        CONSTRAINT CTG_SUBC_NN NOT NULL,
    ctg_do    CHAR(1)
        CONSTRAINT CTG_DO_CK CHECK (ctg_do IN ('D', 'O'))
        CONSTRAINT CTG_DO_NN NOT NULL
)