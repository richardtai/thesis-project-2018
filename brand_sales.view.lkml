view: brand_sales {
  derived_table: {
    sql: WITH brands_rollup AS (SELECT brand, total_sale, total_sale_count, volatility, bid_count, average_price, item_name FROM `lookerdata.StockX.supreme`
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
 )
SELECT
  brands_rollup.brand  AS brands_rollup_brand,
  sum(brands_rollup.total_sale)  AS brands_rollup_total_sale,
  sum(brands_rollup.total_sale_count)  AS brands_rollup_total_sale_count
FROM brands_rollup

GROUP BY 1
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: brands_rollup_brand {
    type: string
    sql: ${TABLE}.brands_rollup_brand ;;
  }

  dimension: brands_rollup_total_sale {
    type: number
    sql: ${TABLE}.brands_rollup_total_sale ;;
  }

  dimension: brands_rollup_total_sale_count {
    type: number
    sql: ${TABLE}.brands_rollup_total_sale_count ;;
  }

  set: detail {
    fields: [brands_rollup_brand, brands_rollup_total_sale, brands_rollup_total_sale_count]
  }
}
