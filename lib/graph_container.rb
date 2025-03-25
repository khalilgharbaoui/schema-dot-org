module SchemaDotOrg
  class GraphContainer
    def initialize(*schema_objects)
      @schema_objects = schema_objects.flatten
    end
  
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
      "<script type=\"application/ld+json\">\n" + to_json(pretty: pretty) + "\n</script>"
    end
  
    def to_json(pretty: false)
      structure = { 
        "@context" => "https://schema.org", 
        "@graph" => @schema_objects.map(&:to_json_struct),
      }

      structure["@id"] = @id if @id

      if pretty
        JSON.pretty_generate(structure)
      else
        structure.to_json
      end
    end

    def rails_production?
      defined?(Rails) && Rails.env.production?
    end
  end
end

