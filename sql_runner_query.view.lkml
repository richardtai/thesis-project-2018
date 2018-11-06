view: transaction_date_range {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'item_transactions.date_date'


      WITH inventory_items AS ((
            SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url FROM `lookerdata.StockX.adidas`
            UNION ALL
            SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url FROM `lookerdata.StockX.converse`
            UNION ALL
            SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url FROM `lookerdata.StockX.jordan`
            UNION ALL
            SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url FROM `lookerdata.StockX.kith`
            UNION ALL
            SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url FROM `lookerdata.StockX.nike`
            UNION ALL
            SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url FROM `lookerdata.StockX.off_white`
            UNION ALL
            SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url FROM `lookerdata.StockX.yeezy`
          ))
        ,  item_transactions AS ((
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
          ))
      SELECT
        CAST(min(item_transactions.Date)  AS DATE) AS item_transactions_min_date,
        CAST(max(item_transactions.Date)  AS DATE) AS item_transactions_max_date
      FROM inventory_items
      INNER JOIN item_transactions ON inventory_items.Brand = item_transactions.Brand AND
                  inventory_items.Item_Name = item_transactions.item_name AND
                  inventory_items.Size = item_transactions.Size
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: item_transactions_min_date {
    type: date
    sql: ${TABLE}.item_transactions_min_date ;;
  }

  dimension: item_transactions_max_date {
    type: date
    sql: ${TABLE}.item_transactions_max_date ;;
  }

  set: detail {
    fields: [item_transactions_min_date, item_transactions_max_date]
  }
}
