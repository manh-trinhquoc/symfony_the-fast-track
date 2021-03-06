--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

--
-- Data for Name: conference; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.conference (id, city, year, is_international, slug) FROM stdin;
1	Hanoi	2020	f	hanoi-2020
2	Hochimin	2019	f	hochimin-2019
3	Hanoi - international	2020	t	hanoi - international-2020
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.comment (id, conference_id, author, text, email, created_at, photo_filename) FROM stdin;
2	2	manhtq	comment	manhtq@gmail.com	2021-04-17 21:57:00	\N
3	1	manhtq2	coment 2	manhtq2@gmail.com	2021-03-18 09:54:00	\N
4	2	manhtq	test	manhtq2@gmail.com	2021-04-10 01:03:00	/images/under-construction.gif
5	2	manhtq22	22222	manhtq22@gmail.com	2021-04-08 00:02:00	/images/under-construction.gif
6	2	manhtq33	333	manhtq33@gmail.com	2021-04-03 11:07:00	\N
7	3	manhtq3334	4444	manhtq4@gmail.com	2021-04-08 10:07:00	\N
8	1	manhtq24	444	manhtq24@gmail.com	2021-04-09 10:08:00	\N
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20210401041250	2021-04-01 06:15:48	77
DoctrineMigrations\\Version20210405070451	2021-04-05 09:08:40	113
DoctrineMigrations\\Version20210405092726	2021-04-05 11:39:02	60
DoctrineMigrations\\Version20210405094123	2021-04-05 11:42:01	52
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.sessions (sess_id, sess_data, sess_lifetime, sess_time) FROM stdin;
\.


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.comment_id_seq', 8, true);


--
-- Name: conference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.conference_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

