# wypozyczalnia_baza

# Wypożyczalnia Sprzętu - Dokumentacja Bazy Danych

## Spis treści

1. Diagram relacji
2. Struktura Tabel
3. Przykładowe Dane

## Diagram

Diagram przedstawia relacje pomiędzy tabelami w bazie danych.

![diagram](https://github.com/MBurdziej/wypozyczalnia_baza/assets/108184079/bcf28ee0-b12a-436c-840c-bbcf64b427f6)


## Struktura Tabel

### Tabela: `model`

| Kolumna                | Typ            | Null | Opis                          |
|------------------------|----------------|------|-------------------------------|
| `id_modelu`            | SERIAL         | NN   | Klucz główny                  |
| `nazwa_modelu`         | VARCHAR(50)    | NN   | Nazwa modelu                  |
| `nazwa_producenta`     | VARCHAR(50)    | NN   | Nazwa producenta              |
| `poziom_zaawansowania` | VARCHAR(20)    |      | Poziom zaawansowania          |
| `nazwa_typu`           | VARCHAR(50)    | NN   | Typ sprzętu (narty, deska)    |

### Tabela: `sprzet`

| Kolumna        | Typ         | Null | Opis                          |
|----------------|-------------|------|-------------------------------|
| `id_sprzetu`   | SERIAL      | NN   | Klucz główny                  |
| `id_modelu`    | INT         | NN   | Klucz obcy do tabeli `model`  |
| `dlugosc`      | DECIMAL(5,2)| NN   | Długość sprzętu               |
| `liczba_sztuk` | INT         | NN   | Liczba sztuk dostępnych       |

### Tabela: `klienci`

| Kolumna        | Typ         | Null | Opis                          |
|----------------|-------------|------|-------------------------------|
| `id_klienta`   | SERIAL      | NN   | Klucz główny                  |
| `imie`         | VARCHAR(50) | NN   | Imię klienta                  |
| `nazwisko`     | VARCHAR(50) | NN   | Nazwisko klienta              |
| `email`        | VARCHAR(100)|      | Email klienta                 |
| `telefon`      | VARCHAR(20) |      | Telefon klienta               |
| `adres`        | VARCHAR(150)| NN   | Adres klienta                 |
| `data_urodzenia`| DATE       | NN   | Data urodzenia klienta        |

### Tabela: `wypozyczenia`

| Kolumna            | Typ        | Null | Opis                                     |
|--------------------|--------------|------|----------------------------------------|
| `id_wypozyczenia`  | SERIAL       | NN   | Klucz główny                           |
| `id_klienta`       | INT          | NN   | Klucz obcy do tabeli `klienci`         |
| `id_sprzetu`       | INT          | NN   | Klucz obcy do tabeli `sprzet`          |
| `data_wypozyczenia`| DATE         | NN   | Data wypożyczenia                      |
| `data_do_zwrotu`   | DATE         | NN   | Data, do której sprzęt ma być zwrócony |
| `data_zwrotu`      | DATE         |      | Data zwrotu sprzętu                    |
| `status`           | VARCHAR(20)  | NN   | Status wypożyczenia                    |
| `koszt`            | DECIMAL(10,2)| NN   | Koszt wypożyczenia                     |

### Tabela: `platnosci`

| Kolumna           | Typ          | Null | Opis                                |
|-------------------|--------------|------|-------------------------------------|
| `id_platnosci`    | SERIAL       |  NN  | Klucz główny                        |
| `id_wypozyczenia` | INT          |  NN  | Klucz obcy do tabeli `wypozyczenia` |
| `data_platnosci`  | DATE         |  NN  | Data płatności                      |
| `kwota`           | DECIMAL(10,2)|  NN  | Kwota płatności                     |
| `metoda_platnosci`| VARCHAR(20)  |  NN  | Metoda płatności                    |

### Tabela: `znizki`

| Kolumna       | Typ        | Null | Opis                          |
|---------------|------------|------|-------------------------------|
| `id_klienta`  | INT        | NN   | Klucz obcy do tabeli `klienci`|
| `rabat`       | INT        |      | Wartość rabatu                |

## Przykładowe Dane

### Tabela: `model`

![model](https://github.com/MBurdziej/wypozyczalnia_baza/assets/108184079/5cf7c9de-1fde-4a8d-a386-c0364b5d8ee7)


### Tabela: `sprzet`

![sprzet](https://github.com/MBurdziej/wypozyczalnia_baza/assets/108184079/12fa3ffa-9612-422a-be56-1fd4f0cf5ed2)


### Tabela: `klienci`

![klienci](https://github.com/MBurdziej/wypozyczalnia_baza/assets/108184079/cad13684-a29f-424e-917d-e2fc75d68797)


### Tabela: `wypozyczenia`

![wypozyczenia](https://github.com/MBurdziej/wypozyczalnia_baza/assets/108184079/55076301-07a0-4477-8e2d-afa921776da5)

### Tabela: `platnosci`

![platnosci](https://github.com/MBurdziej/wypozyczalnia_baza/assets/108184079/c5cd4233-906d-4a52-802f-55e8b26f33e9)

### Tabela: `znizki`

![znizki](https://github.com/MBurdziej/wypozyczalnia_baza/assets/108184079/ee7ef988-4ce5-4692-b353-8fe510126039)



