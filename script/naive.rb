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
    triple = Triple.new( '?subject', name, '?object' )
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

  # JC denots a set of join conditions where a condition is o the form: Attr Op Attr }
  # join_condition.sort_by { |rank| rank }

  join_condition.each do |p|
    jc_left_operand = p.left_operand
    jc_right_operand = p.right_operand

    tp1 = TP.get( jc_left_operand ) # Get the triple pattern for p.left_operand
    tp2 =  TP.get( jc_right_operand ) # Get the triple pattern for p.right_operand
    where_cond += tp1.subject + "" + tp1.predicate + "" tp1.object

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

