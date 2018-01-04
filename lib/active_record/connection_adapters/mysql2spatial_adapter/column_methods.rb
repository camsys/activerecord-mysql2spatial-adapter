module ActiveRecord
  module ConnectionAdapters
    module Mysql2SpatialAdapter
      module ColumnMethods
        def spatial(name, options = {})
          # temporarily hand issue with schema dumper that doesnt set spatial type to always default to geometry. TODO: figure out why its not setting type
          # this is related to this issue: https://github.com/rgeo/activerecord-mysql2spatial-adapter/issues/14
          if options[:limit] && options[:limit][:type]
            column(name, options[:limit][:type], options)
          else
            geometry(name, options)
          end
        end

        def geography(name, options = {})
          column(name, :geography, options)
        end

        def geometry(name, options = {})
          column(name, :geometry, options)
        end

        def geometry_collection(name, options = {})
          column(name, :geometry_collection, options)
        end

        def line_string(name, options = {})
          column(name, :line_string, options)
        end

        def multi_line_string(name, options = {})
          column(name, :multi_line_string, options)
        end

        def multi_point(name, options = {})
          column(name, :multi_point, options)
        end

        def multi_polygon(name, options = {})
          column(name, :multi_polygon, options)
        end

        def point(name, options = {})
          column(name, :point, options)
        end
      end

      ConnectionAdapters::TableDefinition.send(:include, ColumnMethods)
    end
  end
end
