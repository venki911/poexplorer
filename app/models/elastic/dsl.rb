module Elastic
  module DSL

    module Base
      def must_match(attr)
        with_value(attr) { |value| context.must { term attr, value } }
      end

      def filter_match(attr)
        with_value(attr) do |value|
          context.filter :term, {}.tap { |filter| filter[attr] = value }
        end
      end

      def filter_between(attr)
        attr_max = :"max_#{attr}"
        min_value, max_value = search.send(attr), search.send(attr_max)

        return unless min_value.present? || max_value.present?

        range_values = {}.tap do |range_values|
          range_values.update(gte: min_value.to_f) if min_value.present?
          range_values.update(lte: max_value.to_f) if max_value.present?
        end

        context.filter :range, {}.tap { |range| range[attr] = range_values }
      end

      def must_be_gte(attr)
        return unless (attr_value = search.send(attr)).present?
        attr_value = yield attr_value if block_given?
        attr_value = attr_value.to_i
        if attr_value <= 0
          context.must { term attr, 0 }
        else
          context.must { range attr, gte: attr_value }
        end
      end

      def must_be_between(attr, max_prefix = :max)
        attr_max = :"#{max_prefix}_#{attr}"

        min_value, max_value = search.send(attr), search.send(attr_max)

        return unless min_value.present? || max_value.present?

        context.must do
          range_values = {}.tap do |range_values|
            range_values.update(gte: min_value.to_f) if min_value.present?
            range_values.update(lte: max_value.to_f) if max_value.present?
          end

          range attr, range_values
        end
      end

      def must_match_all(attr, default_operator = nil)
        return unless (attr_value = search.send(attr)).present?
        context.must { string attr_value, default_operator: default_operator }
      end

      def must_match_string(prop, attr = nil, default_operator = "AND")
        attr ||= prop
        return unless (attr_value = search.send(attr)).present?
        context.must { string "#{prop}:#{attr_value}", default_operator: default_operator }
      end

      def must_exist(attr)
        context.must { string "_exists_:#{attr}" }
      end
    end
  end
end
