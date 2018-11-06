view: brands_rollup {
  derived_table: {
    sql: SELECT brand, total_sale, total_sale_count, volatility, bid_count, average_price, item_name FROM `lookerdata.StockX.supreme`
          UNION ALL
          SELECT brand, total_sale, total_sale_count, volatility, bid_count, average_price, item_name FROM `lookerdata.StockX.adidas`
          UNION ALL
          SELECT brand, total_sale, total_sale_count, volatility, bid_count, average_price, item_name FROM `lookerdata.StockX.converse`
          UNION ALL
          SELECT brand, total_sale, total_sale_count, volatility, bid_count, average_price, item_name FROM `lookerdata.StockX.jordan`
          UNION ALL
          SELECT brand, total_sale, total_sale_count, volatility, bid_count, average_price, item_name FROM `lookerdata.StockX.kith`
          UNION ALL
          SELECT brand, total_sale, total_sale_count, volatility, bid_count, average_price, item_name FROM `lookerdata.StockX.nike`
          UNION ALL
          SELECT brand, total_sale, total_sale_count, volatility, bid_count, average_price, item_name FROM `lookerdata.StockX.off_white`
          UNION ALL
          SELECT brand, total_sale, total_sale_count, volatility, bid_count, average_price, item_name FROM `lookerdata.StockX.yeezy`
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    drill_fields: [detail*]
  }

  dimension: total_sale {
    type: number
    sql: ${TABLE}.total_sale ;;
    drill_fields: [detail*]

  }

  dimension: total_sale_count {
    type: number
    sql: ${TABLE}.total_sale_count ;;
    drill_fields: [detail*]
  }

  dimension: volatility {
    type: number
    sql: ${TABLE}.volatility ;;
  }

  dimension: bid_count {
    type: number
    sql: ${TABLE}.bid_count ;;
  }

  dimension: average_price {
    type: number
    sql: ${TABLE}.average_price ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  set: detail {
    fields: [
      brand,
      total_sale,
      total_sale_count,
      volatility,
      bid_count,
      average_price,
      item_name
    ]
  }
}
