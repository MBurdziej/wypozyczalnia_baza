--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Ubuntu 16.3-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: klienci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.klienci (
    id_klienta integer NOT NULL,
    imie character varying(50) NOT NULL,
    nazwisko character varying(50) NOT NULL,
    email character varying(100),
    telefon character varying(20),
    adres character varying(150) NOT NULL,
    data_urodzenia date NOT NULL
);


ALTER TABLE public.klienci OWNER TO postgres;

--
-- Name: klienci_id_klienta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.klienci_id_klienta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.klienci_id_klienta_seq OWNER TO postgres;

--
-- Name: klienci_id_klienta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.klienci_id_klienta_seq OWNED BY public.klienci.id_klienta;


--
-- Name: model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model (
    id_modelu integer NOT NULL,
    nazwa_modelu character varying(50) NOT NULL,
    nazwa_producenta character varying(50) NOT NULL,
    poziom_zaawansowania character varying(20),
    nazwa_typu character varying(50) NOT NULL
);


ALTER TABLE public.model OWNER TO postgres;

--
-- Name: model_id_modelu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.model_id_modelu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.model_id_modelu_seq OWNER TO postgres;

--
-- Name: model_id_modelu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model_id_modelu_seq OWNED BY public.model.id_modelu;


--
-- Name: platnosci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platnosci (
    id_platnosci integer NOT NULL,
    id_wypozyczenia integer NOT NULL,
    data_platnosci date NOT NULL,
    kwota numeric(10,2) NOT NULL,
    metoda_platnosci character varying(20) NOT NULL
);


ALTER TABLE public.platnosci OWNER TO postgres;

--
-- Name: platnosci_id_platnosci_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.platnosci_id_platnosci_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.platnosci_id_platnosci_seq OWNER TO postgres;

--
-- Name: platnosci_id_platnosci_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.platnosci_id_platnosci_seq OWNED BY public.platnosci.id_platnosci;


--
-- Name: sprzet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprzet (
    id_sprzetu integer NOT NULL,
    id_modelu integer NOT NULL,
    dlugosc numeric(5,2) NOT NULL,
    liczba_sztuk integer NOT NULL
);


ALTER TABLE public.sprzet OWNER TO postgres;

--
-- Name: sprzet_id_sprzetu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sprzet_id_sprzetu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sprzet_id_sprzetu_seq OWNER TO postgres;

--
-- Name: sprzet_id_sprzetu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sprzet_id_sprzetu_seq OWNED BY public.sprzet.id_sprzetu;


--
-- Name: wypozyczenia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wypozyczenia (
    id_wypozyczenia integer NOT NULL,
    id_klienta integer NOT NULL,
    id_sprzetu integer NOT NULL,
    data_wypozyczenia date NOT NULL,
    data_do_zwrotu date NOT NULL,
    data_zwrotu date,
    status character varying(20) NOT NULL,
    koszt numeric(10,2) NOT NULL
);


ALTER TABLE public.wypozyczenia OWNER TO postgres;

--
-- Name: wypozyczenia_id_wypozyczenia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wypozyczenia_id_wypozyczenia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wypozyczenia_id_wypozyczenia_seq OWNER TO postgres;

--
-- Name: wypozyczenia_id_wypozyczenia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wypozyczenia_id_wypozyczenia_seq OWNED BY public.wypozyczenia.id_wypozyczenia;


--
-- Name: znizki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.znizki (
    id_klienta integer NOT NULL,
    rabat integer
);


ALTER TABLE public.znizki OWNER TO postgres;

--
-- Name: klienci id_klienta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci ALTER COLUMN id_klienta SET DEFAULT nextval('public.klienci_id_klienta_seq'::regclass);


--
-- Name: model id_modelu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model ALTER COLUMN id_modelu SET DEFAULT nextval('public.model_id_modelu_seq'::regclass);


--
-- Name: platnosci id_platnosci; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platnosci ALTER COLUMN id_platnosci SET DEFAULT nextval('public.platnosci_id_platnosci_seq'::regclass);


--
-- Name: sprzet id_sprzetu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprzet ALTER COLUMN id_sprzetu SET DEFAULT nextval('public.sprzet_id_sprzetu_seq'::regclass);


--
-- Name: wypozyczenia id_wypozyczenia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wypozyczenia ALTER COLUMN id_wypozyczenia SET DEFAULT nextval('public.wypozyczenia_id_wypozyczenia_seq'::regclass);


--
-- Data for Name: klienci; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.klienci (id_klienta, imie, nazwisko, email, telefon, adres, data_urodzenia) FROM stdin;
1	Jan	Kowalski	jan.kowalski@example.com	123456789	ul. Długa 10, Warszawa	1985-05-15
2	Anna	Nowak	NULL	987654321	ul. Krótka 5, Kraków	1990-08-22
3	Piotr	Wójcik	piotr.wojcik@example.com	NULL	ul. Szeroka 20, Gdańsk	1983-12-01
4	Ewa	Zielińska	ewa.zielinska@example.com	444555666	ul. Wąska 7, Wrocław	1995-04-12
5	Marek	Lewandowski	NULL	333444555	ul. Prosta 3, Poznań	1987-11-18
6	Magdalena	Wilczyńska	magdalena.wilczynska@example.com	222333444	ul. Cicha 2, Łódź	1992-07-30
7	Tomasz	Kwiatkowski	tomasz.kwiatkowski@example.com	NULL	ul. Rynek 9, Katowice	1989-02-27
8	Karolina	Nowicka	karolina.nowicka@example.com	999888777	ul. Piekna 6, Szczecin	1993-03-16
9	Robert	Jankowski	NULL	888777666	ul. Tęczowa 12, Lublin	1982-09-21
10	Agnieszka	Wieczorek	agnieszka.wieczorek@example.com	777666555	ul. Łączna 8, Bydgoszcz	1991-10-10
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model (id_modelu, nazwa_modelu, nazwa_producenta, poziom_zaawansowania, nazwa_typu) FROM stdin;
1	Speedster	Atomic	Zaawansowany	Narty
2	Explorer	Salomon	Średniozaawansowany	Narty
3	RaceMaster	Blizzard	NULL	Narty
4	SnowCruiser	Rossignol	Początkujący	Narty
5	BoardXtreme	Burton	Zaawansowany	Deska
6	AllMountain	K2	NULL	Deska
7	FreestylePro	Lib Tech	Zaawansowany	Deska
8	UrbanRider	GNU	Średniozaawansowany	Deska
9	PowderKing	Völkl	Średniozaawansowany	Narty
10	GlideMaster	Head	Początkujący	Narty
\.


--
-- Data for Name: platnosci; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.platnosci (id_platnosci, id_wypozyczenia, data_platnosci, kwota, metoda_platnosci) FROM stdin;
11	1	2024-01-05	150.00	Karta kredytowa
12	2	2024-01-06	130.00	Przelew bankowy
13	3	2024-01-07	140.00	Karta kredytowa
14	4	2024-01-08	120.00	Gotówka
15	5	2024-01-09	160.00	Przelew bankowy
16	6	2024-01-10	110.00	Karta kredytowa
17	7	2024-01-11	140.00	Gotówka
18	8	2024-01-12	130.00	Przelew bankowy
19	9	2024-01-13	150.00	Karta kredytowa
20	10	2024-01-14	120.00	Gotówka
\.


--
-- Data for Name: sprzet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprzet (id_sprzetu, id_modelu, dlugosc, liczba_sztuk) FROM stdin;
1	1	160.00	5
2	2	155.50	3
3	3	165.75	4
4	4	150.25	4
5	5	158.40	7
6	6	145.90	6
7	7	152.70	8
8	8	147.60	5
9	9	161.00	4
10	10	153.50	2
\.


--
-- Data for Name: wypozyczenia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wypozyczenia (id_wypozyczenia, id_klienta, id_sprzetu, data_wypozyczenia, data_do_zwrotu, data_zwrotu, status, koszt) FROM stdin;
1	1	1	2024-01-05	2024-01-12	2024-01-12	Zwrócony	150.00
2	2	2	2024-01-06	2024-01-13	2024-01-13	Zwrócony	130.00
3	3	3	2024-01-07	2024-01-14	2024-01-14	Zwrócony	140.00
4	4	4	2024-01-08	2024-01-15	\N	Wypożyczony	120.00
5	5	5	2024-01-09	2024-01-16	2024-01-16	Zwrócony	160.00
6	6	6	2024-01-10	2024-01-17	2024-01-17	Zwrócony	110.00
7	7	7	2024-01-11	2024-01-18	2024-01-18	Zwrócony	140.00
8	8	8	2024-01-12	2024-01-19	2024-01-19	Zwrócony	130.00
9	9	9	2024-01-13	2024-01-20	2024-01-20	Zwrócony	150.00
10	10	10	2024-01-14	2024-01-21	2024-01-21	Zwrócony	120.00
\.


--
-- Data for Name: znizki; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.znizki (id_klienta, rabat) FROM stdin;
1	10
3	5
5	10
6	25
8	15
\.


--
-- Name: klienci_id_klienta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.klienci_id_klienta_seq', 10, true);


--
-- Name: model_id_modelu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model_id_modelu_seq', 10, true);


--
-- Name: platnosci_id_platnosci_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.platnosci_id_platnosci_seq', 20, true);


--
-- Name: sprzet_id_sprzetu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprzet_id_sprzetu_seq', 10, true);


--
-- Name: wypozyczenia_id_wypozyczenia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wypozyczenia_id_wypozyczenia_seq', 10, true);


--
-- Name: klienci klienci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci
    ADD CONSTRAINT klienci_pkey PRIMARY KEY (id_klienta);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id_modelu);


--
-- Name: platnosci platnosci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platnosci
    ADD CONSTRAINT platnosci_pkey PRIMARY KEY (id_platnosci);


--
-- Name: sprzet sprzet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprzet
    ADD CONSTRAINT sprzet_pkey PRIMARY KEY (id_sprzetu);


--
-- Name: wypozyczenia wypozyczenia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wypozyczenia
    ADD CONSTRAINT wypozyczenia_pkey PRIMARY KEY (id_wypozyczenia);


--
-- Name: znizki znizki_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.znizki
    ADD CONSTRAINT znizki_pkey PRIMARY KEY (id_klienta);


--
-- Name: sprzet sprzet_id_modelu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprzet
    ADD CONSTRAINT sprzet_id_modelu_fkey FOREIGN KEY (id_modelu) REFERENCES public.model(id_modelu);


--
-- Name: wypozyczenia wypozyczenia_id_klienta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wypozyczenia
    ADD CONSTRAINT wypozyczenia_id_klienta_fkey FOREIGN KEY (id_klienta) REFERENCES public.klienci(id_klienta);


--
-- Name: wypozyczenia wypozyczenia_id_sprzetu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wypozyczenia
    ADD CONSTRAINT wypozyczenia_id_sprzetu_fkey FOREIGN KEY (id_sprzetu) REFERENCES public.sprzet(id_sprzetu);


--
-- Name: znizki znizki_id_klienta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.znizki
    ADD CONSTRAINT znizki_id_klienta_fkey FOREIGN KEY (id_klienta) REFERENCES public.klienci(id_klienta);


--
-- PostgreSQL database dump complete
--

