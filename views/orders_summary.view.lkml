view: orders_summary {
  derived_table: {
    sql: |
      SELECT
        l_linenumber as "Total Gross",
        l_orderpriority as "Total Gross2"
    FROM f_lineitems;;
  }
 dimension: l_linenumber {
  type: number
  sql: ${TABLE}."L_LINENUMBER" ;;
}
  dimension: l_orderpriority {
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }
}
