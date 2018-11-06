connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

datagroup: taifighter_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: taifighter_thesis_default_datagroup

explore: inventory_items {
  join: item_transactions {
    type: inner
    relationship: one_to_many
    sql_on: ${inventory_items.brand} = ${item_transactions.brand} AND
            ${inventory_items.item_name} = ${item_transactions.item_name} AND
            ${inventory_items.size} = ${item_transactions.size};;
  }
}

explore: inventory {
  from: inventory_items
}

explore: item_transactions {}

explore: transaction_date_range {}

explore: size_to_sale_data {}

explore: brands_rollup {}

explore: brand_sales {}

# explore: item_transactions {}
#
# explore: adidas {
#   join: adidas_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${adidas.item_name} = ${adidas_trans.item_name}  AND
#             ${adidas.size} = ${adidas_trans.size};;
#   }
# }
#
# explore: adidas_clothing {
#   join: adidas_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${adidas_clothing.item_name} = ${adidas_trans.item_name} ;;
#   }
# }
#
# # This is a PDT!
# explore: adidas_shoe_transactions {}
#
# # explore: adidas_trans {}
#
# explore: converse {
#   join: converse_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${converse.item_name} = ${converse_trans.item_name} AND
#             ${converse.size} = ${converse_trans.size};;
#   }
# }
#
# # explore: converse_trans {}
#
# explore: jordan {
#   join: jordan_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${jordan.item_name} = ${jordan_trans.item_name} AND
#             ${jordan.size} = ${jordan_trans.size};;
#   }
# }
#
# explore: jordan_clothing {
#   join: jordan_clothing_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${jordan_clothing.item_name} = ${jordan_clothing_trans.item_name} AND
#             ${jordan_clothing.size} = ${jordan_clothing_trans.size};;
#   }
# }
#
# # explore: jordan_clothing_trans {}
# # explore: jordan_trans {}
#
# explore: kith {
#   join: kith_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${kith.item_name} = ${kith_trans.item_name} AND
#             ${kith.size} = ${kith_trans.size};;
#   }
# }
#
# explore: kith_clothing {
#   join: kith_clothing_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${kith_clothing.item_name} = ${kith_clothing_trans.item_name} AND
#             ${kith_clothing.size} = ${kith_clothing_trans.size};;
#   }
# }
#
# # explore: kith_clothing_trans {}
# # explore: kith_trans {}
#
# explore: nike {
#   join: nike_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${nike.item_name} = ${nike_trans.item_name} AND
#             ${nike.size} = ${nike_trans.size};;
#   }
# }
#
# explore: nike_clothing {
#   join: nike_clothing_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${nike_clothing.item_name} = ${nike_clothing_trans.item_name} AND
#             ${nike_clothing.size} = ${nike_clothing_trans.size};;
#   }
# }
#
# # explore: nike_clothing_trans {}
# # explore: nike_trans {}
#
# explore: off_white {
#   join: off_white_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${off_white.item_name} = ${off_white_trans.item_name} AND
#             ${off_white.size} = ${off_white_trans.size};;
#   }
# }
#
# # explore: off_white_trans {}
#
# explore: rolex {
#   join: rolex_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${rolex.item_name} = ${rolex_trans.item_name} AND
#             ${rolex.size} = ${rolex_trans.size};;
#   }
# }
#
# # explore: rolex_trans {}
#
explore: supreme {
  join: supreme_shoe_trans {
    type: inner
    relationship: one_to_many
    sql_on: ${supreme.item_name} = ${supreme_shoe_trans.item_name} AND
        ${supreme.size} = ${supreme_shoe_trans.size};;
  }
}
# #
explore: supreme_clothing {
  join: supreme_trans {
    type: inner
    relationship: one_to_many
    sql_on: ${supreme_clothing.item_name} = ${supreme_trans.item_name} AND
            ${supreme_clothing.size} = ${supreme_trans.size};;
  }
}
#
# # explore: supreme_shoe_trans {}
# # explore: supreme_trans {}
#
# explore: yeezy {
#   join: yeezy_trans {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${yeezy.item_name} = ${yeezy_trans.item_name} AND
#             ${yeezy.size} = ${yeezy_trans.size};;
#   }
# }

# explore: yeezy_trans {}

# rtai tries to do Affinity Analysis...
# explore: adidas {
#   join: converse {}
#   join: jordan {}
#   join: kith {}
#   join: nike {}
#   join: off_white {}
#   join: rolex {}
#   join: supreme {}
#   join: yeezy {}
# }
