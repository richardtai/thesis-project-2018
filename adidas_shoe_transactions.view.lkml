# If necessary, uncomment the line below to include explore_source.
# include: "taifighter_thesis.model.lkml"

view: adidas_shoe_transactions {
  derived_table: {
    explore_source: adidas {
      column: image_url {}
      column: item_name {}
      column: retail_price {}
#       column: price { field: adidas_trans.price }
      column: size {}
      column: annual_high {}
      column: annual_low {}
      column: average_price {}
    }
  }
  dimension: image_url {
    html: <img src="{{value}}" width="80px"/>;;
  }
  dimension: item_name {}
  dimension: retail_price {
    type: number
  }
  dimension: price {
    type: number
  }
  dimension: size {
    type: number
  }
  dimension: annual_high {
    type: number
  }
  dimension: annual_low {
    type: number
  }
  dimension: average_price {
    type: number
  }
}
