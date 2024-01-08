-- 1. Creazione della tabella VENDITE
CREATE TABLE VENDITE (
    id_transazione INT PRIMARY KEY,
    categoria_prodotto VARCHAR(50),
    costo DECIMAL(10, 2),
    sconto DECIMAL(10, 2)
);

-- 1. Creazione della tabella DETTAGLI_VENDITE
CREATE TABLE DETTAGLI_VENDITE (
    id_transazione INT PRIMARY KEY,
    data_transazione DATE,
    quantità INT
);

-- 2. Inserimenti nella tabella VENDITE
INSERT INTO VENDITE (id_transazione, categoria_prodotto, costo, sconto) VALUES
	(1, 'Elettronica', 500.00, 10.00),
    (2, 'Abbigliamento', 120.50, 5.00),
    (3, 'Casa', 300.00, 0.00),
    (4, 'Cucina', 520.00, 50.00),
    (5, 'Gioielli', 110.00, 8.00),
    (6, 'Sport', 280.00, 5.00),
    (7, 'Giochi', 480.00, 60.00),
    (8, 'Abbigliamento', 130.00, 7.00),
    (9, 'Cucina', 320.00, 70.00),
    (10, 'Elettronica', 510.00, 10.00),
    (11, 'Abbigliamento', 125.00, 80.00),
    (12, 'Casa', 290.00, 3.00),
    (13, 'Elettronica', 490.00, 8.00),
    (14, 'Gioielli', 118.00, 6.00),
    (15, 'Casa', 310.00, 2.00),
    (16, 'Elettronica', 505.00, 7.00),
    (17, 'Abbigliamento', 122.00, 5.00),
    (18, 'Giochi', 295.00, 4.00),
    (19, 'Elettronica', 495.00, 10.00),
    (20, 'Cucina', 115.00, 3.00),
    (21, 'Casa', 330.00, 15.00),
    (22, 'Giochi', 480.00, 12.00),
    (23, 'Giochi', 128.00, 80.00),
    (24, 'Casa', 310.00, 0.00),
    (25, 'Elettronica', 515.00, 10.00),
    (26, 'Abbigliamento', 121.00, 50.00),
    (27, 'Casa', 298.00, 3.00),
    (28, 'Gioielli', 485.00, 8.00),
    (29, 'Sport', 112.00, 6.00),
    (30, 'Casa', 325.00, 2.00),
    (31, 'Cucina', 510.00, 10.00),
    (32, 'Abbigliamento', 124.00, 4.00),
    (33, 'Casa', 300.00, 0.00),
    (34, 'Elettronica', 500.00, 10.00),
    (35, 'Abbigliamento', 115.00, 70.00),
    (36, 'Casa', 320.00, 15.00),
    (37, 'Elettronica', 490.00, 8.00),
    (38, 'Abbigliamento', 118.00, 6.00),
    (39, 'Cucina', 310.00, 2.00),
    (40, 'Sport', 505.00, 7.00);
    

-- 2. Inserimenti nella tabella DETTAGLI_VENDITE
INSERT INTO DETTAGLI_VENDITE (id_transazione, data_transazione, quantità) VALUES
    (1, '2023-01-08', 2),
    (2, '2023-10-19', 1),
    (3, '2023-11-10', 3),
    (4, '2023-03-08', 1),
    (5, '2023-10-09', 2),
    (6, '2023-02-19', 1),
    (7, '2023-01-05', 3),
    (8, '2023-11-09', 1),
    (9, '2023-03-10', 2),
    (10, '2023-05-08', 1),
    (11, '2023-10-19', 2),
    (12, '2023-02-10', 3),
    (13, '2023-03-08', 2),
    (14, '2023-05-09', 1),
    (15, '2023-03-05', 3),
    (16, '2023-01-19', 1),
    (17, '2023-05-09', 2),
    (18, '2023-04-19', 2),
    (19, '2023-06-08', 1),
    (20, '2023-04-09', 2),
    (21, '2023-08-19', 3),
    (22, '2023-10-08', 1),
    (23, '2023-06-19', 2),
    (24, '2023-08-10', 3),
    (25, '2023-07-08', 2),
    (26, '2023-09-19', 1),
    (27, '2023-01-05', 3),
    (28, '2023-01-08', 1),
    (29, '2023-04-05', 2),
    (30, '2023-07-05', 1),
    (31, '2023-08-08', 2),
    (32, '2023-12-09', 1),
    (33, '2023-12-10', 3),
    (34, '2023-05-08', 1),
    (35, '2023-09-09', 2),
    (36, '2023-12-10', 2),
    (37, '2023-04-08', 1),
    (38, '2023-08-09', 2),
    (39, '2023-12-10', 3),
    (40, '2023-04-05', 1);
    
    
-- 3. SELEZIONA TUTTE LE VENDITE AVVENUTE IN UNA SPECIFICA DATA
SELECT * 
FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
WHERE data_transazione='2023-01-08';

-- 3. SELEZIONA L'ELENCO DELLE VENDITE CON SCONTI MAGGIORI DEL 50%
SELECT * 
FROM VENDITE V 
WHERE sconto > 50;


-- 4. CALCOLA IL TOTALE DELLE VENDITE(COSTO) PER CATEGORIA
SELECT categoria_prodotto, SUM(costo) AS Totale_Vendite
FROM VENDITE 
GROUP BY categoria_prodotto;

-- 4. TROVA IL NUMERO TOTALE DI PRODOTTI VENDUTI PER OGNI CATEGORIA
SELECT categoria_prodotto, SUM(quantità) AS Totale_Prodotti_Venduti
FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
GROUP BY categoria_prodotto;


-- 5. SELEZIONA LE VENDITE DELL'ULTIMO TRIMESTRE
SELECT * 
FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
WHERE D.data_transazione BETWEEN '2023-10-01' AND '2023-12-31';

-- 5. RAGGRUPPA LE VENDITE PER MESE E CALCOLA IL TOTALE DELLE VENDITE
SELECT MONTH(D.data_transazione) AS MESE, SUM(V.costo) AS Totale_Vendite
FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
GROUP BY MESE
ORDER BY MESE;


-- 7. TROVA LA CATEGORIA CON LO SCONTO MEDIO PIU ALTO
SELECT categoria_prodotto, AVG(sconto) AS Sconto_Medio
FROM VENDITE 
GROUP BY categoria_prodotto
ORDER BY Sconto_Medio DESC
LIMIT 1;


/* 8. CONFRONTA LE VENDITE MESE PER MESE PER VEDERE L'INCREMENTO O IL DECREMENTO DELLE VENDITE.
CALCOLA L'INCREMENTO O DECREMENTO MESE PER MESE */

SELECT VM.MESE, VM.Vendite_Mese AS Vendite_correnti, (VM.Vendite_Mese - VP.Vendite_Mese) AS Incremento_decremento
FROM (
	SELECT MONTH(D.data_transazione) AS MESE, SUM(V.costo) AS Vendite_Mese
	FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
	GROUP BY MESE
) AS VM
LEFT JOIN (
	SELECT MONTH(D.data_transazione) AS MESE, SUM(V.costo) AS Vendite_Mese
	FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
	GROUP BY MESE
) AS VP ON VM.MESE = VP.MESE - 1
ORDER BY VM.MESE;


-- 9. CONFRONTA LE VENDITE TOTALI IN DIVERSE STAGIONI

SELECT 
    'Primavera' AS Stagione, SUM(VS.Vendite_Mese) AS Vendite_Totali
FROM (
    SELECT MONTH(D.data_transazione) AS MESE, SUM(V.costo) AS Vendite_Mese
    FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
    WHERE MONTH(D.data_transazione) IN (3, 4, 5)
    GROUP BY MESE
) AS VS

UNION ALL

SELECT 
    'Estate' AS Stagione, SUM(VS.Vendite_Mese) AS Vendite_Totali
FROM (
    SELECT MONTH(D.data_transazione) AS MESE, SUM(V.costo) AS Vendite_Mese
    FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
    WHERE MONTH(D.data_transazione) IN (6, 7, 8)
    GROUP BY MESE
) AS VS

UNION ALL

SELECT 
    'Autunno' AS Stagione, SUM(VS.Vendite_Mese) AS Vendite_Totali
FROM (
    SELECT MONTH(D.data_transazione) AS MESE, SUM(V.costo) AS Vendite_Mese
    FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
    WHERE MONTH(D.data_transazione) IN (9, 10, 11)
    GROUP BY MESE
) AS VS

UNION ALL

SELECT 
    'Inverno' AS Stagione, SUM(VS.Vendite_Mese) AS Vendite_Totali
FROM (
    SELECT MONTH(D.data_transazione) AS MESE, SUM(V.costo) AS Vendite_Mese
    FROM VENDITE V JOIN DETTAGLI_VENDITE D ON V.id_transazione = D.id_transazione 
    WHERE MONTH(D.data_transazione) IN (12, 1, 2)
    GROUP BY MESE
) AS VS
ORDER BY Stagione;


/* 10. SUPPONENDO DI AVERE UNA TABELLA CLIENTI CON I CAMPI IDCLIENTE E IDVENDITA,
SCRIVI UNA QUERY PER TROVARE I TOP 5 CLIENTI CON IL MAGGIOR NUMERO DI ACQUISTI */

--  Creazione della tabella CLIENTI
CREATE TABLE CLIENTI (
    id_cliente INT,
    id_vendita INT
);

-- Inserimenti nella tabella CLIENTI
INSERT INTO CLIENTI (id_cliente, id_vendita) VALUES
	(101, 1),
	(102, 2),
    (103, 3),
    (104, 4),
    (105, 5),
    (106, 6),
    (107, 7),
    (108, 8),
    (109, 9),
    (110, 10),
    (101, 11),
    (102, 12),
    (101, 13),
    (103, 14),
    (103, 15),
	(101, 16),
	(102, 17),
    (103, 18),
    (104, 19),
    (105, 20),
    (106, 21),
    (107, 22),
    (108, 23),
    (109, 24),
    (110, 25),
    (101, 26),
	(102, 27),
    (103, 28),
    (104, 29),
    (105, 30),
    (106, 31),
    (107, 32),
    (108, 33),
    (109, 34),
    (110, 35),
    (101, 36),
	(102, 37),
    (101, 38),
    (101, 39),
    (105, 40);
    
    
    SELECT id_cliente, COUNT(id_vendita) AS Numero_Acquisti
    FROM CLIENTI
    GROUP BY id_cliente
    ORDER BY Numero_Acquisti DESC
    LIMIT 5;

