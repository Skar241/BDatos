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
/*Faltan restricciones de borrado*/


/* Procedimiento que verifique que al momento de hacer una reservación del cliente-asiento, no exista otra del mismo  **
**  cliente en esa fecha y hora, puede estar en otra línea de autobuses                                                */

CREATE OR REPLACE PROCEDURE addReservacion(pnoFolio IN NUMBER, pcosto IN NUMBER
	phora in VARCHAR2, pfecha in DATE, pnoCliente IN NUMBER, pnoAuto IN NUMBER,
	pnoAsiento IN NUMBER,pidLinea IN NUMBER)
AS
BEGIN
	SELECT idLinea INTO pidLinea 
	FROM reserva NATURAL JOIN autobus
	WHERE (noCliente = pnoCliente AND fecha = pfecha AND idLinea = pidLinea);
	IF SQL%NOTFOUND THEN
		INSERT INTO reserva(noFolio,costo,hora,fecha,noCliente,noAuto,noAsiento)
			VALUES (pnoFolio,pcosto,phora,pfecha,pnoCliente,pnoAuto,pnoAsiento,pidLinea);
	ELSE
		DBMS_OUTPUT.PUT_LINE('Usuario: '||pnoCliente||' ya tiene reservacion en '||pidLinea||' '||pfecha||phora);	
	END IF;
END;
/

/************** TRIGGER************/

CREATE OR REPLACE TRIGGER edoAsiento
AFTER
	INSERT   ON reserva
	FOR EACH ROW --al ser para cada tupla tendremos el id de esa tupla
DECLARE
	pfkautoAsiento reserva.noAuto,noAsiento%TYPE; --referenciamos una FK compuesta
BEGIN
	-- solo actualizamos valor del estatusAsiento
	UPDATE  autoAsiento
	SET  estatusAsiento = 'O'	
	WHERE  noAuto,noAsiento = pfkautoAsiento;
END edoAsiento ;
/