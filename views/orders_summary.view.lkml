view: orders_summary {
  derived_table: {
    sql: SELECT
        l_supplycost,
        l_extendedprice,
        l_orderstatus
  FROM f_lineitems;
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: l_supplycost {
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  dimension: l_extendedprice {
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_orderstatus {
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  set: detail {
    fields: [l_supplycost, l_extendedprice, l_orderstatus]
  }
}
