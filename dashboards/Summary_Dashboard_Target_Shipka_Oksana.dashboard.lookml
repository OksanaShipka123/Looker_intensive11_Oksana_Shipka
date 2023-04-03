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
  - title: Return rate by Supplier region Highlighter
    name: Return rate by Supplier region Highlighter
    model: looker_intensive11_oksana_shipka
    explore: f_lineitems
    type: looker_grid
    fields: [f_lineitems.return_rate, d_supplier.s_region]
    sorts: [d_supplier.s_region]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: legacy
      palette_id: looker_classic
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: true
    series_cell_visualizations:
      f_lineitems.return_rate:
        is_active: true
    header_font_color: "#62bad4"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_value_format: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_label: "{{ order_date.granularity }}"
    x_axis_zoom: true
    y_axis_zoom: false
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 7
    col: 0
    width: 24
    height: 5
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
