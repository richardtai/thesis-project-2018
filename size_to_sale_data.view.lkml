view: size_to_sale_data {
  derived_table: {
    sql: WITH inventory_items AS ((
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.adidas`
      UNION ALL
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.converse`
      UNION ALL
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.jordan`
      UNION ALL
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.kith`
      UNION ALL
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.nike`
      UNION ALL
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.off_white`
      UNION ALL
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.yeezy`
    ))
SELECT
  inventory.Size  AS inventory_size,
  SUM(inventory.Total_Sale)  AS inventory_total_sale
FROM inventory_items AS inventory

GROUP BY 1, inventory_size
ORDER BY 1
LIMIT 500
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: inventory_size {
    type: number
    sql: ${TABLE}.inventory_size ;;
  }

  dimension: inventory_total_sale {
    type: number
    sql: ${TABLE}.inventory_total_sale ;;
  }

  set: detail {
    fields: [inventory_size, inventory_total_sale]
  }
}
