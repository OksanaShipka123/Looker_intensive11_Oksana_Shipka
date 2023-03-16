view: orders_summary {
    derived_table: {
      sql: SELECT
          d_supplier."S_NAME"  AS "supplier_name",
          d_part."P_NAME"  AS "part_name",
          COALESCE(SUM(CASE WHEN ((( f_lineitems."L_ORDERSTATUS"  )) = 'F') THEN ( f_lineitems."L_TOTALPRICE" ) ELSE NULL END), 0) AS "total_gross_revenue",
          SUM (f_lineitems."L_SUPPLYCOST") as "Total cost"
      FROM "DATA_MART"."F_LINEITEMS"
           AS f_lineitems
      LEFT JOIN "DATA_MART"."D_SUPPLIER"
           AS d_supplier ON (f_lineitems."L_SUPPKEY") = (d_supplier."S_SUPPKEY")
      LEFT JOIN "DATA_MART"."D_PART"
           AS d_part ON (f_lineitems."L_PARTKEY") = (d_part."P_PARTKEY")

        GROUP BY
        1, 2
        ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: supplier_name {
      type: string
      sql: ${TABLE}."supplier_name" ;;
    }

    dimension: part_name {
      type: string
      sql: ${TABLE}."part_name" ;;
    }

    dimension: total_gross_revenue {
      type: number
      sql: ${TABLE}."total_gross_revenue" ;;
    }

    dimension: total_cost {
      type: number
      label: "Total cost"
      sql: ${TABLE}."Total cost" ;;
    }

  measure: total_gross_margin {
    label: "Total Gross Margin Amount"
    description: "Total Gross Revenue – Total Cost"
    type: number
    sql: ${total_gross_revenue} - ${total_cost} ;;
    value_format_name: usd
  }

    set: detail {
      fields: [supplier_name, part_name, total_gross_revenue, total_cost]
    }
  }
