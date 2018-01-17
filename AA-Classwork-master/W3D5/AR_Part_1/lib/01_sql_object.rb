require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      SQL

    @columns.first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column|
      # create a hash object for the col name as KEY
      # and the value as what it is set to
      # debugger
      define_method(column) do
        attributes[column]
      end

      define_method("#{column.to_s}=") do |arg|
        attributes[column] = arg
      end

      # define_method("#{column}=") do |arg|
      #   @attributes[:column] = arg
      # end
    end
  end

  def self.table_name=(table_name) # not sure
    @table_name = table_name
  end

  def self.table_name # above spec passes with this alone
    @table_name ||= "#{self}".tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    all_classes = []

    results.each do |params|
      all_classes << self.new(params)
    end

    all_classes
  end

  def self.find(id)
    # fetch one record from the DB using SQL # LIMIT?
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
      LIMIT 1
    SQL

    debugger
  end

  def initialize(params = {})
    params.each do |attr_name, v|
      # debugger
      attr_name = attr_name.to_sym
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)

      send("#{attr_name}=", v)
    end
  end

  def attributes
    @attributes ||= {}
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
