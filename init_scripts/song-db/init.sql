-- public.songs definition

-- Drop table

-- DROP TABLE public.songs;

CREATE TABLE public.songs (
	id int8 NOT NULL,
	resource_id int8 NOT NULL UNIQUE,
	album varchar(255),
	artist varchar(255),
	genre varchar(255),
	length varchar(255),
	"name" varchar(255),
	"year" varchar(255),
	CONSTRAINT songs_pkey PRIMARY KEY (id)
);