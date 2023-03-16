- dashboard: summary_dashboard_target_oksana_shipka
  title: Summary Dashboard Target Oksana Shipka
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  elements:
  - title: Gross margin trends
    name: Gross margin trends
    model: looker_intensive11_oksana_shipka
    explore: f_lineitems
    type: looker_line
    fields: [f_lineitems.total_gross_margin, order_date.date_val_month]
    fill_fields: [order_date.date_val_month]
    sorts: [order_date.date_val_month desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    refresh: 1 hour
    listen:
      Customer Region: d_customer.c_region
      Customer Nation: d_customer.c_nation
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: Customer Region
    title: Customer Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: looker_intensive11_oksana_shipka
    explore: f_lineitems
    listens_to_filters: []
    field: d_customer.c_region
  - name: Customer Nation
    title: Customer Nation
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: looker_intensive11_oksana_shipka
    explore: f_lineitems
    listens_to_filters: []
    field: d_customer.c_nation
