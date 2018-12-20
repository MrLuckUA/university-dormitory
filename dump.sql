--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: city; Type: TABLE; Schema: public; Owner: serhii
--

CREATE TABLE public.city (
    name character varying(255) NOT NULL,
    post_code integer NOT NULL
);


ALTER TABLE public.city OWNER TO serhii;

--
-- Name: contract; Type: TABLE; Schema: public; Owner: serhii
--

CREATE TABLE public.contract (
    contract_number integer NOT NULL,
    student_id integer NOT NULL,
    room_id integer NOT NULL,
    count double precision NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.contract OWNER TO serhii;

--
-- Name: dormitory; Type: TABLE; Schema: public; Owner: serhii
--

CREATE TABLE public.dormitory (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    university_id integer NOT NULL
);


ALTER TABLE public.dormitory OWNER TO serhii;

--
-- Name: dormitory_dormitory_id_seq; Type: SEQUENCE; Schema: public; Owner: serhii
--

CREATE SEQUENCE public.dormitory_dormitory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dormitory_dormitory_id_seq OWNER TO serhii;

--
-- Name: dormitory_dormitory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serhii
--

ALTER SEQUENCE public.dormitory_dormitory_id_seq OWNED BY public.dormitory.id;


--
-- Name: room; Type: TABLE; Schema: public; Owner: serhii
--

CREATE TABLE public.room (
    id integer NOT NULL,
    apartment_number character varying(10) NOT NULL,
    dormitory_id integer NOT NULL
);


ALTER TABLE public.room OWNER TO serhii;

--
-- Name: dormitory_room_id_seq; Type: SEQUENCE; Schema: public; Owner: serhii
--

CREATE SEQUENCE public.dormitory_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dormitory_room_id_seq OWNER TO serhii;

--
-- Name: dormitory_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serhii
--

ALTER SEQUENCE public.dormitory_room_id_seq OWNED BY public.room.id;


--
-- Name: university; Type: TABLE; Schema: public; Owner: serhii
--

CREATE TABLE public.university (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.university OWNER TO serhii;

--
-- Name: dormitory_university_id_seq; Type: SEQUENCE; Schema: public; Owner: serhii
--

CREATE SEQUENCE public.dormitory_university_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dormitory_university_id_seq OWNER TO serhii;

--
-- Name: dormitory_university_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serhii
--

ALTER SEQUENCE public.dormitory_university_id_seq OWNED BY public.university.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: serhii
--

CREATE TABLE public.student (
    student_number integer NOT NULL,
    course integer NOT NULL,
    "group" character varying(20) NOT NULL,
    room_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL
);


ALTER TABLE public.student OWNER TO serhii;

--
-- Name: dormitory id; Type: DEFAULT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.dormitory ALTER COLUMN id SET DEFAULT nextval('public.dormitory_dormitory_id_seq'::regclass);


--
-- Name: room id; Type: DEFAULT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.room ALTER COLUMN id SET DEFAULT nextval('public.dormitory_room_id_seq'::regclass);


--
-- Name: university id; Type: DEFAULT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.university ALTER COLUMN id SET DEFAULT nextval('public.dormitory_university_id_seq'::regclass);


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: serhii
--

COPY public.city (name, post_code) FROM stdin;
Івано-Франківськ	76000
Львів	79000
Чернівці	54561
Суми	45612
Київ	10000
\.


--
-- Data for Name: contract; Type: TABLE DATA; Schema: public; Owner: serhii
--

COPY public.contract (contract_number, student_id, room_id, count, date) FROM stdin;
56423	11582142	1	10000	2018-12-18 18:17:40.854511+00
11	11582142	1	5600	2018-12-19 19:53:26.072418+00
21315	12465	2	5600	2018-12-19 19:59:24.900562+00
46512	4746795	2	123412	2018-12-18 20:17:40.854+00
123568	648961	6	4564	2018-12-19 21:53:26.072+00
753952	962346	8	8512	2018-12-19 21:59:24.9+00
\.


--
-- Data for Name: dormitory; Type: TABLE DATA; Schema: public; Owner: serhii
--

COPY public.dormitory (id, name, university_id) FROM stdin;
1	Гуртожиток №5	1
2	Гуртожиток №2	1
3	Гуртожиток №4	2
4	Гуртожиток №12	3
5	Гуртожиток №21	4
6	Гуртожиток №7	2
7	Гуртожиток №40	3
8	Гуртожиток №32	4
9	Гуртожиток №35	3
10	Гуртожиток №14	4
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: serhii
--

COPY public.room (id, apartment_number, dormitory_id) FROM stdin;
1	708-Б	1
2	716-A	2
3	208-Б	3
4	732-A	4
5	212-С	5
6	666-А	6
7	777-Б	6
8	732-A	6
9	12-С	4
10	123-А	5
11	983-Б	6
12	456-A	3
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: serhii
--

COPY public.student (student_number, course, "group", room_id, first_name, last_name) FROM stdin;
11582142	3	ІПЗ-3	1	Serhii	Khortiuk
12465	3	КН-3	2	Вася	Пупкін
454611	1	СО-1	1	Some	User
6544654	2	КН-2	4	Петя	Пяточкін
4746795	4	ПІ-4	2	Андрій	Семенів
124465	2	НО-2	10	Юра	Абрамович
648961	1	Ф-1	6	Іван	Петров
962346	4	ПС-4	8	Степан	Федорів
\.


--
-- Data for Name: university; Type: TABLE DATA; Schema: public; Owner: serhii
--

COPY public.university (id, name, location_id) FROM stdin;
2	Чернівецький національний університет	54561
1	Прикарпатський національний університет імені Василя Стефаника	76000
3	Львівська політехніка	79000
4	Києво-Могилянська академія	10000
\.


--
-- Name: dormitory_dormitory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serhii
--

SELECT pg_catalog.setval('public.dormitory_dormitory_id_seq', 10, true);


--
-- Name: dormitory_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serhii
--

SELECT pg_catalog.setval('public.dormitory_room_id_seq', 12, true);


--
-- Name: dormitory_university_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serhii
--

SELECT pg_catalog.setval('public.dormitory_university_id_seq', 4, true);


--
-- Name: city dormitory_city_post_code_d9d2f271_pk; Type: CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT dormitory_city_post_code_d9d2f271_pk PRIMARY KEY (post_code);


--
-- Name: city dormitory_city_post_code_d9d2f271_uniq; Type: CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT dormitory_city_post_code_d9d2f271_uniq UNIQUE (post_code);


--
-- Name: contract dormitory_contract_pkey; Type: CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT dormitory_contract_pkey PRIMARY KEY (contract_number);


--
-- Name: dormitory dormitory_dormitory_pkey; Type: CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.dormitory
    ADD CONSTRAINT dormitory_dormitory_pkey PRIMARY KEY (id);


--
-- Name: room dormitory_room_pkey; Type: CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT dormitory_room_pkey PRIMARY KEY (id);


--
-- Name: student dormitory_student_pkey; Type: CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT dormitory_student_pkey PRIMARY KEY (student_number);


--
-- Name: university dormitory_university_pkey; Type: CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.university
    ADD CONSTRAINT dormitory_university_pkey PRIMARY KEY (id);


--
-- Name: dormitory_contract_room_id_252e9305; Type: INDEX; Schema: public; Owner: serhii
--

CREATE INDEX dormitory_contract_room_id_252e9305 ON public.contract USING btree (room_id);


--
-- Name: dormitory_contract_student_id_49cbb1a3; Type: INDEX; Schema: public; Owner: serhii
--

CREATE INDEX dormitory_contract_student_id_49cbb1a3 ON public.contract USING btree (student_id);


--
-- Name: dormitory_dormitory_university_id_d89d8934; Type: INDEX; Schema: public; Owner: serhii
--

CREATE INDEX dormitory_dormitory_university_id_d89d8934 ON public.dormitory USING btree (university_id);


--
-- Name: dormitory_room_dormitory_id_349dadd7; Type: INDEX; Schema: public; Owner: serhii
--

CREATE INDEX dormitory_room_dormitory_id_349dadd7 ON public.room USING btree (dormitory_id);


--
-- Name: dormitory_student_room_id_29c4e99b; Type: INDEX; Schema: public; Owner: serhii
--

CREATE INDEX dormitory_student_room_id_29c4e99b ON public.student USING btree (room_id);


--
-- Name: dormitory_university_location_id_1f316c84; Type: INDEX; Schema: public; Owner: serhii
--

CREATE INDEX dormitory_university_location_id_1f316c84 ON public.university USING btree (location_id);


--
-- Name: contract dormitory_contract_room_id_252e9305_fk_dormitory_room_id; Type: FK CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT dormitory_contract_room_id_252e9305_fk_dormitory_room_id FOREIGN KEY (room_id) REFERENCES public.room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contract dormitory_contract_student_id_49cbb1a3_fk_dormitory; Type: FK CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT dormitory_contract_student_id_49cbb1a3_fk_dormitory FOREIGN KEY (student_id) REFERENCES public.student(student_number) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dormitory dormitory_dormitory_university_id_d89d8934_fk_dormitory; Type: FK CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.dormitory
    ADD CONSTRAINT dormitory_dormitory_university_id_d89d8934_fk_dormitory FOREIGN KEY (university_id) REFERENCES public.university(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: room dormitory_room_dormitory_id_349dadd7_fk_dormitory_dormitory_id; Type: FK CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT dormitory_room_dormitory_id_349dadd7_fk_dormitory_dormitory_id FOREIGN KEY (dormitory_id) REFERENCES public.dormitory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: student dormitory_student_room_id_29c4e99b_fk_dormitory_room_id; Type: FK CONSTRAINT; Schema: public; Owner: serhii
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT dormitory_student_room_id_29c4e99b_fk_dormitory_room_id FOREIGN KEY (room_id) REFERENCES public.room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

