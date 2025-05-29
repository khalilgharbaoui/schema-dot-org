require 'schema_dot_org'

module SchemaDotOrg
  class Rating < SchemaType
    validated_attr :rating_value,    type: [String, Float, Integer]
    validated_attr :rating_count,    type: Integer, allow_nil: true
    validated_attr :review_count,    type: Integer, allow_nil: true
    validated_attr :best_rating,     type: [String, Float, Integer], allow_nil: true
    validated_attr :worst_rating,    type: [String, Float, Integer], allow_nil: true
    validated_attr :item_reviewed,   type: [SchemaDotOrg::Product, Hash], allow_nil: true
    validated_attr :author,          type: [SchemaDotOrg::Person, SchemaDotOrg::Organization], allow_nil: true
    validated_attr :name,            type: String, allow_nil: true
    validated_attr :description,     type: String, allow_nil: true
  end
end