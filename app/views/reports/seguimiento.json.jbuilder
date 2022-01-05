json.nombre_empresa  @resp["nombre_empresa"]
json.fecha  @resp["fecha"]
json.product_id @resp["product_id"]
json.array!(@resp["datos"]) do |fila|
    json.nombre_completo fila["nombre_completo"]
    json.fecha fila["fecha"]
    json.monto_solicitud fila["monto_solicitud"]
    json.monto_a_pagar fila["monto_a_pagar"]
    json.pagado fila["pagado"]
    json.adeudo fila["adeudo"]
    json.pagar fila["pagar"]
    json.atrasado fila["atrasado"]
    json.interes_moratorio fila["interes_moratorio"]
    json.total_a_cobrar fila["total_a_cobrar"]
    json.cobrado fila["cobrado"]
    json.diferencia fila["diferencia"]
    json.adelantado fila["adelantado"]
    json.empresa fila["empresa"]
    json.numero_de_pago fila["numero_de_pago"]
    json.numero_de_creditos fila["numero_de_creditos"]
    json.product_id fila["product_id"]
    json.tipo fila["tipo"]
    
end