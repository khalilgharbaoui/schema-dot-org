# frozen_string_literal: true

require 'schema_dot_org/college_or_university'
#
# Model the Schema.org **Person**.  See http://schema.org/Person
#
module SchemaDotOrg
  class Person < SchemaType
    validated_attr :award,            type: String, allow_nil: true
    validated_attr :alumni_of,        type: SchemaDotOrg::CollegeOrUniversity, allow_nil: true
    validated_attr :honorific_suffix, type: String, allow_nil: true
    validated_attr :name,             type: String, presence: true
    validated_attr :same_as,          type: Array,  allow_nil: true
    validated_attr :url,              type: String, allow_nil: true
  end
end
