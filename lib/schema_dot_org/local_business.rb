require 'schema_dot_org'

module SchemaDotOrg
  class LocalBusiness < SchemaType
    validated_attr :name,              type: String
    validated_attr :description,       type: String, allow_nil: true
    validated_attr :url,               type: String, allow_nil: true
    validated_attr :telephone,         type: String, allow_nil: true
    validated_attr :email,             type: String, allow_nil: true
    validated_attr :address,           type: SchemaDotOrg::Place, allow_nil: true
    validated_attr :geo,               type: Hash, allow_nil: true
    validated_attr :opening_hours_specification, type: Hash, allow_nil: true
    validated_attr :price_range,       type: String, allow_nil: true
    validated_attr :currencies_accepted, type: String, allow_nil: true
    validated_attr :payment_accepted,  type: Array, allow_nil: true
    validated_attr :area_served,       type: Hash, allow_nil: true
    validated_attr :service_area,      type: Hash, allow_nil: true
    validated_attr :logo,              type: String, allow_nil: true
    validated_attr :image,             type: String, allow_nil: true
    validated_attr :same_as,           type: Array, allow_nil: true
    validated_attr :has_offer_catalog, type: Hash, allow_nil: true
  end
end