CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (
    id_pracownika int PRIMARY KEY NOT NULL,
    imie varchar(50) NOT NULL,
    nazwisko varchar(50),
    adres varchar(255),
	telefon int);

CREATE TABLE ksiegowosc.godziny (
    id_godziny int PRIMARY KEY NOT NULL,
    data date,
	liczba_godzin int,
	id_pracownika int,
	CONSTRAINT fkID FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika));

CREATE TABLE ksiegowosc.premie (
    id_premii int PRIMARY KEY NOT NULL,
    rodzaj varchar(50),
	kwota float);


CREATE TABLE ksiegowosc.pensje (
    id_pensji int PRIMARY KEY NOT NULL,
    stanowisko varchar(50) NOT NULL,
	kwota float,
	id_premii int,
	CONSTRAINT prID FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie (id_premii));


CREATE TABLE ksiegowosc.wynagrodzenie (
    id_wynagrodzenia int PRIMARY KEY NOT NULL,
    data date NOT NULL,
	id_pracownika int,
	CONSTRAINT praID FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika),
	id_godziny int,
	CONSTRAINT godID FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny (id_godziny),
	id_pensji int,
	CONSTRAINT penID FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje (id_pensji),
	id_premii int,
	CONSTRAINT preID FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie (id_premii));


	/*
	COMMENT ON TABLE ksiegowosc.pracownicy IS 'tabela pracownikow'
	COMMENT ON TABLE ksiegowosc.godziny IS 'tabela godzin'
	COMMENT ON TABLE ksiegowosc.premie IS 'tabela premii'
	COMMENT ON TABLE ksiegowosc.pensje IS 'tabela pensji'
	COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'tabela wynagrodzen'
	-- Je�eli uda�o mi si� znale�� rzetelne informacj� to powy�sze polecenia powinny dzialac w Postgres, niestety w sql server nie ma komendy odpoiwdajacej powyzszej.
	*/


	
	INSERT INTO ksiegowosc.pracownicy VALUES(1,'Adam','Adamiec','Podwale 7, 31-118 Krak�w',862625809);
	INSERT INTO ksiegowosc.pracownicy VALUES(2,'Ewa','Adamik','Studencka 1, 31-116 Krak�w',457589365);
	INSERT INTO ksiegowosc.pracownicy VALUES(3,'Antoni','Adamiuk','Krupnicza 10, 31-123 Krak�w',313231128);
	INSERT INTO ksiegowosc.pracownicy VALUES(4,'Zbigniew','Adamkeiwicz','Studencka 7, 31-116 Krak�w',069322912);
	INSERT INTO ksiegowosc.pracownicy VALUES(5,'Ryszard','Adamkowski','Krupnicza 14, 31-123 Krak�w',773422468);
	INSERT INTO ksiegowosc.pracownicy VALUES(6,'Szymon','Adamowicz','Krupnicza 18, 31-123 Krak�w',021344556);
	INSERT INTO ksiegowosc.pracownicy VALUES(7,'Kunegunda','Adam�w','Garncarska 3, 31-115 Krak�w',970813104);
	INSERT INTO ksiegowosc.pracownicy VALUES(8,'Eugenia','Adamek','Studencka 25/18, 31-116 Krak�w',811264400);
	INSERT INTO ksiegowosc.pracownicy VALUES(9,'Anna','Adamik','Napoleona Cybulskiego 8, 31-117 Krak�w',111656015);
	INSERT INTO ksiegowosc.pracownicy VALUES(10,'Sylwia','Adamkowska','Krupnicza 35, 31-123 Krak�w',015150615);
	
	INSERT INTO ksiegowosc.godziny VALUES(1,'2021-10-23',8,1);
	INSERT INTO ksiegowosc.godziny VALUES(2,'2021-10-23',8,2);
	INSERT INTO ksiegowosc.godziny VALUES(3,'2021-10-23',6,3);
	INSERT INTO ksiegowosc.godziny VALUES(4,'2021-10-24',7,4);
	INSERT INTO ksiegowosc.godziny VALUES(5,'2021-10-24',8,1);
	INSERT INTO ksiegowosc.godziny VALUES(6,'2021-10-24',4,2);
	INSERT INTO ksiegowosc.godziny VALUES(7,'2021-10-25',8,7);
	INSERT INTO ksiegowosc.godziny VALUES(8,'2021-10-26',3,9);
	INSERT INTO ksiegowosc.godziny VALUES(9,'2021-10-26',7,10);
	INSERT INTO ksiegowosc.godziny VALUES(10,'2021-10-27',3,1);
	
	INSERT INTO ksiegowosc.premie VALUES(1,'Premia regulaminowa',100);
	INSERT INTO ksiegowosc.premie VALUES(2,'Premia uznaniowa',150);
	INSERT INTO ksiegowosc.premie VALUES(3,'Premi� motywacyjna',50);
	INSERT INTO ksiegowosc.premie VALUES(4,'Premi� zadaniowa',500);
	INSERT INTO ksiegowosc.premie VALUES(5,'Premia prowizyjna',75);
	INSERT INTO ksiegowosc.premie VALUES(6,'Premia indywidualna lub zespo�owa',360);
	INSERT INTO ksiegowosc.premie VALUES(7,'Premia wynikowa',1000);
	INSERT INTO ksiegowosc.premie VALUES(8,'Premia uznaniowa',300);
	INSERT INTO ksiegowosc.premie VALUES(9,'Premia uznaniowa',500);
	INSERT INTO ksiegowosc.premie VALUES(10,'Premi� motywacyjna',200);
	
	INSERT INTO ksiegowosc.pensje VALUES(1,'Project Manager',20000,7);
	INSERT INTO ksiegowosc.pensje VALUES(2,'Analityk biznesowy',15000,3);
	INSERT INTO ksiegowosc.pensje VALUES(3,'UI/UX Designer',15000,6);
	INSERT INTO ksiegowosc.pensje VALUES(4,'Role techniczne',10000,6);
	INSERT INTO ksiegowosc.pensje VALUES(5,'Architekt systemu',15000,2);
	INSERT INTO ksiegowosc.pensje VALUES(6,'Programi�ci',9000,1);
	INSERT INTO ksiegowosc.pensje VALUES(7,'Testerzy',8000,1);
	INSERT INTO ksiegowosc.pensje VALUES(8,'Software Developer',10000,7);
	INSERT INTO ksiegowosc.pensje VALUES(9,'Web Developer',10000,10);
	INSERT INTO ksiegowosc.pensje VALUES(10,'Back-end Developer',10000,5);

	INSERT INTO ksiegowosc.wynagrodzenie VALUES(1,'2021-10-27',1,1,1,5);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(2,'2021-10-27',2,1,3,8);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(3,'2021-10-27',3,2,8,1);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(4,'2021-10-28',4,6,2,1);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(5,'2021-10-28',5,7,8,1);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(6,'2021-10-28',6,3,1,1);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(7,'2021-10-29',7,9,9,10);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(8,'2021-10-29',2,10,5,6);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(9,'2021-10-29',5,5,1,4);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(10,'2021-10-30',8,8,10,9);


	SELECT * From ksiegowosc.wynagrodzenie
	--a
	SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

	--b
	SELECT pracownicy.id_pracownika 
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	WHERE ksiegowosc.pensje.kwota > 10000;

	--c
	SELECT pracownicy.id_pracownika 
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	WHERE ksiegowosc.pensje.kwota > 10000 AND ksiegowosc.wynagrodzenie.id_premii LIKE NULL;


	--d
	SELECT imie
	FROM ksiegowosc.pracownicy
	WHERE imie LIKE 'A%';

	--e
	SELECT imie, nazwisko
	FROM ksiegowosc.pracownicy
	WHERE nazwisko LIKE '%e%' AND imie LIKE '%a';

	--f
	SELECT pracownicy.imie, pracownicy.nazwisko, SUM(godziny.liczba_godzin) - 10 AS 'liczba nadgoszin'
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.godziny 
	ON pracownicy.id_pracownika = godziny.id_pracownika
	GROUP BY pracownicy.id_pracownika, pracownicy.imie , pracownicy.nazwisko 
	HAVING SUM(godziny.liczba_godzin) >10;

	--g
	SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota
	FROM ksiegowosc.pensje
	JOIN ksiegowosc.wynagrodzenie
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	JOIN ksiegowosc.pracownicy
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	WHERE pensje.kwota BETWEEN 10000 AND 15000;

	--h
	SELECT pracownicy.imie, pracownicy.nazwisko
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.godziny 
	ON pracownicy.id_pracownika = godziny.id_pracownika
	JOIN ksiegowosc.wynagrodzenie
	ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	JOIN ksiegowosc.premie
	ON wynagrodzenie.id_premii = premie.id_premii
	WHERE wynagrodzenie.id_premii = 0
	GROUP BY pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko 
	HAVING SUM(godziny.liczba_godzin) >10;
	
	--i
	SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota
	FROM ksiegowosc.pensje
	JOIN ksiegowosc.wynagrodzenie
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	JOIN ksiegowosc.pracownicy
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	ORDER BY pensje.kwota;

	--j
	SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota, premie.kwota
	FROM ksiegowosc.pensje
	JOIN ksiegowosc.wynagrodzenie
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	JOIN ksiegowosc.pracownicy
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	JOIN ksiegowosc.premie
	ON wynagrodzenie.id_premii = premie.id_premii
	ORDER BY pensje.kwota, -premie.kwota;

	--k
	SELECT pensje.stanowisko, COUNT(pensje.stanowisko) AS ilosc
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	GROUP BY pensje.stanowisko;

	--l
	SELECT MIN(pensje.kwota + premie.kwota ) AS min, MAX(pensje.kwota+ premie.kwota) AS max, AVG(pensje.kwota+ premie.kwota) AS avg
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	JOIN ksiegowosc.premie
	ON wynagrodzenie.id_premii = premie.id_premii
	WHERE pensje.stanowisko = 'Project Manager';

	--m
	SELECT SUM(pensje.kwota + premie.kwota ) AS suma
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	JOIN ksiegowosc.premie
	ON wynagrodzenie.id_premii = premie.id_premii;

	--n
	SELECT pensje.stanowisko, SUM(pensje.kwota + premie.kwota ) AS suma
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	JOIN ksiegowosc.premie
	ON wynagrodzenie.id_premii = premie.id_premii
	GROUP BY pensje.stanowisko;

	--o	
	SELECT pensje.stanowisko, COUNT(premie.id_premii)
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	JOIN ksiegowosc.premie
	ON wynagrodzenie.id_premii = premie.id_premii
	GROUP BY pensje.stanowisko;

	--p
	DELETE FROM ksiegowosc.pracownicy
	WHERE pracownicy.id_pracownika IN( 
	SELECT pracownicy.id_pracownika
	FROM ksiegowosc.pensje
	JOIN ksiegowosc.wynagrodzenie
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	JOIN ksiegowosc.pracownicy
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	WHERE pensje.kwota like null)


	DELETE FROM ksiegowosc.godziny
	WHERE godziny.id_pracownika NOT IN( 
	SELECT wynagrodzenie.id_pracownika
	FROM ksiegowosc.wynagrodzenie)

	DELETE FROM ksiegowosc.wynagrodzenie
	WHERE wynagrodzenie.id_godziny in( 
	SELECT wynagrodzenie.id_godziny
	FROM ksiegowosc.pensje
	JOIN ksiegowosc.wynagrodzenie
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	JOIN ksiegowosc.pracownicy
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	WHERE pensje.kwota < 10200)
	


	SELECT * FROM ksiegowosc.pracownicy
	SELECT * FROM ksiegowosc.godziny
	SELECT * FROM ksiegowosc.wynagrodzenie