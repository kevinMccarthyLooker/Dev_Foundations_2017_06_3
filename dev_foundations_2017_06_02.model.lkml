connection: "events_ecommerce"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: users {}

explore: order_items {
  description: "Context"
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: users_summary {
    type: left_outer
    sql_on: ${users.state}=${users_summary.users_state} ;;
    relationship: one_to_one
  }


}
explore: products {}
