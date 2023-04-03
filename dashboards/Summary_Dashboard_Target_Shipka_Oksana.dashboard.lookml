- dashboard: summary_dashboard_target_shipka_oksana
  title: Summary Dashboard Target Shipka Oksana
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: m8Nc79PKGrjIWEHvZsPWqO
  elements:
  - title: "{{filter_values.granularity}} Gross margin trends"
    name: total_gross_margin
    model: looker_intensive11_oksana_shipka
    explore: f_lineitems
    type: looker_line
    fields: [f_lineitems.total_gross_margin, order_date.granularity]
    sorts: [order_date.granularity]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    hidden_pivots: {}
    listen:
      Region: d_customer.c_region
      Customer Nation: d_customer.c_nation
      Date Granularity: order_date.date_granularity
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: Region
    title: Region
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
    listens_to_filters:
    - Region
    field: d_customer.c_nation
  - name: Date Granularity
    title: Date Granularity
    type: field_filter
    default_value: year
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: looker_intensive11_oksana_shipka
    explore: f_lineitems
    listens_to_filters: []
    field: order_date.date_granularity
