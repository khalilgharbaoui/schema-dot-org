# frozen_string_literal: true


#
# Model the Schema.org `ItemListElement`.  See https://schema.org/ItemListElement
#
module SchemaDotOrg
  class ListItem < SchemaType
    validated_attr :image,     type: String,                allow_nil: true
    validated_attr :item,      type: String,   allow_nil: true
    validated_attr :name,      type: String,                allow_nil: true
    validated_attr :position,  type: Integer,               presence:  true
    validated_attr :url,       type: String,                allow_nil: true
  end
end
