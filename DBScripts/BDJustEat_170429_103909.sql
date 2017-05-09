-- Tipo_Comida [ent3]
create table "public"."tipo_comida" (
   "oid"  int4  not null,
   "nombre"  varchar(255),
  primary key ("oid")
);


-- Tipo_Comida_Restaurante [rel9]
alter table "public"."restaurante"  add column  "tipo_comida_oid"  int4;
alter table "public"."restaurante"   add constraint fk_restaurante_tipo_comida foreign key ("tipo_comida_oid") references "public"."tipo_comida" ("oid");


