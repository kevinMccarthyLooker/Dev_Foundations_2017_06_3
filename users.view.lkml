view: users {
  sql_table_name: public.USERS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

# comment


  dimension: age {
    type: number
    sql: ${TABLE}.AGE ;;
  }

  dimension: age_under_30 {
    type: yesno
    sql: ${age}<30 ;;
  }

  dimension: age_under_40 {
    type: yesno
    sql: ${age}<60 ;;
  }

  dimension: age_under_50 {
    type: yesno
    sql: ${age}<50 ;;
  }

  dimension: age_under_60 {
    type: yesno
    sql: ${age}<60 ;;
  }


  dimension: age_tier {
    type: tier
    tiers: [20,30,40,50,60,70]
    sql: ${age} ;;
    style: integer
  }

  dimension: city {
    type: string
    sql: ${TABLE}.CITY || ', ' || ${state} ;;

  }

  dimension: country {
    type: string
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.GENDER ;;
  }

  dimension: gender2 {
    type: string
    sql: ${gender} ;;

  }




  dimension: last_name {
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE ;;
  }

  dimension: state {
    type: string
    sql: 'State of ' || ${TABLE}.STATE  ;;
    drill_fields: [city]
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.TRAFFIC_SOURCE ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.ZIP ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, events.count, order_items.count]
  }
}
