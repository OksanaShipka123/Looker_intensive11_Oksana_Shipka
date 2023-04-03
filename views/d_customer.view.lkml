view: d_customer {
  sql_table_name: "DATA_MART"."D_CUSTOMER"
    ;;

  dimension: c_address {
    type: string
    sql: ${TABLE}."C_ADDRESS" ;;
  }

  dimension: c_custkey {
    type: number
    primary_key: yes
    sql: ${TABLE}."C_CUSTKEY" ;;
  }

  dimension: c_mktsegment {
    type: number
    sql: ${TABLE}."C_MKTSEGMENT" ;;
  }

  dimension: c_name {
    type: string
    sql: ${TABLE}."C_NAME" ;;
  }

  dimension: c_nation {
    type: string
    sql: ${TABLE}."C_NATION" ;;
  }

  dimension: c_phone {
    type: string
    sql: ${TABLE}."C_PHONE" ;;
  }

  dimension: c_region {
    type: string
    sql: ${TABLE}."C_REGION" ;;
    drill_fields: [f_lineitems.c_region ]
    link:{
      label: "{{ value }}"
      url: "https://epam.cloud.looker.com/dashboards/looker_intensive11_oksana_shipka::summary_dashboard_target_shipka_oksana?Region=={{ _filters['d_customer.c_region'] | url_encode }}&Customer+Nation=&Date+Granularity=year+%7C+url_encode+%7D%7D+++%7C+url_encode+%7D%7D"
    }

  }


  measure: count {
    type: count
    drill_fields: [c_name]
  }
}
