view: users_summary {
  derived_table: {
    sql: SELECT
        'State of ' || users.STATE   AS "users.state",
        COUNT(DISTINCT users.ID ) AS "users.count"
      FROM public.ORDER_ITEMS  AS order_items
      LEFT JOIN public.USERS  AS users ON order_items.USER_ID = users.ID

      WHERE
        (users.AGE  > 30)
      GROUP BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}."users.state" ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}."users.count" ;;
  }

  set: detail {
    fields: [users_state, users_count]
  }
}
