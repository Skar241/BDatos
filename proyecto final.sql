/************************************** Opcion 1 ***********************************************/

LINEA= {idLinea(PK) NUMBER(4), telLinea(U) VARCHAR(8), nombreLinea VARCHAR(10)}

CREATE 	TABLE linea (
idLinea NUMBER (4) NOT NULL,
telLinea VARCHAR2(8) UNIQUE,
nombreLinea VARCHAR2(10) NOT NULL,
CONSTRAINT linea_pk PRIMARY KEY (idLinea)
);

/************************************** Opcion 1 ***********************************************/


AUTOBUS= {noAuto(PK) NUMBER(4), ruta VARCHAR(20), idLinea(FK) NUMBER(4)}

CREATE TABLE autobus (
noAuto NUMBER(4),
ruta VARCHAR2(20) NOT NULL,
idLinea NUMBER(4),
CONSTRAINT autobus_pk PRIMARY KEY (noAuto),
CONSTRAINT autobus_fk
	FOREIGN KEY (idLinea) 
	REFERENCES linea(idLinea)
	ON DELETE CASCADE
);

/************************************** Opcion 1 ***********************************************/

AUTOASIEN= {[noAuto(FK) NUMBER(4), noAsiento(D) NUMBER(2)](PK),  estatusAsiento VARCHAR(1)}

CREATE TABLE autoAsiento (
noAuto NUMBER(4) NOT NULL,
CONSTRAINT autoasiento_fk 
	FOREIGN KEY (noAuto) 
	REFERENCES autobus(noAuto)
	ON DELETE CASCADE,
noAsiento NUMBER(2) NOT NULL,
CONSTRAINT autoAsiento_pk PRIMARY KEY (noAuto, noAsiento),
estatusAsiento CHAR(1)  DEFAULT 'D' CHECK ( estatusAsiento = 'D' OR estatusAsiento = 'O') 
);


/***********************************************************************************************/

CLIENTE= {noCliente(PK) NUMBER(4), telCli(U) VARCHAR(8), pilaC li VARCHAR(10), apPatCli VARCHAR(10), apMatCli VARCHAR(10)}

CREATE TABLE cliente (
noCliente NUMBER (4),
telCli  VARCHAR2(8) UNIQUE,
pilaC VARCHAR2(10) NOT NULL,
apPatCli VARCHAR2 (10) NOT NULL,
apMatCli VARCHAR2 (10) NOT NULL,
CONSTRAINT cliente_pk PRIMARY KEY (noCliente)
);

/************************************** Opcion 1 ***********************************************/
RESERVA= {noFolio(PK) NUMBER(4), costo NUMBER(5,2), hora VARCHAR2(5), fecha DATE, noCliente(FK) NUMBER(4), [noAuto NUMBER(4), noAsiento NUMBER(2)](FK) }


CREATE TABLE reserva (
noFolio NUMBER (4) PRIMARY KEY,
costo NUMBER(5,2) NOT NULL CHECK( costo > 0),
hora VARCHAR2(5) NOT NULL,
fecha DATE NOT NULL,
noCliente NUMBER (4),
CONSTRAINT reserva_fk_1
	FOREIGN KEY (noCliente) 
	REFERENCES cliente(noCliente)
	ON DELETE CASCADE,
noAuto NUMBER (4) NOT NULL,
noAsiento NUMBER (2) NOT NULL,
CONSTRAINT reserva_fk_2
	FOREIGN KEY (noAuto,noAsiento) 
	REFERENCES autoAsiento(noAuto,noAsiento)
	ON DELETE CASCADE
);




/***********************************************************************************************/
DATOS
/***********************************************************************************************/

LINEA= {idLinea(PK) NUMBER(4), telLinea(U) VARCHAR(8), nombreLinea VARCHAR(10)};

insert into linea (idLinea, telLinea, nombreLinea) 
VALUES (2681,'55491334', 'Peace');

insert into linea (idLinea, telLinea, nombreLinea) 
VALUES (1111,'58632342', 'Art');

insert into linea (idLinea, telLinea, nombreLinea) 
VALUES (9345,'79537912', 'Coffee');

insert into linea (idLinea, telLinea, nombreLinea) 
VALUES (6530,'85947040', 'Tea');

insert into linea (idLinea, telLinea, nombreLinea) 
VALUES (2408,'92960461', 'Milk');

/***********************************************************************************************/

AUTOBUS= {noAuto(PK) NUMBER(4), ruta VARCHAR(20), idLinea(FK) NUMBER(4)}

insert into autobus (noAuto, ruta, idLinea) 
VALUES (6204, 'Mexico-Cuernavaca',2681);

insert into autobus (noAuto, ruta, idLinea) 
VALUES (8451, 'Mexico-Tuxtla',6530);

insert into autobus (noAuto, ruta, idLinea) 
VALUES (7020, 'Mexico-Cuautla',9345);

insert into autobus (noAuto, ruta, idLinea) 
VALUES (5729 , 'Monterrey-Mexico',2408);

insert into autobus (noAuto, ruta, idLinea) 
VALUES (5725 , 'Cancun-Chetumal',1111);

/***********************************************************************************************/

autoasiento= {[noAuto(FK) NUMBER(4), noAsiento(D) NUMBER(2)](PK),  estatusAsiento VARCHAR(1)}

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(8451,13,'O');

insert into autoasiento(noAuto, noAsiento, estatusAsiento)
VALUES(6204,27,'O');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(7020,03,'D');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(8451,19,'O');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(5729,6,'D');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(6204,10,'D');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(7020,35,'D');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(8451,14,'O');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(5729,20,'D');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(6204,20,'D');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(8451,20,'O');

insert into autoasiento (noAuto, noAsiento, estatusAsiento)
VALUES(5729,7,'O');


/***********************************************************************************************/

CLIENTE= {noCliente(PK) NUMBER(4), telCli(U) VARCHAR(8), pilaC li VARCHAR(10), apPatCli VARCHAR(10), apMatCli VARCHAR(10)}

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (6484,12345678,'Juan','Gutierrez','Perez');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (9527,18765432,'Martha','Resendiz','Jimenez');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (3964,87941235,'Pablo','Aldana','Carstensen');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (6836,55239854,'Santiago','Pineda','Hernandez');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (1412,12346270,'Fernando','Olvera','Trejo');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (4048,39987856,'Ivan','Rosales','Perez');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (3036,28465940,'Gilberto','Eleno','Gomez');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (9739,55399253,'Alejandra','Elizalde', 'Flores');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (4143,55267057,'Missael','Castillo','Ramirez');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (7668,42552948,'Daniel','Moya','Pedraza');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (5399,95693080,'Selina','Subias','Montes');

insert into Cliente (noCliente, telCli, pilaC, apPatCli, apMatCli)
VALUES (4826,38191430,'Georgina','Zuñiga','Rojas');


/***********************************************************************************************/

RESERVA= {noFolio(PK) NUMBER(4), costo NUMBER(5,2), hora TIME, fecha DATE, noCliente(FK) NUMBER(4), [noAuto NUMBER(4), noAsiento NUMBER(2)](FK) }


insert into reserva (noFolio, costo, hora, fecha, 
noCliente, noAuto, noAsiento)
VALUES (1250, 500.50, '12:01','02/Ene/2015',4826,5729,7);

insert into reserva (noFolio, costo, hora, fecha, 
noCliente, noAuto, noAsiento)
VALUES (1251, 225.11, '22:11','17/Feb/2015',3036,5729,20);

insert into reserva (noFolio, costo, hora, fecha, 
noCliente, noAuto, noAsiento)
VALUES (1252, 456.20, '16:19','23/Feb/2015',1412,6204,10);

insert into reserva (noFolio, costo, hora, fecha, 
noCliente, noAuto, noAsiento)
VALUES (1253, 547.36, '12:40','26/Feb/2015',6484,8451,13);

insert into reserva (noFolio, costo, hora, fecha, 
noCliente, noAuto, noAsiento)
VALUES (1254, 345.97, '09:40','02/May/2015',9739,5729,6);

insert into reserva (noFolio, costo, hora, fecha, 
noCliente, noAuto, noAsiento)
VALUES (1255, 345.86, '23:00','25/Jun/2015',4048,8451,20);

insert into reserva (noFolio, costo, hora, fecha, 
noCliente, noAuto, noAsiento)
VALUES (1256, 645.45, '08:14','15/Sep/2015',3964,7020,03);

/***********************************************************************************************/


/**************************************** PRODCEDIMIENTOS ******************************/

 CREATE OR REPLACE PROCEDURE  insertaCliente(
 	v_noCliente IN  cliente.noCliente%TYPE,
 	v_telCli IN cliente.telCli%TYPE,
 	v_pilaC IN cliente.pilaC%TYPE,
 	v_apPatCli IN cliente.apPatCli%TYPE,
 	v_apMatCli IN cliente.apMatCli%TYPE)
AS --tal vez
 	d_noCliente cliente.noCliente%TYPE;
 BEGIN --inicia
 	SELECT noCliente  
 	INTO d_noCliente
 	FROM cliente
 	WHERE noCliente = v_noCliente; 
 	IF SQL%NOTFOUND THEN
 		INSERT INTO cliente (noCliente,telCli,pilaC, apPatCli, apMatCli)
 		VALUES (v_noCliente,v_telCli,v_pilaC,v_apPatCli,v_apMatCli);
 	ELSE
 		DBMS_OUTPUT.PUT_LINE('Ya existe cliente '|| d_noCliente);
 	END IF;
 END;
 /
 
 /*------ para probarlo
 	esto debe generar uns mensaje si es que la tupla ya existe, para esto ya debe estar habilitado: 
 	SET SERVEROUTPUT ON; --habilita imprimir en pantalla, ESTA NO VA EN EL PROCEDIMIENTO-----*/
 EXEC insertaCliente(noCliente,telCliente, pilaC, apPatCli, apMatCli);--valores como si hicieras un insert de tabla
 
 
 --------------------------------------------------------------------------------------

/************** TRIGGER************/

CREATE OR REPLACE TRIGGER edoAsiento
AFTER
	INSERT   ON reserva
	FOR EACH ROW --habra una modificacion por cada tupla modificada
DECLARE
	pfkautoAsiento reserva.noAuto%TYPE;
	pfkautoAsiento2 reserva.noAsiento%TYPE; --referenciamos una FK compuesta
BEGIN
	pfkautoAsiento  := :NEW.noAuto;
	pfkautoAsiento2 := :new.noAsiento;-- recibe datos modificados en tabla reserva
	-- solo actualizamos valor del estatusAsiento
	UPDATE  autoAsiento
	SET  estatusAsiento = 'O' 	
	WHERE  noAuto = pfkautoAsiento AND noAsiento =  pfkautoAsiento2;
END edoAsiento ;
/
Disparador creado.

/* Procedimiento que verifique que al momento de hacer una reservación del cliente-asiento, no exista otra del mismo  **
**  cliente en esa fecha y hora, puede estar en otra línea de autobuses                                                */

/*  exect addReservacion(pnoFolio, pcosto,phora, pfecha, pnoCliente, pnoAuto, pnoAsiento, pidLinea) 
Valores como si hicieras un insert en reservación, más la línea de autobuses*/

CREATE OR REPLACE PROCEDURE addReservacion(pnoFolio IN NUMBER, pcosto IN NUMBER,
	phora in VARCHAR2, pfecha in DATE, pnoCliente IN NUMBER, pnoAuto IN NUMBER,
	pnoAsiento IN NUMBER, pidLinea in NUMBER)
AS
	tmp NUMBER (4); 
BEGIN
	SELECT noCliente INTO tmp FROM reserva NATURAL JOIN autobus
	WHERE (noCliente = pnoCliente AND fecha = pfecha AND pidLinea = idLinea);
	IF SQL%NOTFOUND THEN
		INSERT INTO reserva(noFolio,costo,hora,fecha,noCliente,noAuto,noAsiento)
			VALUES (pnoFolio,pcosto,phora,pfecha,pnoCliente,pnoAuto,pnoAsiento);
		DBMS_OUTPUT.PUT_LINE('Usuario: '||pnoCliente||' reservación realizada exitosa mente ');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Usuario: '||pnoCliente||' ya tiene reservacion en '||pidLinea||' '||pfecha||phora);	
	END IF;
END;
/

/********** procedimiento de borrado **************************/
/*   excec deleteCliente(noCliente)     */
CREATE or REPLACE PROCEDURE deleteCliente(cnoCliente in NUMBER)
AS
	tmp NUMBER (4);
BEGIN
	select noCliente INTO tmp FROM cliente
	WHERE noCliente = cnoCliente;
	IF SQL%NOTFOUND THEN
		DBMS_OUTPUT.PUT_LINE(cnoCliente||' no existe en la BD, operacion fallida');
	ELSE
		DBMS_OUTPUT.PUT_LINE(cnoCliente||' eliminado, operacion exitosa');
		DELETE FROM cliente WHERE noCliente = cnoCliente;
	END IF;
END;
/

