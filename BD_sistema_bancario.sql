--
-- PostgreSQL database dump
--

-- Database: sistema_bancario_1

-- DROP DATABASE IF EXISTS sistema_bancario;

CREATE DATABASE sistema_bancario
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE public.clientes (
    cliente_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    direccion text,
    telefono character varying(20),
    correo_electronico character varying(100),
    fecha_nacimiento date,
    estado character varying(20),
    CONSTRAINT clientes_estado_check CHECK (((estado)::text = ANY ((ARRAY['activo'::character varying, 'inactivo'::character varying])::text[])))
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16683)
-- Name: clientes_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_cliente_id_seq OWNED BY public.clientes.cliente_id;


--
-- TOC entry 218 (class 1259 OID 16694)
-- Name: cuentas_bancarias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas_bancarias (
    cuenta_id integer NOT NULL,
    cliente_id integer,
    numero_cuenta character varying(50) NOT NULL,
    tipo_cuenta character varying(20),
    saldo numeric(15,2) DEFAULT 0.00,
    fecha_apertura date,
    estado character varying(20),
    CONSTRAINT cuentas_bancarias_estado_check CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'cerrada'::character varying])::text[]))),
    CONSTRAINT cuentas_bancarias_tipo_cuenta_check CHECK (((tipo_cuenta)::text = ANY ((ARRAY['corriente'::character varying, 'ahorro'::character varying])::text[])))
);


ALTER TABLE public.cuentas_bancarias OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16693)
-- Name: cuentas_bancarias_cuenta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuentas_bancarias_cuenta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuentas_bancarias_cuenta_id_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 217
-- Name: cuentas_bancarias_cuenta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuentas_bancarias_cuenta_id_seq OWNED BY public.cuentas_bancarias.cuenta_id;


--
-- TOC entry 233 (class 1259 OID 16921)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    departamento_id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16920)
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_departamento_id_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 232
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_departamento_id_seq OWNED BY public.departamentos.departamento_id;


--
-- TOC entry 224 (class 1259 OID 16745)
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    empleado_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    direccion text,
    telefono character varying(20),
    correo_electronico character varying(100),
    fecha_contratacion date,
    posicion character varying(100),
    salario numeric(15,2),
    sucursal_id integer,
    departamento_id integer
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16744)
-- Name: empleados_empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleados_empleado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleados_empleado_id_seq OWNER TO postgres;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 223
-- Name: empleados_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleados_empleado_id_seq OWNED BY public.empleados.empleado_id;


--
-- TOC entry 228 (class 1259 OID 16769)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    prestamo_id integer NOT NULL,
    cuenta_id integer,
    monto numeric(15,2),
    tasa_interes numeric(5,2),
    fecha_inicio date,
    fecha_fin date,
    estado character varying(20),
    CONSTRAINT prestamos_estado_check CHECK (((estado)::text = ANY ((ARRAY['activo'::character varying, 'pagado'::character varying])::text[])))
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16768)
-- Name: prestamos_prestamo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamos_prestamo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prestamos_prestamo_id_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_prestamo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamos_prestamo_id_seq OWNED BY public.prestamos.prestamo_id;


--
-- TOC entry 226 (class 1259 OID 16759)
-- Name: productos_financieros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos_financieros (
    producto_id integer NOT NULL,
    nombre_producto character varying(100) NOT NULL,
    tipo_producto character varying(50),
    descripcion text,
    tasa_interes numeric(5,2),
    CONSTRAINT productos_financieros_tipo_producto_check CHECK (((tipo_producto)::text = ANY ((ARRAY['préstamo'::character varying, 'tarjeta de crédito'::character varying, 'seguro'::character varying])::text[])))
);


ALTER TABLE public.productos_financieros OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16758)
-- Name: productos_financieros_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_financieros_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_financieros_producto_id_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_financieros_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_financieros_producto_id_seq OWNED BY public.productos_financieros.producto_id;


--
-- TOC entry 231 (class 1259 OID 16796)
-- Name: relacion_clientes_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relacion_clientes_productos (
    cliente_id integer NOT NULL,
    producto_id integer NOT NULL,
    fecha_adquisicion date
);


ALTER TABLE public.relacion_clientes_productos OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16736)
-- Name: sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursales (
    sucursal_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion text,
    telefono character varying(20)
);


ALTER TABLE public.sucursales OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16735)
-- Name: sucursales_sucursal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursales_sucursal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sucursales_sucursal_id_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 221
-- Name: sucursales_sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursales_sucursal_id_seq OWNED BY public.sucursales.sucursal_id;


--
-- TOC entry 230 (class 1259 OID 16782)
-- Name: tarjetas_credito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarjetas_credito (
    tarjeta_id integer NOT NULL,
    cuenta_id integer,
    numero_tarjeta character varying(50) NOT NULL,
    limite_credito numeric(15,2),
    saldo_actual numeric(15,2),
    fecha_emision date,
    fecha_vencimiento date,
    estado character varying(20),
    CONSTRAINT tarjetas_credito_estado_check CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'bloqueada'::character varying])::text[])))
);


ALTER TABLE public.tarjetas_credito OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16781)
-- Name: tarjetas_credito_tarjeta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarjetas_credito_tarjeta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tarjetas_credito_tarjeta_id_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 229
-- Name: tarjetas_credito_tarjeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarjetas_credito_tarjeta_id_seq OWNED BY public.tarjetas_credito.tarjeta_id;


--
-- TOC entry 220 (class 1259 OID 16711)
-- Name: transacciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transacciones (
    transaccion_id integer NOT NULL,
    cuenta_id integer,
    tipo_transaccion character varying(20),
    monto numeric(15,2),
    fecha_transaccion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    descripcion text,
    CONSTRAINT transacciones_tipo_transaccion_check CHECK (((tipo_transaccion)::text = ANY ((ARRAY['depósito'::character varying, 'retiro'::character varying, 'transferencia'::character varying])::text[])))
);


ALTER TABLE public.transacciones OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16710)
-- Name: transacciones_transaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transacciones_transaccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transacciones_transaccion_id_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 219
-- Name: transacciones_transaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transacciones_transaccion_id_seq OWNED BY public.transacciones.transaccion_id;


--
-- TOC entry 4732 (class 2604 OID 16687)
-- Name: clientes cliente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN cliente_id SET DEFAULT nextval('public.clientes_cliente_id_seq'::regclass);


--
-- TOC entry 4733 (class 2604 OID 16697)
-- Name: cuentas_bancarias cuenta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_bancarias ALTER COLUMN cuenta_id SET DEFAULT nextval('public.cuentas_bancarias_cuenta_id_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 16924)
-- Name: departamentos departamento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN departamento_id SET DEFAULT nextval('public.departamentos_departamento_id_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 16748)
-- Name: empleados empleado_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados ALTER COLUMN empleado_id SET DEFAULT nextval('public.empleados_empleado_id_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 16772)
-- Name: prestamos prestamo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos ALTER COLUMN prestamo_id SET DEFAULT nextval('public.prestamos_prestamo_id_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 16762)
-- Name: productos_financieros producto_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_financieros ALTER COLUMN producto_id SET DEFAULT nextval('public.productos_financieros_producto_id_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 16739)
-- Name: sucursales sucursal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN sucursal_id SET DEFAULT nextval('public.sucursales_sucursal_id_seq'::regclass);


--
-- TOC entry 4741 (class 2604 OID 16785)
-- Name: tarjetas_credito tarjeta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_credito ALTER COLUMN tarjeta_id SET DEFAULT nextval('public.tarjetas_credito_tarjeta_id_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16714)
-- Name: transacciones transaccion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transacciones ALTER COLUMN transaccion_id SET DEFAULT nextval('public.transacciones_transaccion_id_seq'::regclass);

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_cliente_id_seq', 1, false);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 217
-- Name: cuentas_bancarias_cuenta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuentas_bancarias_cuenta_id_seq', 1, false);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 232
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_departamento_id_seq', 1, false);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 223
-- Name: empleados_empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleados_empleado_id_seq', 1, false);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_prestamo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamos_prestamo_id_seq', 1, false);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_financieros_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_financieros_producto_id_seq', 1, false);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 221
-- Name: sucursales_sucursal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursales_sucursal_id_seq', 1, false);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 229
-- Name: tarjetas_credito_tarjeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarjetas_credito_tarjeta_id_seq', 1, false);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 219
-- Name: transacciones_transaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transacciones_transaccion_id_seq', 1, false);


--
-- TOC entry 4751 (class 2606 OID 16692)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cliente_id);


--
-- TOC entry 4753 (class 2606 OID 16704)
-- Name: cuentas_bancarias cuentas_bancarias_numero_cuenta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_bancarias
    ADD CONSTRAINT cuentas_bancarias_numero_cuenta_key UNIQUE (numero_cuenta);


--
-- TOC entry 4755 (class 2606 OID 16702)
-- Name: cuentas_bancarias cuentas_bancarias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_bancarias
    ADD CONSTRAINT cuentas_bancarias_pkey PRIMARY KEY (cuenta_id);


--
-- TOC entry 4773 (class 2606 OID 16926)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (departamento_id);


--
-- TOC entry 4761 (class 2606 OID 16752)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (empleado_id);


--
-- TOC entry 4765 (class 2606 OID 16775)
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (prestamo_id);


--
-- TOC entry 4763 (class 2606 OID 16767)
-- Name: productos_financieros productos_financieros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_financieros
    ADD CONSTRAINT productos_financieros_pkey PRIMARY KEY (producto_id);


--
-- TOC entry 4771 (class 2606 OID 16800)
-- Name: relacion_clientes_productos relacion_clientes_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relacion_clientes_productos
    ADD CONSTRAINT relacion_clientes_productos_pkey PRIMARY KEY (cliente_id, producto_id);


--
-- TOC entry 4759 (class 2606 OID 16743)
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (sucursal_id);


--
-- TOC entry 4767 (class 2606 OID 16790)
-- Name: tarjetas_credito tarjetas_credito_numero_tarjeta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_credito
    ADD CONSTRAINT tarjetas_credito_numero_tarjeta_key UNIQUE (numero_tarjeta);


--
-- TOC entry 4769 (class 2606 OID 16788)
-- Name: tarjetas_credito tarjetas_credito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_credito
    ADD CONSTRAINT tarjetas_credito_pkey PRIMARY KEY (tarjeta_id);


--
-- TOC entry 4757 (class 2606 OID 16720)
-- Name: transacciones transacciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transacciones
    ADD CONSTRAINT transacciones_pkey PRIMARY KEY (transaccion_id);


--
-- TOC entry 4774 (class 2606 OID 16705)
-- Name: cuentas_bancarias cuentas_bancarias_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_bancarias
    ADD CONSTRAINT cuentas_bancarias_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(cliente_id);


--
-- TOC entry 4776 (class 2606 OID 16927)
-- Name: empleados empleados_departamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_departamento_id_fkey FOREIGN KEY (departamento_id) REFERENCES public.departamentos(departamento_id);


--
-- TOC entry 4777 (class 2606 OID 16753)
-- Name: empleados empleados_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(sucursal_id);


--
-- TOC entry 4778 (class 2606 OID 16776)
-- Name: prestamos prestamos_cuenta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_cuenta_id_fkey FOREIGN KEY (cuenta_id) REFERENCES public.cuentas_bancarias(cuenta_id);


--
-- TOC entry 4780 (class 2606 OID 16801)
-- Name: relacion_clientes_productos relacion_clientes_productos_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relacion_clientes_productos
    ADD CONSTRAINT relacion_clientes_productos_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(cliente_id);


--
-- TOC entry 4781 (class 2606 OID 16806)
-- Name: relacion_clientes_productos relacion_clientes_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relacion_clientes_productos
    ADD CONSTRAINT relacion_clientes_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos_financieros(producto_id);


--
-- TOC entry 4779 (class 2606 OID 16791)
-- Name: tarjetas_credito tarjetas_credito_cuenta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_credito
    ADD CONSTRAINT tarjetas_credito_cuenta_id_fkey FOREIGN KEY (cuenta_id) REFERENCES public.cuentas_bancarias(cuenta_id);


--
-- TOC entry 4775 (class 2606 OID 16721)
-- Name: transacciones transacciones_cuenta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transacciones
    ADD CONSTRAINT transacciones_cuenta_id_fkey FOREIGN KEY (cuenta_id) REFERENCES public.cuentas_bancarias(cuenta_id);

--
-- PostgreSQL database dump complete
--


--####Inserts en tablas

INSERT INTO public.clientes (cliente_id, nombre, apellido, direccion, telefono, correo_electronico, fecha_nacimiento, estado) VALUES
(1, 'Juan', 'Pérez', 'Calle 123', '555-1234', 'juan.perez@clientes.com', '1980-01-15', 'activo'),
(2, 'María', 'López', 'Avenida 456', '555-5678', 'maria.lopez@clientes.com', '1990-02-25', 'activo'),
(3, 'Carlos', 'Gómez', 'Calle 789', '555-8765', 'carlos.gomez@clientes.com', '1975-03-30', 'inactivo'),
(4, 'Ana', 'Rodríguez', 'Boulevard 101', '555-4321', 'ana.rodriguez@clientes.com', '1985-04-20', 'activo'),
(7, 'Alice', 'Johnson', '101 Oak Street', '555-1234', 'alice.johnson@example.com', '1985-01-20', 'activo'),
(8, 'Bob', 'Smith', '202 Pine Street', '555-5678', 'bob.smith@example.com', '1990-05-15', 'activo');


INSERT INTO public.cuentas_bancarias (cuenta_id, cliente_id, numero_cuenta, tipo_cuenta, saldo, fecha_apertura, estado) VALUES
(1, 1, '1234567890', 'corriente', 10000.00, '2021-05-15', 'activa'),
(2, 2, '2345678901', 'ahorro', 15000.00, '2022-06-20', 'activa'),
(3, 3, '3456789012', 'corriente', 5000.00, '2023-07-25', 'cerrada'),
(4, 4, '4567890123', 'ahorro', 2000.00, '2020-08-30', 'activa'),
(6, 1, '1017246600', 'ahorro', 2000.00, '2022-01-10', 'activa'),
(7, 2, '0987654321', 'corriente', 50.00, '2023-01-10', 'activa');

INSERT INTO public.departamentos (departamento_id, nombre) VALUES
(1, 'Recursos Humanos'),
(2, 'Finanzas'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'HR'),
(6, 'Finance');

INSERT INTO public.sucursales (sucursal_id, nombre, direccion, telefono) VALUES
(1, 'Sucursal Central', 'Calle Principal 100', '555-0000'),
(2, 'Sucursal Norte', 'Avenida Norte 200', '555-1111'),
(3, 'Sucursal Sur', 'Calle Sur 300', '555-2222'),
(4, 'Sucursal Este', 'Boulevard Este 400', '555-3333'),
(5, 'Sucursal New York', '123 New York Avenue, New York, NY', '123-456-7890');

INSERT INTO public.empleados (empleado_id, nombre, apellido, direccion, telefono, correo_electronico, fecha_contratacion, posicion, salario, sucursal_id, departamento_id) VALUES
(1, 'Pedro', 'Martínez', 'Calle Alfa 1', '555-4444', 'pedro.martinez@empleados.com', '2015-06-15', 'Cajero', 30000.00, 1, 1),
(5, 'John', 'Doe', '456 Elm Street', '555-1234', 'john.doe@example.com', '2020-01-15', 'Manager', 75000.00, 1, 1),
(2, 'Lucía', 'García', 'Avenida Beta 2', '555-5555', 'lucia.garcia@empleados.com', '2018-09-20', 'Asistente', 35000.00, 2, 2),
(7, 'Alice', 'Johnson', '101 Oak Street', '555-8765', 'alice.johnson@example.com', '2021-03-10', 'Designer', 70000.00, 2, 2),
(3, 'Miguel', 'Sánchez', 'Calle Gamma 3', '555-6666', 'miguel.sanchez@empleados.com', '2020-01-10', 'Gerente', 50000.00, 3, 3),
(8, 'Bob', 'Brown', '202 Pine Street', '555-4321', 'bob.brown@example.com', '2018-08-30', 'Analyst', 62000.00, 3, 3),
(4, 'Elena', 'Ruiz', 'Boulevard Delta 4', '555-7777', 'elena.ruiz@empleados.com', '2017-11-25', 'Contador', 40000.00, 4, 4),
(6, 'Jane', 'Smith', '789 Maple Avenue', '555-5678', 'jane.smith@example.com', '2019-06-22', 'Developer', 65000.00, NULL, 5);

INSERT INTO public.prestamos (prestamo_id, cuenta_id, monto, tasa_interes, fecha_inicio, fecha_fin, estado) VALUES
(1, 1, 5000.00, 5.00, '2023-01-01', '2025-01-01', 'activo'),
(2, 2, 10000.00, 4.50, '2022-02-01', '2026-02-01', 'activo'),
(3, 3, 7000.00, 5.00, '2021-03-01', '2025-03-01', 'pagado'),
(4, 4, 8000.00, 4.00, '2020-04-01', '2024-04-01', 'activo');

INSERT INTO public.productos_financieros (producto_id, nombre_producto, tipo_producto, descripcion, tasa_interes) VALUES
(1, 'Préstamo Personal', 'préstamo', 'Préstamo para necesidades personales', 5.00),
(2, 'Tarjeta de Crédito Oro', 'tarjeta de crédito', 'Tarjeta de crédito con beneficios premium', 2.50),
(3, 'Seguro de Vida', 'seguro', 'Seguro de vida completo', NULL),
(4, 'Préstamo Hipotecario', 'préstamo', 'Préstamo para compra de vivienda', 4.00);

INSERT INTO public.relacion_clientes_productos (cliente_id, producto_id, fecha_adquisicion) VALUES
(1, 1, '2023-01-01'),
(2, 2, '2022-02-01'),
(3, 3, '2021-03-01'),
(4, 4, '2020-04-01');

INSERT INTO public.tarjetas_credito (tarjeta_id, cuenta_id, numero_tarjeta, limite_credito, saldo_actual, fecha_emision, fecha_vencimiento, estado) VALUES
(1, 1, '1111222233334444', 10000.00, 2000.00, '2023-05-15', '2027-05-15', 'activa'),
(2, 2, '5555666677778888', 15000.00, 5000.00, '2022-06-20', '2026-06-20', 'activa'),
(3, 3, '9999000011112222', 20000.00, 10000.00, '2021-07-25', '2025-07-25', 'bloqueada'),
(4, 4, '3333444455556666', 5000.00, 1000.00, '2020-08-30', '2024-08-30', 'activa');

INSERT INTO public.transacciones (transaccion_id, cuenta_id, tipo_transaccion, monto, fecha_transaccion, descripcion) VALUES
(1, 1, 'depósito', 1000.00, '2024-01-01 10:00:00', 'Depósito inicial'),
(2, 2, 'retiro', 500.00, '2024-02-01 11:00:00', 'Retiro de efectivo'),
(3, 3, 'transferencia', 2000.00, '2024-03-01 12:00:00', 'Transferencia a otra cuenta'),
(4, 4, 'depósito', 3000.00, '2024-04-01 13:00:00', 'Depósito de salario'),
(5, 1, 'depósito', 1500.00, '2024-01-15 10:00:00', 'Depósito inicial'),
(6, 2, 'retiro', 75.00, '2024-02-20 14:00:00', 'Compra en tienda'),
(7, 2, 'transferencia', 50.00, '2024-03-05 09:30:00', 'Transferencia a ahorros');



