-- Restaurante_Menu [rel11]
alter table "public"."menu"  add column  "restaurante_oid"  int4;
alter table "public"."menu"   add constraint fk_menu_restaurante foreign key ("restaurante_oid") references "public"."restaurante" ("oid");


