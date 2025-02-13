CREATE DATABASE "forumAA" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';


ALTER DATABASE "forumAA" OWNER TO postgres;

\connect "forumAA"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE IF NOT EXISTS public."Rol"
(
    id integer NOT NULL DEFAULT nextval('"Rol_id_seq"'::regclass),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_d1662a25eccd1d81f7ff861c9e7" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Rol"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."User"
(
    id integer NOT NULL DEFAULT nextval('"User_id_seq"'::regclass),
    username character varying COLLATE pg_catalog."default" NOT NULL,
    email character varying COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT now(),
    "updateddAt" timestamp without time zone NOT NULL DEFAULT now(),
    "rolId" integer,
    CONSTRAINT "PK_9862f679340fb2388436a5ab3e4" PRIMARY KEY (id),
    CONSTRAINT "FK_fe205e767ed91705f52bfc9dd49" FOREIGN KEY ("rolId")
        REFERENCES public."Rol" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."User"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Post"
(
    id integer NOT NULL DEFAULT nextval('"Post_id_seq"'::regclass),
    title character varying COLLATE pg_catalog."default" NOT NULL,
    content text COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT now(),
    "updatedAt" timestamp without time zone NOT NULL DEFAULT now(),
    "userId" integer,
    CONSTRAINT "PK_c4d3b3dcd73db0b0129ea829f9f" PRIMARY KEY (id),
    CONSTRAINT "FK_97e81bcb59530bfb061e48aee6a" FOREIGN KEY ("userId")
        REFERENCES public."User" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Post"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Comment"
(
    id integer NOT NULL DEFAULT nextval('"Comment_id_seq"'::regclass),
    message text COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT now(),
    "updateddAt" timestamp without time zone NOT NULL DEFAULT now(),
    "postId" integer,
    "userId" integer,
    CONSTRAINT "PK_fe8d6bf0fcb531dfa75f3fd5bdb" PRIMARY KEY (id),
    CONSTRAINT "FK_4c827119c9554affb8018d4da82" FOREIGN KEY ("userId")
        REFERENCES public."User" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_fb770b565e79f3a4a2ecef894a7" FOREIGN KEY ("postId")
        REFERENCES public."Post" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Comment"
    OWNER to postgres;



INSERT INTO public."Rol"
( "name")
VALUES( 'admin');
INSERT INTO public."Rol"
( "name")
VALUES ('user');

INSERT INTO public."User"
(username, email, "password", "createdAt", "updateddAt", "rolId")
VALUES('Juan Perez', 'juan@gmail.com', 'Juan12345', '2025-02-13 03:46:52.888', '2025-02-13 03:46:52.888', 2);
INSERT INTO public."User"
(username, email, "password", "createdAt", "updateddAt", "rolId")
VALUES('Alvaro A', 'alvaroa@gmail.com', 'Alvaro12345', '2025-02-13 03:47:28.707', '2025-02-13 03:47:28.707', 2);
INSERT INTO public."User"
(username, email, "password", "createdAt", "updateddAt", "rolId")
VALUES('Admin', 'admin@gmail.com', 'Admin123', '2025-02-13 03:47:44.581', '2025-02-13 03:47:44.581', 1);
INSERT INTO public."User"
(username, email, "password", "createdAt", "updateddAt", "rolId")
VALUES('AlejandroPsa', 'alejandropsa@gmail.com', 'Alejandro123', '2025-02-13 03:54:28.662', '2025-02-13 03:54:28.662', 2);

INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Hablando de programacion', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies dolor quis sapien consectetur tincidunt. Aenean lacinia augue ac massa lacinia laoreet. Suspendisse consectetur molestie vehicula. Morbi maximus maximus neque, eu varius sapien fermentum ac. Nam est dui, auctor vitae libero et, finibus laoreet dui. Duis placerat suscipit mauris sit amet bibendum. Nunc ex erat, tempus ut tincidunt sit amet, molestie vel velit. Vivamus porttitor convallis nisl quis dignissim. Aliquam quis tempus ligula, et malesuada tellus.', '2025-02-13 03:49:45.203', '2025-02-13 03:49:45.203', 3);
INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Porque usar typescript', 'Suspendisse convallis, felis ut volutpat maximus, urna leo laoreet enim, ac laoreet justo purus ac nisi. Nam ullamcorper quam in fermentum tincidunt. Etiam pharetra est ligula, ac sodales mi vestibulum a. Proin vestibulum nisl et velit blandit ullamcorper. Mauris pellentesque consequat nisi, in sollicitudin arcu condimentum a. Fusce neque ligula, scelerisque nec cursus vel, facilisis in dui. Vestibulum elementum magna id ante pharetra, nec imperdiet augue facilisis. Ut dictum porta cursus. Nulla pellentesque risus at risus scelerisque vulputate. Aenean mollis dictum ipsum, in aliquam mi semper non. Phasellus consectetur ligula ligula, nec dignissim orci tincidunt ut. Mauris accumsan justo in sapien rhoncus consectetur. Donec aliquam ultricies felis, nec blandit diam mollis porttitor.', '2025-02-13 03:50:09.026', '2025-02-13 03:50:09.026', 3);
INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Temas de interes', 'Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec faucibus blandit libero a dapibus. Sed ultrices ex a mauris laoreet, congue condimentum ligula viverra. Proin pretium felis libero, nec feugiat ante faucibus lacinia. Donec mollis metus at augue vehicula, at ultrices massa tincidunt. Curabitur rhoncus nisl sit amet placerat egestas. Curabitur et odio sed sem luctus tincidunt eu in ex. Duis ultricies bibendum dignissim. In hac habitasse platea dictumst. Morbi at turpis purus. Sed commodo nunc at neque vestibulum pulvinar. Pellentesque dolor nibh, dapibus ut nisl vitae, condimentum laoreet urna. Morbi finibus dolor at condimentum hendrerit.', '2025-02-13 03:50:39.687', '2025-02-13 03:50:39.687', 4);
INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Ciberseguridad', 'Vivamus urna nibh, vestibulum in dui tincidunt, maximus facilisis ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet justo nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec porttitor volutpat vulputate. Phasellus placerat sit amet est in scelerisque. In mollis ullamcorper sodales. Proin posuere, sem sit amet laoreet viverra, est odio blandit augue, ac semper ipsum tortor ac ex. Cras sit amet odio et lectus dictum placerat. Aenean mauris magna, eleifend et sem rutrum, ullamcorper efficitur libero. Vestibulum condimentum, diam non consequat ornare, est ipsum porta mauris, quis tristique orci eros eu nisl. Mauris dapibus justo a nibh molestie facilisis.', '2025-02-13 03:51:19.391', '2025-02-13 03:51:19.391', 4);
INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Temas varios', 'In sollicitudin tortor dui, sed rutrum risus congue at. In dui est, tempor in rutrum quis, ornare sed nulla. Suspendisse nulla lectus, ultrices at rutrum sit amet, pulvinar eu libero. Ut magna lacus, iaculis a neque sit amet, semper consequat mi. Vivamus auctor pellentesque mi eu condimentum. Maecenas consequat mauris vehicula quam congue consectetur. Maecenas bibendum dui sit amet sapien euismod, at pretium turpis elementum. Aenean aliquet leo orci, nec posuere ipsum molestie quis. Phasellus blandit nisl vel dolor pharetra congue.

Sed sit amet neque vel nulla porttitor iaculis. Sed vel nulla dui. Morbi faucibus arcu mi, sed gravida augue tincidunt ac. Maecenas vel efficitur odio. Suspendisse laoreet elementum augue tincidunt faucibus. In vitae pharetra diam. Pellentesque elementum tortor erat, vitae convallis tellus tincidunt sit amet.', '2025-02-13 03:54:50.038', '2025-02-13 03:54:50.038', 6);
INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Beneficios de programar', 'Sed rutrum, velit at fermentum pellentesque, orci justo mattis lacus, nec feugiat ipsum erat eget mi. Mauris tincidunt varius risus, ac molestie nisi lacinia ac. Nullam laoreet justo a maximus rutrum. Fusce ac sodales velit. Aenean egestas, nunc sed rhoncus mattis, leo neque cursus lectus, id ultrices urna enim id arcu. In molestie quis nunc eget tempus. Sed porta non tortor pellentesque vulputate. Pellentesque quis ligula eget felis suscipit molestie ac quis libero.', '2025-02-13 03:55:13.748', '2025-02-13 03:55:13.748', 6);
INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Diferencias entre java y js', 'Sed id risus a arcu molestie molestie. In tristique ante quam, tincidunt accumsan ipsum condimentum nec. Nulla viverra feugiat nibh, id molestie odio lacinia ac. Aenean ultrices purus in lorem laoreet mattis. Pellentesque porta elementum libero, id sollicitudin nibh ultricies in. Aenean lorem nisi, congue id velit sit amet, eleifend commodo sem. Sed eu leo et massa blandit molestie. Pellentesque commodo mattis libero, vitae malesuada lectus pellentesque sit amet. Praesent at efficitur metus. Fusce pretium turpis at risus malesuada, eu aliquam sem sodales. Praesent elementum, orci elementum condimentum tristique, tellus felis ornare urna, nec aliquet mi lacus vitae nibh. Duis et ipsum eget massa laoreet faucibus in vel ipsum.', '2025-02-13 03:57:20.890', '2025-02-13 03:57:20.890', 6);
INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Reglas del foro', 'Suspendisse at urna aliquam, efficitur risus vel, ullamcorper est. Etiam a justo sagittis, elementum nisi eget, hendrerit tellus. Cras eu arcu fermentum, ullamcorper mauris a, tristique augue. Duis laoreet mauris ut magna laoreet ultrices. Fusce et sollicitudin risus. Vivamus sagittis eleifend rutrum. Mauris vulputate, dui et sagittis tristique, massa neque dignissim ligula, sit amet porta mauris neque non quam. Aenean nulla tortor, fermentum eu finibus ut, facilisis eget erat. Nam orci felis, dapibus ac rutrum sit amet, auctor eu nisl. Curabitur imperdiet pharetra malesuada. Vivamus porttitor neque libero, et convallis augue porta ac. Phasellus ac feugiat nibh. Vivamus nunc odio, semper quis vulputate ac, luctus a nisi. Ut mollis dictum sapien, eget consectetur nisi congue in. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum in eros leo.', '2025-02-13 03:58:20.196', '2025-02-13 03:58:20.196', 5);
INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Dinamica', 'Suspendisse at urna aliquam, efficitur risus vel, ullamcorper est. Etiam a justo sagittis, elementum nisi eget, hendrerit tellus. Cras eu arcu fermentum, ullamcorper mauris a, tristique augue. Duis laoreet mauris ut magna laoreet ultrices. Fusce et sollicitudin risus. Vivamus sagittis eleifend rutrum. Mauris vulputate, dui et sagittis tristique, massa neque dignissim ligula, sit amet porta mauris neque non quam. Aenean nulla tortor, fermentum eu finibus ut, facilisis eget erat. Nam orci felis, dapibus ac rutrum sit amet, auctor eu nisl. Curabitur imperdiet pharetra malesuada. Vivamus porttitor neque libero, et convallis augue porta ac. Phasellus ac feugiat nibh. Vivamus nunc odio, semper quis vulputate ac, luctus a nisi. Ut mollis dictum sapien, eget consectetur nisi congue in. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum in eros leo.', '2025-02-13 03:58:34.279', '2025-02-13 03:58:34.279', 5);
INSERT INTO public."Post"
(title, "content", "createdAt", "updatedAt", "userId")
VALUES('Premios', 'Suspendisse at urna aliquam, efficitur risus vel, ullamcorper est. Etiam a justo sagittis, elementum nisi eget, hendrerit tellus. Cras eu arcu fermentum, ullamcorper mauris a, tristique augue. Duis laoreet mauris ut magna laoreet ultrices. Fusce et sollicitudin risus. Vivamus sagittis eleifend rutrum. Mauris vulputate, dui et sagittis tristique, massa neque dignissim ligula, sit amet porta mauris neque non quam. Aenean nulla tortor, fermentum eu finibus ut, facilisis eget erat. Nam orci felis, dapibus ac rutrum sit amet, auctor eu nisl. Curabitur imperdiet pharetra malesuada. Vivamus porttitor neque libero, et convallis augue porta ac. Phasellus ac feugiat nibh. Vivamus nunc odio, semper quis vulputate ac, luctus a nisi. Ut mollis dictum sapien, eget consectetur nisi congue in. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum in eros leo.', '2025-02-13 03:58:55.820', '2025-02-13 03:58:55.820', 5);


INSERT INTO public."Comment"
(message, "createdAt", "updateddAt", "postId", "userId")
VALUES('Totalmente de acuerdo', '2025-02-13 03:59:19.863', '2025-02-13 03:59:19.863', 2, 5);
INSERT INTO public."Comment"
(message, "createdAt", "updateddAt", "postId", "userId")
VALUES('Buen punto', '2025-02-13 03:59:31.072', '2025-02-13 03:59:31.072', 6, 5);
INSERT INTO public."Comment"
(message, "createdAt", "updateddAt", "postId", "userId")
VALUES('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lorem eros, tristique in magna eu, luctus auctor quam. Morbi laoreet nec nulla eget pretiu', '2025-02-13 03:59:53.242', '2025-02-13 03:59:53.242', 8, 4);
INSERT INTO public."Comment"
(message, "createdAt", "updateddAt", "postId", "userId")
VALUES('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lorem eros, tristique in magna eu, luctus auctor quam. Morbi laoreet nec nulla eget pretiu', '2025-02-13 04:00:03.401', '2025-02-13 04:00:03.401', 3, 4);
INSERT INTO public."Comment"
(message, "createdAt", "updateddAt", "postId", "userId")
VALUES('Lorem ipsum dolor sit amet,', '2025-02-13 04:00:15.766', '2025-02-13 04:00:15.766', 3, 4);
INSERT INTO public."Comment"
(message, "createdAt", "updateddAt", "postId", "userId")
VALUES('Suspendisse at urna aliquam, efficitur risus vel, ullamcorper est. Etiam a justo sagittis, elementum nisi eget, hendrerit tellus. Cras eu arcu fermentum, ullamcorper mauris a, tristique augue. Duis laoreet mauris ut magna laoreet ultrices. Fusce et sollicitudin risus. Vivamus sagittis eleifend rutrum. Mauris vulputate, dui et sagittis tristique, massa neque dignissim ligula, sit amet porta mauris neque non quam. Aenean nulla tortor, fermentum eu finibus ut, facilisis eget erat. Nam orci felis, dapibus ac rutrum sit amet, auctor eu nisl. Curabitur imperdiet pharetra malesuada. Vivamus porttitor neque libero, et convallis augue porta ac. Phasellus ac feugiat nibh. Vivamus nunc odio, semper quis vulputate ', '2025-02-13 04:00:50.165', '2025-02-13 04:00:50.165', 10, 6);
INSERT INTO public."Comment"
(message, "createdAt", "updateddAt", "postId", "userId")
VALUES('Morbi faucibus tincidunt arcu, id bibendum turpis pharetra vestibulum. Integer ultricies ante in commodo hendrerit. Nulla tellus diam, porta n', '2025-02-13 04:01:16.316', '2025-02-13 04:01:16.316', 1, 6);