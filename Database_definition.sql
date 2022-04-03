--TABLES

CREATE TABLE Clienti (
    username VARCHAR2(20),
    password VARCHAR2(20) NOT NULL,
    nome VARCHAR2(100) NOT NULL,
    cognome VARCHAR2(100) NOT NULL,
    comune CHAR(2) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    foto BLOB,
    
    CONSTRAINT PK_CLIENTI PRIMARY KEY(username),
    CONSTRAINT UC_EMAIL_CLIENTI UNIQUE (email)
)
LOB (foto) STORE AS lob_foto_clienti (TABLESPACE offergo_foto_ts) STORAGE (INITIAL 3 M);

CREATE TABLE Comuni (
    codice CHAR(2),
    nome VARCHAR2(50) NOT NULL,
    
    CONSTRAINT PK_COMUNI PRIMARY KEY(codice),
    CONSTRAINT UC_NOME_COMUNI UNIQUE (nome)
)
STORAGE (INITIAL 1 M);

CREATE TABLE Hashtag (
    testo VARCHAR2(100),


    CONSTRAINT PK_HASHTAG PRIMARY KEY(testo)
)
STORAGE (INITIAL 2 M);

CREATE TABLE Feedback(
    id NUMBER(38),
    cliente VARCHAR2(20) NOT NULL,
    offerta NUMBER(38) NOT NULL,
    voto NUMBER(1) NOT NULL,
    testo CLOB,


    CONSTRAINT PK_FEEDBACK PRIMARY KEY(id),
    CONSTRAINT CC_VOTO_FEEDBACK CHECK (voto >= 0 AND voto <= 5)
)
LOB (testo) STORE AS lob_commento_feedback (TABLESPACE offergo_feedback_ts) STORAGE (INITIAL 3 M);

CREATE TABLE Negozi(
    username VARCHAR2(20),
    password VARCHAR2(20) NOT NULL,
    nome VARCHAR2(100) NOT NULL,
    recapito CHAR(10) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    fax CHAR(10) NOT NULL,
    piva CHAR(11) NOT NULL,
    via VARCHAR2(100) NOT NULL,
    citta VARCHAR2(50) NOT NULL,
    comune CHAR(2) NOT NULL,
    cap CHAR(5) NOT NULL,
    latitudine NUMBER NOT NULL,
    longitudine NUMBER NOT NULL,
    centro_comm NUMBER(1) NOT NULL,
    tipologia VARCHAR2(50) NOT NULL,
    descrizione CLOB NOT NULL,
    
    CONSTRAINT PK_NEGOZI PRIMARY KEY(username),
    CONSTRAINT CC_CENTRO_COMM CHECK (centro_comm = 0 OR centro_comm = 1),
    CONSTRAINT UC_EMAIL_NEGOZI UNIQUE (email),
    CONSTRAINT UC_RECAPITO_NEGOZI UNIQUE (recapito)
)
LOB (descrizione) STORE AS lob_descrizione_negozi (TABLESPACE offergo_descrizioni_ts) STORAGE (INITIAL 2 M);

CREATE TABLE Offerte(
    id NUMBER(38),
    data_inizio DATE NOT NULL,
    data_fine DATE NOT NULL,
    descrizione CLOB,
    note VARCHAR2(255),


    CONSTRAINT PK_OFFERTE PRIMARY KEY(id)
)
LOB (descrizione) STORE AS lob_descrizione_offerte (TABLESPACE offergo_descrizioni_ts) STORAGE (INITIAL 7 M);

CREATE TABLE Neg_Off_Hash(
    negozio VARCHAR2(20),
    offerta NUMBER(38),
    hashtag VARCHAR2(100),


    CONSTRAINT PK_NEG_OFF_HASH PRIMARY KEY(negozio,offerta,hashtag)
)
STORAGE (INITIAL 4 M);

CREATE TABLE Offerte_Prodotti(
    offerta NUMBER(38),
    prodotto NUMBER(38),
    prezzo_iniziale NUMBER(6,2) NOT NULL,
    prezzo_scontato NUMBER(6,2) NOT NULL,
    stato VARCHAR2(20) NOT NULL,


    CONSTRAINT PK_OFFERTE_PRODOTTI PRIMARY KEY(offerta,prodotto)
)
STORAGE (INITIAL 3 M);

CREATE TABLE Prodotti(
    id NUMBER(38),
    nome VARCHAR2(100) NOT NULL,
    descrizione CLOB,
    categoria NUMBER(38) NOT NULL,


    CONSTRAINT PK_PRODOTTI PRIMARY KEY(id)
)
LOB (descrizione) STORE AS lob_descrizione_prodotti (TABLESPACE offergo_descrizioni_ts) STORAGE (INITIAL 19 M);

CREATE TABLE Immagini(
    url VARCHAR2(255),
    prodotto NUMBER(38) NOT NULL,
    immagine BLOB NOT NULL,


    CONSTRAINT PK_IMMAGINI PRIMARY KEY(url)
)
LOB (immagine) STORE AS lob_immagini (TABLESPACE offergo_foto_ts) STORAGE (INITIAL 61 M);

CREATE TABLE Categorie(
    id NUMBER(38),
    nome VARCHAR2(100) NOT NULL,
    nome_sottocategoria VARCHAR2(100) NOT NULL,


    CONSTRAINT PK_CATEGORIE PRIMARY KEY(id)
)
STORAGE (INITIAL 1 M);

CREATE TABLE Prodotti_Da_Inserire(
    nome VARCHAR2(100),
    descrizione CLOB,
    categoria NUMBER(38) NOT NULL,
    
    CONSTRAINT PK_PRODOTTI_DA_INSERIRE PRIMARY KEY(nome)
)
LOB (descrizione) STORE AS lob_descrizione_prodotti_da_inserire (TABLESPACE offergo_descrizioni_ts) STORAGE (INITIAL 15 M);

CREATE TABLE Storico_Feedback(
    id NUMBER(38),
    cliente VARCHAR2(20) NOT NULL,
    offerta NUMBER(38) NOT NULL,
    voto NUMBER(1) NOT NULL,
    testo CLOB,


    CONSTRAINT PK_STORICO_FEEDBACK PRIMARY KEY(id)
)
LOB (testo) STORE AS lob_commento_storico_feedback (TABLESPACE offergo_feedback_ts) STORAGE (INITIAL 3 M);

CREATE TABLE Storico_Offerte(
    offerta NUMBER(38),
    prodotto NUMBER(38),
    prezzo_iniziale NUMBER(6,2) NOT NULL,
    prezzo_scontato NUMBER(6,2) NOT NULL,
    stato VARCHAR2(20) NOT NULL,
    data_inizio DATE NOT NULL,
    data_fine DATE NOT NULL,
    descrizione CLOB,
    note VARCHAR2(255),


    CONSTRAINT PK_STORICO_OFFERTE PRIMARY KEY(offerta,prodotto)
)
LOB (descrizione) STORE AS lob_descrizione_storico_offerte (TABLESPACE offergo_descrizioni_ts) STORAGE (INITIAL 8 M);

CREATE TABLE Registrazione_Clienti(
    Nome VARCHAR2(100) NOT NULL,
    Cognome VARCHAR2(100) NOT NULL,
    Comune CHAR(2) NOT NULL,
    Email VARCHAR2(50),
    Foto BLOB,


    CONSTRAINT PK_REGISTRAZIONE_CLIENTI PRIMARY KEY(email)
)
LOB (foto) STORE AS lob_foto_clienti (TABLESPACE offergo_foto_ts) STORAGE (INITIAL 3 M);

CREATE TABLE Registrazione_Negozi(
    nome VARCHAR2(100) NOT NULL,
    recapito CHAR(10) NOT NULL,
    email VARCHAR2(50),
    fax CHAR(10) NOT NULL,
    piva CHAR(11) NOT NULL,
    via VARCHAR2(100) NOT NULL,
    città VARCHAR2(50) NOT NULL,
    comune CHAR(2) NOT NULL,
    cap CHAR(5) NOT NULL,
    latitudine NUMBER NOT NULL,
    longitudine NUMBER NOT NULL,
    centro_comm NUMBER(1) NOT NULL,
    tipologia VARCHAR2(50) NOT NULL,
    descrizione CLOB NOT NULL,
    
    CONSTRAINT PK_REGISTRAZIONE_NEGOZI PRIMARY KEY(email),
    CONSTRAINT CC_REGISTRAZIONE_CENTRO_COMM CHECK (centro_comm = 0 OR centro_comm = 1),
    CONSTRAINT UC_REGISTRAZIONE_RECAPITO_NEGOZI UNIQUE (recapito)
)
LOB (descrizione) STORE AS lob_descrizione_registrazione_negozi (TABLESPACE offergo_descrizioni_ts) STORAGE (INITIAL 1 M);


FK E POLITICHE DI REAZIONE
ALTER TABLE Clienti ADD (constraint FK_COMUNE_CLIENTI
FOREIGN KEY (Comune)
REFERENCES Comuni(Codice));


ALTER TABLE Negozi ADD (constraint FK_COMUNE_NEGOZI
FOREIGN KEY (Comune)
REFERENCES Comuni(Codice));


ALTER TABLE Neg_Off_Hash ADD CONSTRAINT FK_NEG_OFF_HASH_NEGOZIO FOREIGN KEY (Negozio) REFERENCES Negozi(username)
ON DELETE CASCADE


ALTER TABLE Neg_Off_Hash ADD CONSTRAINT FK_NEG_OFF_HASH_OFFERTA FOREIGN KEY (Offerta) REFERENCES Offerte(id)
ON DELETE CASCADE


ALTER TABLE Neg_Off_Hash ADD (constraint FK_NEG_OFF_HASH_HASHTAG
FOREIGN KEY (Hashtag)
REFERENCES Hashtag(testo));


ALTER TABLE Offerte_Prodotti ADD CONSTRAINT FK_OFFERTE FOREIGN KEY (Offerta) REFERENCES Offerte(id)
ON DELETE CASCADE


ALTER TABLE Offerte_Prodotti ADD CONSTRAINT FK_PRODOTTI FOREIGN KEY (Prodotto) REFERENCES Prodotti(id)
ON DELETE CASCADE


ALTER TABLE Feedback ADD (constraint FK_FEEDBACK_CLIENTE
FOREIGN KEY (Cliente)
REFERENCES Clienti(username));


ALTER TABLE Feedback ADD CONSTRAINT FK_FEEDBACK_OFFERTA FOREIGN KEY (Offerta) REFERENCES Offerte(id)
ON DELETE CASCADE


ALTER TABLE Prodotti ADD CONSTRAINT FK_PRODOTTI_CATEGORIA FOREIGN KEY (Categoria) REFERENCES Categorie(id)
ON DELETE CASCADE


ALTER TABLE Immagini ADD CONSTRAINT FK_IMMAGINI_PRODOTTI FOREIGN KEY (Prodotto) REFERENCES Prodotti(id)
ON DELETE CASCADE


--TRIGGERS

--Trigger to set "***" when a municipality is deleted
CREATE OR REPLACE TRIGGER update_comuni_clienti
AFTER DELETE
ON Comuni
FOR EACH ROW
BEGIN
    UPDATE Clienti SET comune = '***'
    WHERE comune=:OLD.codice;
END;


CREATE OR REPLACE TRIGGER update_comuni_negozi
AFTER DELETE
ON Comuni
FOR EACH ROW
BEGIN
    UPDATE Negozi SET comune = '***'
    WHERE comune=:OLD.codice;
END;


--Trigger to set "***" when an hashtag is deleted
CREATE OR REPLACE TRIGGER update_negoffhash
AFTER DELETE
ON Hashtag
FOR EACH ROW
BEGIN
    UPDATE Neg_Off_hash SET hashtag = '***'
    WHERE hashtag=:OLD.testo;
END;


CREATE OR REPLACE TRIGGER update_feedback
AFTER DELETE
ON Clienti
FOR EACH ROW
BEGIN
    UPDATE Feedback SET cliente = '***'
    WHERE cliente=:OLD.username;
END;

--Trigger to check that an offer is still valid (not expired)
CREATE OR REPLACE TRIGGER check_offerta_valida
BEFORE INSERT
ON Offerte
FOR EACH ROW
DECLARE
    late exception;
BEGIN
    IF :NEW.data_fine < sysdate
        THEN RAISE late;
    END IF;
    
    EXCEPTION WHEN late THEN raise_application_error(-20005, 'La data di fine offerta non può essere minore di quella attuale');
END;


--STORED PROCEDURES AND JOBS

--Move to historical
CREATE OR REPLACE PROCEDURE spostamento_storico AS
BEGIN
    DECLARE 
    CURSOR offerte_selez IS SELECT op.offerta, op.prodotto, op.prezzo_iniziale, op.prezzo_scontato, op.stato, o.data_inizio, o.data_fine, o.descrizione, o.note
                          FROM Offerte o, Offerte_Prodotti op
                          WHERE (op.offerta = o.id) AND (o.data_fine < sysdate);
    
    CURSOR feedback_selez IS SELECT f.id, f.cliente, f.offerta, f.voto, f.testo
                        FROM Feedback f, Offerte o
                        WHERE f.offerta = o.id;
                        
    offe Offerte_Prodotti.offerta%TYPE; 
    pro Offerte_Prodotti.prodotto%TYPE; 
    pri Offerte_Prodotti.prezzo_iniziale%TYPE;  
    prs Offerte_Prodotti.prezzo_scontato%TYPE; 
    sta Offerte_Prodotti.stato%TYPE;  
    dai Offerte.data_inizio%TYPE; 
    daf Offerte.data_fine%TYPE;  
    des Offerte.descrizione%TYPE; 
    note Offerte.note%TYPE;     


    ide Feedback.id%TYPE; 
    cli Feedback.cliente%TYPE; 
    off1 Feedback.offerta%TYPE; 
    vot Feedback.voto%TYPE; 
    test Feedback.testo%TYPE; 


    BEGIN
        OPEN offerte_selez;
        OPEN feedback_selez;
        
        LOOP 
            FETCH offerte_selez INTO offe,pro,pri,prs,sta,dai,daf,des,note;
            EXIT WHEN offerte_selez%NOTFOUND;
            INSERT INTO Storico_Offerte VALUES (offe,pro,pri,prs,sta,dai,daf,des,note);
            DELETE FROM Offerte WHERE id = offe;
        END LOOP;
        
        LOOP 
            FETCH feedback_selez INTO ide, cli, off1, vot, test;
            EXIT WHEN feedback_selez%NOTFOUND;
            INSERT INTO Storico_Feedback VALUES (ide, cli, off1, vot, test);
            DELETE FROM Feedback WHERE offerta=off1;
        END LOOP;
        
        CLOSE offerte_selez;
        CLOSE feedback_selez;
    END;
END;


BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
         job_name => 'JOB_SPOSTAMENTO_OFFERTE_FEEDBACK',
         job_type => 'STORED_PROCEDURE',
         job_action => 'spostamento_storico',
         start_date => current_timestamp,
         repeat_interval => 'FREQ=DAILY;INTERVAL=1;',
         enabled => true);
END;