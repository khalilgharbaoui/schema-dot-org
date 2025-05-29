# frozen_string_literal: true

#
# Model the Schema.org `Thing > Intangible > Offer > AggregateOffer`.  See https://schema.org/Offer
#
module SchemaDotOrg
  class AggregateOffer < SchemaType
    validated_attr :priceCurrency, type: String
    validated_attr :lowPrice,   type: Numeric
    validated_attr :highPrice,  type: Numeric, allow_nil: true
    validated_attr :offerCount, type: String, allow_nil: true
    validated_attr :offers,     type: Array, allow_nil: true
  end
end
