view: orders_summary {
  derived_table: {
    sql: SELECT
          order_date."MONTH_NAME"  AS "order_date.month_name",
              (TO_CHAR(TO_DATE(order_date."DATE_VAL" ), 'YYYY-MM-DD')) AS "order_date.date_val_date",
              (TO_CHAR(DATE_TRUNC('month', CAST(DATE_TRUNC('quarter', order_date."DATE_VAL" ) AS DATE)), 'YYYY-MM')) AS "order_date.date_val_quarter",
              (EXTRACT(YEAR FROM order_date."DATE_VAL" )::integer) AS "order_date.date_val_year",
          d_customer."C_NATION"  AS "d_customer.c_nation",
          d_customer."C_REGION"  AS "d_customer.c_region",
          f_lineitems."L_ORDERDATEKEY"  AS "f_lineitems.l_orderdatekey",
          f_lineitems."L_EXTENDEDPRICE"  AS "f_lineitems.l_extendedprice",
          f_lineitems."L_SUPPLYCOST"  AS "f_lineitems.l_supplycost",
          f_lineitems."L_SHIPMODE"  AS "f_lineitems.l_shipmode",
          f_lineitems."L_ORDERSTATUS"  AS "f_lineitems.l_orderstatus",
          f_lineitems."L_ORDERKEY"  AS "f_lineitems.l_orderkey"
      FROM "DATA_MART"."F_LINEITEMS"
           AS f_lineitems
      LEFT JOIN "DATA_MART"."D_DATES"
           AS order_date ON (f_lineitems."L_ORDERDATEKEY") = (order_date."DATEKEY")
      LEFT JOIN "DATA_MART"."D_CUSTOMER"
           AS d_customer ON (f_lineitems."L_CUSTKEY") = (d_customer."C_CUSTKEY")
      GROUP BY
          (TO_DATE(order_date."DATE_VAL" )),
          1,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12
      ORDER BY
          2 DESC
      FETCH NEXT 500 ROWS ONLY
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: summary_month_name {
    type: string
    sql: ${TABLE}."order_date.month_name" ;;
  }

  dimension: summary_val_date {
    type: string
    sql: ${TABLE}."order_date.date_val_date" ;;
  }

  dimension: summary_quarter {
    type: string
    sql: ${TABLE}."order_date.date_val_quarter" ;;
  }

  dimension: summary_year {
    type: number
    sql: ${TABLE}."order_date.date_val_year" ;;
  }

  dimension: summary_nation {
    type: string
    sql: ${TABLE}."d_customer.c_nation" ;;
  }

  dimension: summary_region {
    type: string
    sql: ${TABLE}."d_customer.c_region" ;;
  }

  dimension: summary_orderdatekey {
    type: number
    sql: ${TABLE}."f_lineitems.l_orderdatekey" ;;
  }

  dimension: summary_extendedprice {
    type: number
    sql: ${TABLE}."f_lineitems.l_extendedprice" ;;
  }

  dimension: summary_supplycost {
    type: number
    sql: ${TABLE}."f_lineitems.l_supplycost" ;;
  }

  dimension: summary_shipmode {
    type: string
    sql: ${TABLE}."f_lineitems.l_shipmode" ;;
  }

  dimension: summary_orderstatus {
    type: string
    sql: ${TABLE}."f_lineitems.l_orderstatus" ;;
  }

  dimension: summary_orderkey {
    type: number
    sql: ${TABLE}."f_lineitems.l_orderkey" ;;
  }

# Total Sale Price #
  measure: summary_totalprice {
    label: "Total Sale Price"
    description: "Total sales from items sold"
    type: sum
    sql: ${summary_extendedprice} ;;
    value_format_name: usd
  }

# Cumulative Total Sales #
  measure: total_sales {
    label: "Total Sales"
    description: "Cumulative total sales from items sold"
    type: sum
    sql: ${summary_extendedprice} ;;
    value_format_name: usd
  }


  # Average Sale Price #
  measure: average_sale_price {
    label: "Average Sale Price"
    description: "Average sale price of items sold"
    type: average
    sql: ${summary_extendedprice} ;;
    value_format_name: usd
  }

  # Cumulative Total Sales #
  measure: cumulative_total_sales {
    label: "Cumulative Total Sales"
    description: "Cumulative total sales from items sold"
    type: running_total
    sql: ${summary_totalprice} ;;
    value_format_name: usd
  }

  # Total Sale Price Shipped By Air #
  measure: total_sale_price_by_air {
    label: "Total Sale Price Shipped By Air"
    description: "Total sales of items shipped by air"
    type: sum
    sql: ${summary_totalprice} ;;
    filters: [summary_shipmode: "AIR"]
    value_format_name: usd
  }

  # Total Gross Revenue #
  measure: total_gross_revenue {
    label: "Total Gross Revenue"
    description: "Total price of completed sales"
    type: sum
    sql: ${summary_extendedprice} ;;
    filters: [summary_orderstatus: "F"]
    value_format_name: usd
  }

  # Total Cost #
  measure: total_cost {
    label: "Total Cost"
    description: "Total cost of supply"
    type: sum
    sql: ${summary_supplycost} ;;
    value_format_name: usd
  }

  # Total Gross Margin Amount #
  measure: total_gross_margin {
    label: "Total Gross Margin Amount"
    description: "Total Gross Revenue – Total Cost"
    type: number
    sql: ${total_gross_revenue} - ${total_cost} ;;
    value_format_name: usd
  }

  # Goss Margin Percentage #
  measure: gross_margin_pct {
    label: "Goss Margin Percentage"
    description: "Total Gross Margin Amount / Total Gross Revenue"
    type: number
    sql: ${total_gross_margin} / NULLIF(${total_gross_revenue},0) ;;
    value_format: "0.00%"
  }


  set: detail {
    fields: [
      summary_month_name,
      summary_val_date,
      summary_quarter,
      summary_year,
      summary_nation,
      summary_region,
      summary_orderdatekey,
      summary_extendedprice,
      summary_supplycost,
      summary_shipmode,
      summary_orderstatus,
      summary_orderkey
    ]
  }
}
