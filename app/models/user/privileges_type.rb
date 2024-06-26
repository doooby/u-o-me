class User::PrivilegesType < ActiveRecord::Type::Value

    def cast value
      return [] unless value.is_a? Array
      value.filter_map{ User::PrivilegesType.sanitize_item _1 }.presence
    end

    def deserialize value
      value = JSON.parse value rescue nil
      cast value
    end

    def serialize value
      value&.filter_map{ User::PrivilegesType.serialize_item _1 }.presence&.to_json
    end

    def self.sanitize_item value
      case value
      when 'admin' then value
      end
    end

    def self.serialize_item value
      value
    end

  end
