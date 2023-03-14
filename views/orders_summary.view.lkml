view: orders_summary {
  derived_table: {
    sql:
      SELECT
        l_linenumber as "test"
  FROM f_lineitems;;
  }
 dimension: l_linenumber {
  label: "Test"
  type: number
  sql: ${TABLE}."L_LINENUMBER" ;;
}

}
