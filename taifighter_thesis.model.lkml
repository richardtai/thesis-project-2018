connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

datagroup: taifighter_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: taifighter_thesis_default_datagroup

explore: adidas {
  join: adidas_trans {
    type: inner
    relationship: one_to_many
    sql_on: ${adidas.item_name} = ${adidas_trans.item_name}  AND
            ${adidas.size} = ${adidas_trans.size};;
  }
}

explore: adidas_clothing {
  join: adidas_trans {
    type: inner
    relationship: one_to_many
    sql_on: ${adidas_clothing.item_name} = ${adidas_trans.item_name} ;;
  }
}

explore: adidas_shoe_transactions {}

# explore: adidas_trans {}
#
explore: converse {
  join: converse_trans {
    type: inner
    relationship: one_to_many
    sql_on: ${converse.item_name} = ${converse_trans.item_name} AND
            ${converse.size} = ${converse_trans.size};;
  }
}

#
# explore: converse_trans {}
#
# explore: jordan {}
#
# explore: jordan_clothing {}
#
# explore: jordan_clothing_trans {}
#
# explore: jordan_trans {}
#
# explore: kith {}
#
# explore: kith_clothing {}
#
# explore: kith_clothing_trans {}
#
# explore: kith_trans {}
#
# explore: nike {}
#
# explore: nike_clothing {}
#
# explore: nike_clothing_trans {}
#
# explore: nike_trans {}
#
# explore: off_white {}
#
# explore: off_white_trans {}
#
# explore: rolex {}
#
# explore: rolex_trans {}
#
# explore: supreme {}
#
# explore: supreme_clothing {}
#
# explore: supreme_shoe_trans {}
#
# explore: supreme_trans {}
#
# explore: yeezy {}
#
# explore: yeezy_trans {}
