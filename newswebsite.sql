PGDMP     9        
            {            newswebsite    15.2    15.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    17529    newswebsite    DATABASE        CREATE DATABASE newswebsite WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE newswebsite;
                postgres    false            �            1259    17543    articles    TABLE     h  CREATE TABLE public.articles (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(255),
    content text NOT NULL,
    author character varying(255) NOT NULL,
    date_published timestamp without time zone DEFAULT now(),
    likes integer DEFAULT 0,
    views integer DEFAULT 0,
    comments character varying[]
);
    DROP TABLE public.articles;
       public         heap    postgres    false            �            1259    17542    articles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.articles_id_seq;
       public          postgres    false    215                       0    0    articles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;
          public          postgres    false    214            e           2604    17546    articles id    DEFAULT     j   ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);
 :   ALTER TABLE public.articles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �          0    17543    articles 
   TABLE DATA           m   COPY public.articles (id, title, image, content, author, date_published, likes, views, comments) FROM stdin;
    public          postgres    false    215   �                  0    0    articles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.articles_id_seq', 25, true);
          public          postgres    false    214            j           2606    17553    articles articles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
       public            postgres    false    215            �   �  x��R�n� ={��[/�k��${�"5�Hi�C�^ra��ac
8�[��;�i��5ƃf�7n�oJF�y�<����y�X�]�o����<��.l��3��¶��j���ق�L�tv(.plУ3+��q\I��L=�
���Fm"mG�� @�gm�9D������� l��[��#�K�]2�x$�-�j&�*P��X$#�=�i�gX��D$�1�fu(&�
����@Gt�22�&����#"��$1+��/�`'���=I���^�8̑H��̀t8B��6�����J� �m�B@�*W�U��e����f#�I��$v�T�,:�|�H!�!z#	
 ������r'C�C��1� iT�a;�89���A��0�q�Xi4zug��W���yT֚�KuxCAO6d9�8���b��kwU����f�k��*�ƛS���X���񴥸=.��n�(ʫ��
L��E#�]Fy�uCX�gl��.o����bYT҂��W]y�K�\���"j��/�qN�������~X�R��1-�}\G&K�.�Ӄ�B���7\�hU�E*��p�~�T�4�f=6T$܎bW�S4��}zx��1�"ibͪ豉�f��<����'��z��o~�����n�U]V�u�f��/��r���fX��     