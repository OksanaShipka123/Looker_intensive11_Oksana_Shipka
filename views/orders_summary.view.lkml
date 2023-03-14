view: orders_summary {
  derived_table: {
    sql: |
      SELECT
        total_gross_margin as "Total Gross"
    FROM f_lineitems;;
  }
}
