require 'sql_parser'
require 'pp'

INPUT = "select * from person, address where id = '1' and address_id = '2'"

class Triple
  attr_reader :subject, :predicate, :object
  def initialize( subject, predicate, object )
    @subject, @predicate, @object = subject, predicate, object
  end

  def to_s
    "A triple: #{self.subject} #{self.predicate} #{self.object}"
  end
end

def trans_from_closure( tables = [] ) #, is_distinct = false )
  triple_pattern = {}
  tables.each do |table|
    name = table.to_s
    triple = Triple.new( '', name, '' )
    triple_pattern.store( name, triple )
  end
  triple_pattern
end

def trans_where_closure( join_condition, boolean_expression, triple_pattern, rank )
  where_cond = ''

  if ( join_condition.empty? && !boolean_condition.empty? )
    triple_pattern.each do |tp|
      where_cond += tp.to_s
    end
  end

  where_cond
end

def trans_select_closure
end

def query_mapping
end

def merge
end

def parse( input )
  parser = SqlParser.new
  result = parser.parse input
  result
end

def is_distinct?( set_quantifier )
  true if set_quantifier == :distinct
  false
end

parsed = parse( INPUT )
tp = trans_from_closure( parsed.tables ) #, is_distinct?( parsed.set_quantifier ) )

# pp tp
tp.each { |p| puts p }

# pp parsed

