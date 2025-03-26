module SchemaDotOrg
  class BreadcrumbList < SchemaType
    validated_attr :item_list_element, type: SchemaDotOrg::ListItem, presence: true
  end
end
