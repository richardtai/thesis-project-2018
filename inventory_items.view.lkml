view: inventory_items {
  derived_table: {
    sql: (
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
    );;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.Image_URL ;;
    html: <img src="{{value}}" width="200px"/> ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.Item_Name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.Retail_Price ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.Size ;;
  }

  dimension: ask_count {
    type: number
    sql: ${TABLE}.Ask_Count ;;
  }

  dimension: average_price {
    type: number
    sql: ${TABLE}.Average_Price ;;
  }

  dimension: bid_count {
    type: number
    sql: ${TABLE}.Bid_Count ;;
  }

  dimension: total_sale {
    type: number
    sql: ${TABLE}.Total_Sale ;;
  }

  dimension: total_sale_count {
    type: number
    sql: ${TABLE}.Total_Sale_Count ;;
  }

  dimension: volatility {
    type: number
    sql: ${TABLE}.Volatility ;;
  }

  dimension_group: release {
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
    sql: CAST(DATE_ADD(CAST(${TABLE}.release_date as DATE), INTERVAL 2000 YEAR) as TIMESTAMP);;
  }

}
