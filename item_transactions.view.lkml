view: item_transactions {
  derived_table: {
    sql: (
    SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.adidas_trans`
    UNION ALL
    SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.converse_trans`
    UNION ALL
    SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.jordan_trans`
    UNION ALL
    SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.kith_trans`
    UNION ALL
    SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.nike_trans`
    UNION ALL
    SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.off_white_trans`
    UNION ALL
    SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.supreme_shoe_trans`
    UNION ALL
    SELECT brand, item_name, date, size, sale_price AS price FROM `lookerdata.StockX.yeezy_trans`
    );;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.Date ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.Price ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.Size ;;
  }

  measure: count {
    type: count
  }

}
