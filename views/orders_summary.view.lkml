view: orders_summary {
  derived_table: {
    sql: SELECT
          order_date."MONTH_NUM"  AS "order_date.month_num",
          order_date."QUARTER"  AS "order_date.quarter",
          order_date."YEAR"  AS "order_date.year",
          f_lineitems."L_ORDERKEY"  AS "f_lineitems.l_orderkey",
          COALESCE(SUM(( f_lineitems."L_SUPPLYCOST"  ) ), 0) AS "f_lineitems.total_cost",
          COALESCE(SUM(CASE WHEN ((( f_lineitems."L_ORDERSTATUS"  )) = 'F') THEN ( f_lineitems."L_EXTENDEDPRICE"  )  ELSE NULL END), 0) AS "f_lineitems.total_gross_revenue"
      FROM "DATA_MART"."F_LINEITEMS"
           AS f_lineitems
      LEFT JOIN "DATA_MART"."D_DATES"
           AS order_date ON (f_lineitems."L_ORDERDATEKEY") = (order_date."DATEKEY")
      GROUP BY
          1,
          2,
          3,
          4
      ORDER BY
          1
      FETCH NEXT 500 ROWS ONLY
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_date_month_num {
    type: number
    sql: ${TABLE}."order_date.month_num" ;;
  }

  dimension: order_date_quarter {
    type: number
    sql: ${TABLE}."order_date.quarter" ;;
  }

  dimension: order_date_year {
    type: number
    sql: ${TABLE}."order_date.year" ;;
  }

  dimension: f_lineitems_l_orderkey {
    type: number
    sql: ${TABLE}."f_lineitems.l_orderkey" ;;
  }

  dimension: f_lineitems_total_cost {
    type: number
    sql: ${TABLE}."f_lineitems.total_cost" ;;
  }

  dimension: f_lineitems_total_gross_revenue {
    type: number
    sql: ${TABLE}."f_lineitems.total_gross_revenue" ;;
  }
# Total Gross Margin Amount #
  measure: total_gross_margin {
    label: "Total Gross Margin Amount"
    description: "Total Gross Revenue – Total Cost"
    type: number
    sql: ${f_lineitems_total_gross_revenue} - ${f_lineitems_total_cost} ;;
    value_format_name: usd

  }


  set: detail {
    fields: [
      order_date_month_num,
      order_date_quarter,
      order_date_year,
      f_lineitems_l_orderkey,
      f_lineitems_total_cost,
      f_lineitems_total_gross_revenue
    ]
  }
}




