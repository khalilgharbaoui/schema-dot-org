module SchemaDotOrg
  class BreadcrumbList < SchemaType
    validated_attr :item_list_element, type: Array, presence: true
  end
end
