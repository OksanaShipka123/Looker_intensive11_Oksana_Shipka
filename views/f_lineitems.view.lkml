view: f_lineitems {
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}."L_CUSTKEY", ${TABLE}."L_ORDERKEY", ${TABLE}."L_PARTKEY"} ) ;;
  }

  dimension: l_availqty {
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey {
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
  }

  dimension: l_custkey {
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
  }

  dimension: l_discount {
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: l_extendedprice {
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_linenumber {
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
  }

  dimension: l_orderkey {
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
  }

  dimension: l_orderpriority {
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
  }

  dimension: l_quantity {
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
  }

  dimension: l_returnflag {
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
  }

  dimension: l_shipinstruct {
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
  }

  dimension: l_supplycost {
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  dimension: l_tax {
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  dimension: l_totalprice {
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
  }
  dimension: is_returned {
    type: yesno
    sql: ${l_returnflag}:"R" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

# Total Sale Price #
  measure: total_sale_price {
    label: "Total Sale Price"
    description: "Total sales from items sold"
    type: sum
    sql: ${l_extendedprice} ;;
    value_format_name: usd
  }

  # Average Sale Price #
  measure: average_sale_price {
    label: "Average Sale Price"
    description: "Average sale price of items sold"
    type: average
    sql: ${l_extendedprice} ;;
    value_format_name: usd
  }

  # Cumulative Total Sales #
  measure: cumulative_total_sales {
    label: "Cumulative Total Sales"
    description: "Cumulative total sales from items sold"
    type: running_total
    sql: ${l_totalprice} ;;
   value_format_name: usd
  }

  # Total Sale Price Shipped By Air #
  measure: total_sale_price_by_air {
    label: "Total Sale Price Shipped By Air"
    description: "Total sales of items shipped by air"
    type: sum
    sql: ${l_totalprice} ;;
    filters: [l_shipmode: "AIR"]
    value_format_name: usd
  }

  # Total Russia Sales #
  measure: total_sale_price_by_russia {
    label: "Total Russia Sales"
    description: "Total sales by customers from Russia"
    type: sum
    sql: ${l_totalprice} ;;
    filters: [d_customer.c_nation: "RUSSIA"]
    value_format_name: usd
  }

  # Total Gross Revenue #
  measure: total_gross_revenue {
    label: "Total Gross Revenue"
    description: "Total price of completed sales"
    type: sum
    sql: ${l_extendedprice} ;;
    filters: [l_orderstatus: "F"]
    value_format_name: usd
    drill_fields: [d_supplier.s_name, d_supplier.s_region]
  }

  # Total Cost #
  measure: total_cost {
    label: "Total Cost"
    description: "Total cost of supply"
    type: sum
    sql: ${l_supplycost} ;;
    value_format_name: usd
  }

  # Total Gross Margin Amount #
  measure: total_gross_margin {
    label: "Total Gross Margin Amount"
    description: "Total Gross Revenue – Total Cost"
    type: number
    sql: ${total_gross_revenue} - ${total_cost} ;;
    value_format_name: usd
    drill_fields: [l_shipmode, d_supplier.s_region, d_supplier.suppliers_cohort_according_account_balance]

  }

  # Goss Margin Percentage #
  measure: gross_margin_pct {
    label: "Goss Margin Percentage"
    description: "Total Gross Margin Amount / Total Gross Revenue"
    type: number
    sql: ${total_gross_margin} / NULLIF(${total_gross_revenue},0) ;;
    value_format: "0.00%"
  }

  # Number of Items Returned #
  measure: count_items_returned {
    label: "Number of Items Returned"
    description: "Number of items that were returned by dissatisfied customers"
    type: sum
    sql: ${l_quantity} ;;
    filters: [l_returnflag:"R"]
    value_format: "#,##0"
  }

  # Total number of Items Sold #
  measure: count_items_sold {
    label: "Total number of Items Sold"
    description: "Number of items that were sold"
    type: sum
    sql: ${l_quantity} ;;
    value_format: "#,##0"
  }

  # Item Return Rate #
  measure: return_rate {
    label: "Item Return Rate"
    description: "Number Of Items Returned / Total Number Of Items Sold"
    type: number
    sql: ${count_items_returned}/NULLIF(${count_items_sold},0);;
    value_format: "0.00%"
  }

  # Average Spend per Customer #
  measure: average_spend_per_customer {
    label: "Average Spend per Customer"
    description: "Total Sale Price / Total Number of Customers"
    type: number
    sql: ${total_sale_price} / NULLIF(${d_customer.count},0);;
    value_format_name: usd
  }

}
