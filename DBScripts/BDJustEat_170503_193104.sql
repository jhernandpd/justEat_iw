-- Tipo_Producto [ent7]
create table "public"."tipo_producto" (
   "oid"  int4  not null,
   "tipo"  varchar(255),
  primary key ("oid")
);


-- Producto_Tipo_Producto [rel10]
alter table "public"."producto"  add column  "tipo_producto_oid"  int4;
alter table "public"."producto"   add constraint fk_producto_tipo_producto foreign key ("tipo_producto_oid") references "public"."tipo_producto" ("oid");


