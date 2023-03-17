# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190521155341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string   "clave"
    t.string   "nombre_del_agente"
    t.string   "apellido_materno"
    t.string   "apellido_paterno"
    t.string   "nombre_1"
    t.string   "nombre_2"
    t.string   "RFC"
    t.string   "calle"
    t.string   "numero_interior"
    t.integer  "numero_exterior"
    t.string   "colonia"
    t.integer  "codigo_postal"
    t.string   "municipio"
    t.string   "estado"
    t.string   "CURP"
    t.string   "seguro_social"
    t.string   "INE"
    t.string   "nacionalidad"
    t.datetime "fecha_de_nacimiento"
    t.string   "ciudad_de_nacimiento"
    t.string   "estado_de_nacimiento"
    t.string   "pais_de_nacimiento"
    t.boolean  "sexo"
    t.string   "telefono_de_casa"
    t.string   "telefono_celular"
    t.string   "correo_electronico_1"
    t.string   "correo_electronico_2"
    t.string   "cuenta_bancaria"
    t.string   "banco"
    t.decimal  "comision_por_cobranza"
    t.decimal  "comision_por_colocacion"
    t.decimal  "monto_maximo_de_prestamo"
    t.boolean  "permitir_prestamo_multiple"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "branch_office_id"
  end

  add_index "agents", ["branch_office_id"], name: "index_agents_on_branch_office_id", using: :btree

  create_table "branch_offices", force: :cascade do |t|
    t.string   "nombre"
    t.string   "calle"
    t.integer  "no_ext"
    t.string   "no_int"
    t.string   "colonia"
    t.integer  "codigo_postal"
    t.string   "municipio"
    t.string   "estado"
    t.string   "telefono_oficina"
    t.string   "telefono_celular"
    t.string   "correo1"
    t.string   "correo2"
    t.decimal  "comision_por_colocacion"
    t.decimal  "comision_por_cobranza"
    t.decimal  "monto_maximo_adeudo_sucursal"
    t.integer  "formato_impresion"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.string   "clave"
    t.string   "banco"
    t.string   "cuenta"
  end

  add_index "branch_offices", ["user_id"], name: "index_branch_offices_on_user_id", using: :btree

  create_table "c_countries", force: :cascade do |t|
    t.string   "nombre"
    t.string   "clave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "c_locations", force: :cascade do |t|
    t.string   "nombre"
    t.string   "clave"
    t.integer  "c_municipality_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "codigo_postal"
  end

  add_index "c_locations", ["c_municipality_id"], name: "index_c_locations_on_c_municipality_id", using: :btree

  create_table "c_municipalities", force: :cascade do |t|
    t.string   "nombre"
    t.string   "clave"
    t.integer  "c_state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "c_municipalities", ["c_state_id"], name: "index_c_municipalities_on_c_state_id", using: :btree

  create_table "c_states", force: :cascade do |t|
    t.string   "nombre"
    t.string   "clave"
    t.integer  "c_country_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "c_states", ["c_country_id"], name: "index_c_states_on_c_country_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "cve_estado"
    t.string   "dc_estado"
    t.string   "cve_localidad_inegi"
    t.string   "dc_localidad_inegi"
    t.string   "cve_municipio_siti_codigo_postal"
    t.string   "dc_municipio_siti"
    t.string   "cve_colonia_siti_colonia"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "codigo_postals", force: :cascade do |t|
    t.integer  "cp"
    t.text     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comen", force: :cascade do |t|
    t.string   "c"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "clave"
    t.string   "nombre_de_empresa"
    t.string   "razon_social"
    t.string   "calle"
    t.integer  "numero_exterior"
    t.string   "numero_interior"
    t.string   "colonia"
    t.integer  "codigo_postal"
    t.string   "municipio"
    t.string   "estado"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "nombre_1"
    t.string   "nombre_2"
    t.string   "telefono_de_oficina"
    t.string   "telefono_celular"
    t.string   "correo_electronico_1"
    t.string   "correo_electronico_2"
    t.string   "cuenta_bacaria"
    t.string   "banco"
    t.decimal  "comicion_por_cobranza"
    t.decimal  "comicion_por_colocacion"
    t.decimal  "monto_maximo_de_prestamo"
    t.boolean  "permitir_prestamo_multiple"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "branch_office_id"
  end

  add_index "companies", ["branch_office_id"], name: "index_companies_on_branch_office_id", using: :btree

  create_table "confs", force: :cascade do |t|
    t.string   "telefono"
    t.string   "domicilio"
    t.string   "correo"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "representante_legal"
    t.string   "RFC"
    t.string   "pagina"
  end

  create_table "countries", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "credits", force: :cascade do |t|
    t.date     "fecha"
    t.text     "como_se_entero"
    t.string   "nombre_completo_familiar_1"
    t.string   "parentesco_1"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "nombre_1"
    t.string   "nombre_2"
    t.string   "RFC"
    t.string   "CURP"
    t.string   "seguro"
    t.string   "INE"
    t.string   "nacionalidad"
    t.date     "fecha_de_nacimiento"
    t.string   "ciudad_de_nacimiento"
    t.string   "estado_de_nacimiento"
    t.string   "telefono_de_casa"
    t.string   "telefono_celular"
    t.string   "email_1"
    t.string   "email_2"
    t.integer  "escolaridad"
    t.integer  "numero_de_dependientes_economicos"
    t.decimal  "gasto_promedio_mensual"
    t.integer  "estado_civil"
    t.string   "apellido_paterno_del_conyuge"
    t.string   "apellido_materno_del_conyuge"
    t.string   "nombre_1_del_conyuge"
    t.string   "nombre_2_del_conyuge"
    t.string   "telefono_celular_del_conyuge"
    t.string   "telefono_de_oficina_del_conyuge"
    t.string   "calle"
    t.string   "numero_interior"
    t.integer  "numero_exterior"
    t.integer  "tipo_de_domicilio"
    t.integer  "codigo_postal"
    t.string   "colonia"
    t.string   "municipio"
    t.string   "antiguedad_en_el_domicilio_actual"
    t.string   "antiguedad_en_el_domicilio_anterior"
    t.string   "empresa_donde_labora"
    t.string   "giro_de_la_empresa"
    t.string   "puesto"
    t.string   "telefono_empresa"
    t.string   "sueldo_mensual_neto"
    t.string   "dirreccion_empresa"
    t.string   "colonia_empresa"
    t.string   "municipio_empresa"
    t.decimal  "monto_solicitud"
    t.integer  "cada_cuanto_se_realizara_el_pago"
    t.integer  "lugar_donde_se_realizara_el_pago"
    t.string   "nombre_referencia_1"
    t.string   "domicilio_referencia_1"
    t.string   "telefono_fijo_referencia_1"
    t.string   "telefono_celular_referencia_1"
    t.string   "nombre_referencia_2"
    t.string   "domicilio_referencia_2"
    t.string   "telefono_fijo_referencia_2"
    t.string   "telefono_celular_referencia_2"
    t.string   "nombre_referencia_familiar"
    t.string   "domicilio_referencia_familiar"
    t.string   "telefono_fijo_referencia_familiar"
    t.string   "telefono_celular_referencia_familiar"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "nombre_completo_familiar_2"
    t.string   "parentesco_2"
    t.string   "nombre_completo_1"
    t.integer  "edad_1"
    t.string   "parentesco_del_dependiente_1"
    t.string   "nombre_completo_2"
    t.integer  "edad_2"
    t.string   "parentesco_del_dependiente_2"
    t.string   "nombre_completo_3"
    t.integer  "edad_3"
    t.string   "parentesco_del_dependiente_3"
    t.integer  "status"
    t.integer  "economical_activity_id"
    t.string   "nombre_completo_familiar_3"
    t.string   "parentesco_3"
    t.string   "nombre_completo_familiar_4"
    t.string   "parentesco_4"
    t.string   "nombre_completo_4"
    t.string   "edad_4"
    t.string   "parentesco_del_dependiente_4"
    t.string   "estado_actual"
    t.string   "localidad"
    t.text     "observaciones"
    t.date     "fecha_de_nacimiento_conyuge"
    t.integer  "antiguedad_en_el_domicilio_actual_meses"
    t.integer  "antiguedad_en_el_domicilio_actual_anos"
    t.integer  "product_id"
    t.integer  "antiguedad_en_el_domicilio_anterior_anos"
    t.integer  "antiguedad_en_el_domicilio_anterior_meses"
    t.string   "country"
    t.integer  "customer_id"
    t.integer  "es_cliente"
    t.integer  "agente_empresa"
    t.integer  "familiar_con_prestamo"
    t.integer  "sexo"
    t.integer  "antiguedad_laboral_anos"
    t.integer  "antiguedad_laboral_meses"
    t.integer  "numero_de_cheque"
    t.date     "fecha_de_contrato"
    t.integer  "destination_id"
    t.string   "casa_color"
    t.integer  "cancel_o_porton"
    t.string   "color_de_cancel"
    t.text     "caracteristicas_especiales"
    t.integer  "ocupation_id"
    t.string   "ocupacion_del_conyuge"
    t.string   "empresa_donde_labora_el_conyuge"
    t.integer  "profecion_id"
    t.integer  "referencia_agente_empresa"
    t.text     "pdf64"
    t.integer  "fiel"
  end

  add_index "credits", ["customer_id"], name: "index_credits_on_customer_id", using: :btree
  add_index "credits", ["destination_id"], name: "index_credits_on_destination_id", using: :btree
  add_index "credits", ["economical_activity_id"], name: "index_credits_on_economical_activity_id", using: :btree
  add_index "credits", ["ocupation_id"], name: "index_credits_on_ocupation_id", using: :btree
  add_index "credits", ["product_id"], name: "index_credits_on_product_id", using: :btree
  add_index "credits", ["profecion_id"], name: "index_credits_on_profecion_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.boolean  "agente_empresa"
    t.text     "como_se_entero"
    t.boolean  "familiar_con_prestamo"
    t.string   "nombre_completo_familiar_1"
    t.string   "parentesco_1"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "nombre_1"
    t.string   "nombre_2"
    t.string   "RFC"
    t.string   "CURP"
    t.string   "seguro"
    t.string   "INE"
    t.string   "nacionalidad"
    t.date     "fecha_de_nacimiento"
    t.string   "ciudad_de_nacimiento"
    t.string   "estado_de_nacimiento"
    t.boolean  "sexo"
    t.string   "telefono_de_casa"
    t.string   "telefono_celular"
    t.string   "email_1"
    t.string   "email_2"
    t.integer  "escolaridad"
    t.integer  "numero_de_dependientes_economicos"
    t.decimal  "gasto_promedio_mensual"
    t.integer  "estado_civil"
    t.string   "apellido_paterno_del_conyuge"
    t.string   "apellido_materno_del_conyuge"
    t.string   "nombre_1_del_conyuge"
    t.string   "nombre_2_del_conyuge"
    t.string   "telefono_celular_del_conyuge"
    t.string   "telefono_de_oficina_del_conyuge"
    t.string   "calle"
    t.integer  "numero_interior"
    t.integer  "numero_exterior"
    t.integer  "tipo_de_domicilio"
    t.integer  "codigo_postal"
    t.string   "colonia"
    t.string   "municipio"
    t.string   "empresa_donde_labora"
    t.string   "giro_de_la_empresa"
    t.string   "puesto"
    t.string   "telefono_empresa"
    t.string   "sueldo_mensual_neto"
    t.string   "dirreccion_empresa"
    t.string   "colonia_empresa"
    t.string   "municipio_empresa"
    t.string   "nombre_referencia_1"
    t.string   "domicilio_referencia_1"
    t.string   "telefono_fijo_referencia_1"
    t.string   "telefono_celular_referencia_1"
    t.string   "nombre_referencia_2"
    t.string   "domicilio_referencia_2"
    t.string   "telefono_fijo_referencia_2"
    t.string   "telefono_celular_referencia_2"
    t.string   "nombre_referencia_familiar"
    t.string   "domicilio_referencia_familiar"
    t.string   "telefono_fijo_referencia_familiar"
    t.string   "telefono_celular_referencia_familiar"
    t.string   "nombre_completo_familiar_2"
    t.string   "parentesco_2"
    t.string   "nombre_completo_1"
    t.integer  "edad_1"
    t.string   "parentesco_del_dependiente_1"
    t.string   "nombre_completo_2"
    t.integer  "edad_2"
    t.string   "parentesco_del_dependiente_2"
    t.string   "nombre_completo_3"
    t.integer  "edad_3"
    t.string   "parentesco_del_dependiente_3"
    t.integer  "status"
    t.integer  "economical_activity_id"
    t.string   "nombre_completo_familiar_3"
    t.string   "parentesco_3"
    t.string   "nombre_completo_familiar_4"
    t.string   "parentesco_4"
    t.string   "nombre_completo_4"
    t.string   "edad_4"
    t.string   "parentesco_del_dependiente_4"
    t.string   "estado_actual"
    t.string   "localidad"
    t.text     "observaciones"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.date     "fecha_de_nacimiento_conyuge"
    t.string   "country"
    t.integer  "ocupation_id"
    t.string   "ocupacion_del_conyuge"
    t.string   "empresa_donde_labora_el_conyuge"
    t.integer  "profecion_id"
    t.integer  "referencia_agente_empresa"
    t.integer  "fiel"
  end

  add_index "customers", ["economical_activity_id"], name: "index_customers_on_economical_activity_id", using: :btree
  add_index "customers", ["ocupation_id"], name: "index_customers_on_ocupation_id", using: :btree
  add_index "customers", ["profecion_id"], name: "index_customers_on_profecion_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "destinations", force: :cascade do |t|
    t.string   "descricion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "economical_activities", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "expires", force: :cascade do |t|
    t.string   "comentarios"
    t.integer  "afectados"
    t.datetime "fecha"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "control"
  end

  create_table "loans", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "localidad_cnbvs", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.string   "entidad_federativa"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "msp_errors", primary_key: "id_sync", force: :cascade do |t|
    t.datetime "createdAt"
    t.text     "error",     null: false
  end

  create_table "msp_synchronization", primary_key: "id_sync", force: :cascade do |t|
    t.string  "doc_type",   limit: 1, null: false
    t.integer "status",     limit: 2, null: false
    t.integer "id_local",             null: false
    t.integer "id_msp"
    t.string  "folio_msp",  limit: 9
    t.integer "id2_msp"
    t.string  "folio2_msp", limit: 9
    t.date    "date"
  end

  create_table "ocupations", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "folio"
    t.date     "fecha_de_pago"
    t.string   "recibo"
    t.integer  "estatus"
    t.decimal  "importe",            precision: 10, scale: 2
    t.decimal  "pago",               precision: 10, scale: 2
    t.decimal  "interes",            precision: 10, scale: 2
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "credit_id"
    t.boolean  "activado"
    t.date     "fecha_de_corte"
    t.date     "fecha_de_impresion"
    t.boolean  "interes_flag"
    t.integer  "vencimientos"
  end

  add_index "payments", ["credit_id"], name: "index_payments_on_credit_id", using: :btree

  create_table "payouts", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "days"
    t.string   "flow"
    t.integer  "type_payout"
    t.string   "periocidad"
    t.integer  "desplazamiento"
    t.text     "scope_data"
  end

  create_table "pdfs", force: :cascade do |t|
    t.text     "pdf64"
    t.integer  "credit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pdfs", ["credit_id"], name: "index_pdfs_on_credit_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "nombre_del_producto"
    t.string   "registro_del_contrado_de_adhesion"
    t.string   "plazo_de_prestamo"
    t.integer  "numero_de_pagos_a_realizar"
    t.decimal  "taza_de_interes_ordinaria"
    t.decimal  "taza_de_interes_moratoria"
    t.decimal  "cat_sin_iva"
    t.decimal  "numero_de_meses_de_sueldo_para_prestamo"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.integer  "loan_id"
    t.integer  "payout_id"
    t.integer  "forma_de_pago_interes"
    t.integer  "plazo_de_prestamo_interes"
    t.integer  "numero_de_pagos_a_realizar_interes"
    t.string   "plazo"
    t.decimal  "interes_moratorio_aplicable",             precision: 10, scale: 2
    t.string   "etiqueta_plural"
    t.decimal  "comision_apert"
  end

  add_index "products", ["loan_id"], name: "index_products_on_loan_id", using: :btree
  add_index "products", ["payout_id"], name: "index_products_on_payout_id", using: :btree

  create_table "profecions", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pruebas", force: :cascade do |t|
    t.string   "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.integer  "folio"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "payment_id"
    t.date     "fecha_de_cargo"
    t.boolean  "agente_empresa"
    t.integer  "padre_referencia"
    t.string   "nombre"
    t.decimal  "cantidad"
    t.string   "concepto"
    t.decimal  "atraso"
    t.integer  "status"
  end

  add_index "receipts", ["payment_id"], name: "index_receipts_on_payment_id", using: :btree

  create_table "seguimientos", force: :cascade do |t|
    t.string   "nombre"
    t.date     "fecha_prestamo"
    t.float    "capital"
    t.float    "monto_a_cobrar"
    t.float    "adeudo"
    t.float    "a_pagar"
    t.float    "atrasado"
    t.float    "interés_moratorio"
    t.float    "total_a_cobrar"
    t.float    "cobrado"
    t.float    "diferencia"
    t.float    "adelantado"
    t.string   "empresa"
    t.string   "no_pago"
    t.string   "no_creditos"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "payment_id"
    t.integer  "credit_id"
    t.date     "fecha_corte"
  end

  add_index "seguimientos", ["payment_id"], name: "index_seguimientos_on_payment_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "type"
    t.integer  "status"
    t.decimal  "cantidad"
    t.integer  "user_id"
  end

  add_index "tickets", ["payment_id"], name: "index_tickets_on_payment_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "tipo"
    t.string   "app"
    t.string   "apm"
    t.string   "nom1"
    t.string   "nom2"
    t.string   "RFC"
    t.string   "CURP"
    t.string   "seguro"
    t.string   "INE"
    t.string   "nacionalidad"
    t.datetime "fecha_nacimiento"
    t.string   "nac_ciudad"
    t.string   "nac_estado"
    t.string   "nac_pais"
    t.boolean  "sexo"
    t.string   "telefono_casa"
    t.string   "telefono_celular"
    t.string   "correo1"
    t.string   "correo2"
    t.string   "calle"
    t.integer  "numero_ext"
    t.string   "numero_int"
    t.string   "colonia"
    t.integer  "codigo_postal"
    t.string   "municipio"
    t.string   "estado"
    t.string   "pais"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "alias"
    t.integer  "activo",                 default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "agents", "branch_offices"
  add_foreign_key "branch_offices", "users"
  add_foreign_key "c_locations", "c_municipalities"
  add_foreign_key "c_municipalities", "c_states"
  add_foreign_key "c_states", "c_countries"
  add_foreign_key "companies", "branch_offices"
  add_foreign_key "credits", "customers"
  add_foreign_key "credits", "destinations"
  add_foreign_key "credits", "economical_activities"
  add_foreign_key "credits", "ocupations"
  add_foreign_key "credits", "products"
  add_foreign_key "credits", "profecions"
  add_foreign_key "customers", "economical_activities"
  add_foreign_key "customers", "ocupations"
  add_foreign_key "customers", "profecions"
  add_foreign_key "msp_errors", "msp_synchronization", column: "id_sync", primary_key: "id_sync", name: "msp_errors_id_sync_fkey"
  add_foreign_key "payments", "credits"
  add_foreign_key "pdfs", "credits"
  add_foreign_key "products", "loans"
  add_foreign_key "products", "payouts"
  add_foreign_key "receipts", "payments"
  add_foreign_key "seguimientos", "payments"
  add_foreign_key "tickets", "payments"
  add_foreign_key "tickets", "users"
end
