CREATE TABLE model (
    id_modelu SERIAL PRIMARY KEY,
    nazwa_modelu VARCHAR(50) NOT NULL,
    nazwa_producenta VARCHAR(50) NOT NULL,
    poziom_zaawansowania VARCHAR(20),
    nazwa_typu VARCHAR(50) NOT NULL 
);

CREATE TABLE sprzet (
    id_sprzetu SERIAL PRIMARY KEY,
    id_modelu INT REFERENCES model(id_modelu) NOT NULL,
	dlugosc DECIMAL(5,2) NOT NULL,
	liczba_sztuk INT NOT NULL
);

CREATE TABLE klienci (
    id_klienta SERIAL PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    telefon VARCHAR(20),
    adres VARCHAR(150) NOT NULL,
    data_urodzenia DATE NOT NULL
);

CREATE TABLE wypozyczenia (
    id_wypozyczenia SERIAL PRIMARY KEY,
    id_klienta INT REFERENCES klienci(id_klienta) NOT NULL,
    id_sprzetu INT REFERENCES sprzet(id_sprzetu) NOT NULL,
    data_wypozyczenia DATE NOT NULL,
    data_do_zwrotu DATE NOT NULL,
    data_zwrotu DATE,
    status VARCHAR(20) NOT NULL,
    koszt DECIMAL(10, 2) NOT NULL
);

CREATE TABLE platnosci (
    id_platnosci SERIAL PRIMARY KEY,
    id_wypozyczenia INT REFERENCES wypozyczenia(id_wypozyczenia) NOT NULL,
    data_platnosci DATE NOT NULL,
    kwota DECIMAL(10, 2) NOT NULL,
    metoda_platnosci VARCHAR(20) NOT NULL
);

CREATE TABLE znizki (
    id_klienta INT PRIMARY KEY REFERENCES klienci(id_klienta),
	rabat INT
);