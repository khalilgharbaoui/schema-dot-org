# frozen_string_literal: true
require 'json'
require 'validated_object'
require 'graph_container'

module SchemaDotOrg

  def self.create_graph(*schema_objects)
    GraphContainer.new(schema_objects)
  end

  class SchemaType < ValidatedObject::Base
    ROOT_ATTR = { "@context" => "https://schema.org" }.freeze
    UNQUALIFIED_CLASS_NAME_REGEX = /([^:]+)$/

    # Prevent an error raising when and id is not provided.
    validated_attr :id, type: String, allow_nil: true

    def to_s
      json_string = to_json_ld(pretty: (!rails_production? && !ENV['SCHEMA_DOT_ORG_MINIFIED_JSON']))

      # Mark as safe if we're in Rails
      if json_string.respond_to?(:html_safe)
        json_string.html_safe
      else
        json_string
      end
    end


    def to_json_ld(pretty: false)
      "<script type=\"application/ld+json\">\n" + to_json(pretty: pretty, as_root: true) + "\n</script>"
    end


    def to_json(pretty: false, as_root: false)
      structure = as_root ? ROOT_ATTR.merge(to_json_struct) : to_json_struct

      if pretty
        JSON.pretty_generate(structure)
      else
        structure.to_json
      end
    end


    # Use the class name to create the "@type" attribute.
    # @return a hash structure representing json.
    def to_json_struct
      if id
        { "@type" => un_namespaced_classname, "@id" => id }.merge(_to_json_struct.reject { |_, v| v.blank? })
      else
        { "@type" => un_namespaced_classname }.merge(_to_json_struct.reject { |_, v| v.blank? })
      end
    end


    def _to_json_struct
      attrs_and_values
    end


    # @return the classname without the module namespace.
    def un_namespaced_classname
      self.class.name =~ UNQUALIFIED_CLASS_NAME_REGEX
      Regexp.last_match(1)
    end


    def object_to_json_struct(object)
      return nil unless object
      object.to_json_struct
    end


    def attrs_and_values
      attrs.map do |attr|
        # Skip both id and @id since we handle @id separately in to_json_struct
        next if attr.to_s == "id" || attr.to_s == "@id"
        
        attr_string = attr.to_s.delete_prefix('@')
        
        attr_name = snake_case_to_lower_camel_case(attr_string).sub('queryInput', 'query-input')
        attr_value = instance_variable_get(attr)
  
        [attr_name, resolve_value(attr_value)]
      end.compact.to_h
    end


    def resolve_value(value)
      if value.is_a?(Array)
        value.map { |v| resolve_value(v) }

      elsif value.is_a?(Date)
        value.to_s

      elsif is_schema_type?(value)
        value.to_json_struct
        
      else
        value
      end
    end


    def snake_case_to_lower_camel_case(snake_case)
      snake_case.to_s.split('_').map.with_index { |s, i| i.zero? ? s : s.capitalize }.join
    end


    def attrs
      instance_variables.reject{ |v| [:@context_for_validation, :@validation_context, :@errors].include?(v) }
    end


    def is_schema_type?(object)
      object.class.module_parent == SchemaDotOrg
    end


    def rails_production?
      defined?(Rails) && Rails.env.production?
    end
  end
end


require 'schema_dot_org/image_object'
require 'schema_dot_org/action'
require 'schema_dot_org/aggregate_offer'
require 'schema_dot_org/college_or_university'
require 'schema_dot_org/person'
require 'schema_dot_org/contact_point'
require 'schema_dot_org/thing'
require 'schema_dot_org/item_list'
require 'schema_dot_org/list_item'
require 'schema_dot_org/organization'
require 'schema_dot_org/place'
require 'schema_dot_org/offer'
require 'schema_dot_org/product'
require 'schema_dot_org/search_action'
require 'schema_dot_org/web_site'
require 'schema_dot_org/breadcrumb_list'
require 'schema_dot_org/web_page'
require 'schema_dot_org/answer'
require 'schema_dot_org/question'
require 'schema_dot_org/faq_page'
require 'schema_dot_org/collection_page'
require 'schema_dot_org/search_results_page'
require 'schema_dot_org/local_business'
require 'schema_dot_org/review'
require 'schema_dot_org/rating'
require 'schema_dot_org/how_to'
require 'schema_dot_org/how_to_step'
require 'schema_dot_org/store'