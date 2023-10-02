# The name of this view in Looker is "Taxi"
view: taxi {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `chicago.taxi` ;;
  drill_fields: [taxi_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: taxi_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.taxi_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Company" in Explore.

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: dropoff_census_tract {
    type: number
    sql: ${TABLE}.dropoff_census_tract ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_dropoff_census_tract {
    type: sum
    sql: ${dropoff_census_tract} ;;  }
  measure: average_dropoff_census_tract {
    type: average
    sql: ${dropoff_census_tract} ;;  }

  dimension: dropoff_community_area {
    type: number
    sql: ${TABLE}.dropoff_community_area ;;
  }

  dimension: dropoff_latitude {
    type: number
    sql: ${TABLE}.dropoff_latitude ;;
  }

  dimension: dropoff_location {
    type: string
    sql: ${TABLE}.dropoff_location ;;
  }

  dimension: dropoff_longitude {
    type: number
    sql: ${TABLE}.dropoff_longitude ;;
  }

  dimension: extras {
    type: number
    sql: ${TABLE}.extras ;;
  }

  dimension: fare {
    type: number
    sql: ${TABLE}.fare ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: pickup_census_tract {
    type: number
    sql: ${TABLE}.pickup_census_tract ;;
  }

  dimension: pickup_community_area {
    type: number
    sql: ${TABLE}.pickup_community_area ;;
  }

  dimension: pickup_latitude {
    type: number
    sql: ${TABLE}.pickup_latitude ;;
  }

  dimension: pickup_location {
    type: string
    sql: ${TABLE}.pickup_location ;;
  }

  dimension: pickup_longitude {
    type: number
    sql: ${TABLE}.pickup_longitude ;;
  }

  dimension: tips {
    type: number
    sql: ${TABLE}.tips ;;
  }

  dimension: tolls {
    type: number
    sql: ${TABLE}.tolls ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: trip_end_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.trip_end_timestamp ;;
  }

  dimension: trip_miles {
    type: number
    sql: ${TABLE}.trip_miles ;;
  }

  dimension: trip_seconds {
    type: number
    sql: ${TABLE}.trip_seconds ;;
  }

  dimension_group: trip_start_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.trip_start_timestamp ;;
  }

  dimension: trip_total {
    type: number
    sql: ${TABLE}.trip_total ;;
  }

  dimension: unique_key {
    type: string
    sql: ${TABLE}.unique_key ;;
  }
  measure: count {
    type: count
    drill_fields: [taxi_id]
  }
}
