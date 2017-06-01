view: products {
  sql_table_name: public.PRODUCTS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.BRAND ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.COST ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.DEPARTMENT ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DISTRIBUTION_CENTER_ID ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.RETAIL_PRICE ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, distribution_centers.id, distribution_centers.name, inventory_items.count]
  }

  dimension: product_image {
    sql: ${brand} ;;
    html:
    <html>
<body>

<p>
<a href="https://www.w3schools.com">
<img border="0" alt="W3Schools" src="http://siteassets.pagecloud.com/windigo/images/home_button-ID-d10b0bc4-a63e-4897-e666-06b541480ed6.png?nocache%3D12c61756-d36b-4ce6-9376-677b8250cf5f" width="200" height="80">
</a>
</p>

</body>
</html>
;;
  }
#     <img src="http://siteassets.pagecloud.com/windigo/images/home_button-ID-d10b0bc4-a63e-4897-e666-06b541480ed6.png?nocache%3D12c61756-d36b-4ce6-9376-677b8250cf5f" />
#     <a href="/explore/model/explore_name?fields=view.field_1,view.field_2,view.field_3&f[view.filter_1]={{ value }}&pivots=view.field_2">{{ value }}</a>
#     ;;



}
# https://www.google.com/imgres?imgurl=
# &imgrefurl=https://www.shutterstock.com/search/male%2Band%2Bfemale%2Bsymbols&h=470&w=450&tbnid=dEYaMmFrAXgPZM:&tbnh=160&tbnw=153&usg=__JLUavLGAUzYchBJ_6MI5fqq1NPg=&vet=1&docid=ixw1KCA69BFrHM&sa=X&ved=0ahUKEwjZneWis53UAhUEbhQKHWhLCGAQ9QEIJjAA
