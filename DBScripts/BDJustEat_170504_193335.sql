-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
   "timestamp"  timestamp,
  primary key ("oid")
);


-- Restaurante [ent1]
create table "public"."restaurante" (
   "oid"  int4  not null,
   "nombre_restaurante"  varchar(255),
   "direccion"  varchar(255),
   "telefono"  varchar(255),
   "ped_minimo"  float8,
   "poblacion"  varchar(255),
   "cp"  int4,
   "hora_apertura"  time,
   "hora_cierra"  time,
   "valoracion"  float8,
   "habilitado"  bool,
  primary key ("oid")
);


-- Producto [ent2]
create table "public"."producto" (
   "oid"  int4  not null,
   "nombre_producto"  varchar(255),
   "descripcion"  varchar(255),
   "precio"  float8,
   "stock"  int4,
  primary key ("oid")
);


-- Tipo_Comida [ent3]
create table "public"."tipo_comida" (
   "oid"  int4  not null,
   "nombre"  varchar(255),
  primary key ("oid")
);


-- Menu [ent4]
create table "public"."menu" (
   "oid"  int4  not null,
   "nombre_menu"  varchar(255),
   "descripcion"  varchar(255),
   "precio"  float8,
   "descuento"  int4,
  primary key ("oid")
);


-- Pedido [ent5]
create table "public"."pedido" (
   "oid"  int4  not null,
   "preciototal"  float8,
   "direccion"  varchar(255),
   "descuento"  float8,
  primary key ("oid")
);


-- Opinion [ent6]
create table "public"."opinion" (
   "oid"  int4  not null,
   "comentario"  varchar(255),
   "fecha"  timestamp,
   "valoracion"  int4,
  primary key ("oid")
);


-- Tipo_Producto [ent7]
create table "public"."tipo_producto" (
   "oid"  int4  not null,
   "tipo"  varchar(255),
  primary key ("oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Restaurante [rel1]
alter table "public"."restaurante"  add column  "user_oid"  int4;
alter table "public"."restaurante"   add constraint fk_restaurante_user foreign key ("user_oid") references "public"."user" ("oid");


-- Producto_Tipo_Producto [rel10]
alter table "public"."producto"  add column  "tipo_producto_oid"  int4;
alter table "public"."producto"   add constraint fk_producto_tipo_producto foreign key ("tipo_producto_oid") references "public"."tipo_producto" ("oid");


-- Restaurante_Menu [rel11]
alter table "public"."menu"  add column  "restaurante_oid"  int4;
alter table "public"."menu"   add constraint fk_menu_restaurante foreign key ("restaurante_oid") references "public"."restaurante" ("oid");


-- Restaurante_Opinion [rel2]
alter table "public"."opinion"  add column  "restaurante_oid"  int4;
alter table "public"."opinion"   add constraint fk_opinion_restaurante foreign key ("restaurante_oid") references "public"."restaurante" ("oid");


-- Opinion_User [rel3]
alter table "public"."opinion"  add column  "user_oid"  int4;
alter table "public"."opinion"   add constraint fk_opinion_user foreign key ("user_oid") references "public"."user" ("oid");


-- Restaurante_Producto [rel4]
alter table "public"."producto"  add column  "restaurante_oid"  int4;
alter table "public"."producto"   add constraint fk_producto_restaurante foreign key ("restaurante_oid") references "public"."restaurante" ("oid");


-- Producto_Menu [rel5]
create table "public"."producto_menu" (
   "producto_oid"  int4 not null,
   "menu_oid"  int4 not null,
  primary key ("producto_oid", "menu_oid")
);
alter table "public"."producto_menu"   add constraint fk_producto_menu_producto foreign key ("producto_oid") references "public"."producto" ("oid");
alter table "public"."producto_menu"   add constraint fk_producto_menu_menu foreign key ("menu_oid") references "public"."menu" ("oid");


-- Producto_Pedido [rel6]
create table "public"."producto_pedido" (
   "producto_oid"  int4 not null,
   "pedido_oid"  int4 not null,
  primary key ("producto_oid", "pedido_oid")
);
alter table "public"."producto_pedido"   add constraint fk_producto_pedido_producto foreign key ("producto_oid") references "public"."producto" ("oid");
alter table "public"."producto_pedido"   add constraint fk_producto_pedido_pedido foreign key ("pedido_oid") references "public"."pedido" ("oid");


-- Menu_Pedido [rel7]
create table "public"."menu_pedido" (
   "menu_oid"  int4 not null,
   "pedido_oid"  int4 not null,
  primary key ("menu_oid", "pedido_oid")
);
alter table "public"."menu_pedido"   add constraint fk_menu_pedido_menu foreign key ("menu_oid") references "public"."menu" ("oid");
alter table "public"."menu_pedido"   add constraint fk_menu_pedido_pedido foreign key ("pedido_oid") references "public"."pedido" ("oid");


-- User_Pedido [rel8]
alter table "public"."pedido"  add column  "user_oid"  int4;
alter table "public"."pedido"   add constraint fk_pedido_user foreign key ("user_oid") references "public"."user" ("oid");


-- Tipo_Comida_Restaurante [rel9]
alter table "public"."restaurante"  add column  "tipo_comida_oid"  int4;
alter table "public"."restaurante"   add constraint fk_restaurante_tipo_comida foreign key ("tipo_comida_oid") references "public"."tipo_comida" ("oid");


