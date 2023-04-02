connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"
include: "/dashboards/Summary_Dashboard_Target_Shipka_Oksana.dashboard.lookml"


datagroup: looker_intensive11_oksana_shipka_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_intensive11_oksana_shipka_default_datagroup


explore: f_lineitems {
  label: "Orders Items"
  view_label: "Orders"


  join: ship_date {
    from: d_dates
    view_label: "Ship Date"
    type: left_outer
    relationship: many_to_one
    sql_on: ${f_lineitems.l_shipdatekey} = ${ship_date.datekey} ;;
  }

  join: commit_date {
    from: d_dates
    view_label: "Commit Date"
    type: left_outer
    relationship: many_to_one
    sql_on: ${f_lineitems.l_commitdatekey} = ${commit_date.datekey} ;;
  }

  join: receipt_date {
    from: d_dates
    view_label: "Receipt Date"
    type: left_outer
    relationship: many_to_one
    sql_on: ${f_lineitems.l_receiptdatekey} = ${receipt_date.datekey} ;;
  }

  join: order_date {
    from: d_dates
    view_label: "Order Date"
    type: left_outer
    relationship: many_to_one
    sql_on: ${f_lineitems.l_orderdatekey} = ${order_date.datekey} ;;
  }

  join: d_supplier {
    view_label: "Supplier"
    type: left_outer
    relationship: many_to_one
    sql_on: ${f_lineitems.l_suppkey} = ${d_supplier.s_suppkey} ;;
  }

  join: d_part {
    view_label: "Part"
    type: left_outer
    relationship: many_to_one
    sql_on: ${f_lineitems.l_partkey} = ${d_part.p_partkey} ;;
  }

  join: d_customer {
    view_label: "Customer"
    type: left_outer
    relationship: many_to_one
    sql_on: ${f_lineitems.l_custkey} = ${d_customer.c_custkey} ;;
  }

  join: orders_summary {
    view_label: "Orders summary"
    type: left_outer
    relationship: many_to_one
    sql_on: ${f_lineitems.l_orderkey} = ${orders_summary.f_lineitems_l_orderkey} ;;
  }

}
