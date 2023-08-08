class SimpleLinkedList
    def initialize
      @simple_list = []
    end

    def push(el)
      simple_list.prepend(Element.new(el, simple_list.first))
    end

    def head
      simple_list.first
    end

    def size
      simple_list.size
    end

    def empty?
      simple_list.empty?
    end

    def peek
      simple_list.first.datum unless simple_list.first == nil
    end

    def pop
      simple_list.shift.datum
    end

    def self.from_a(arr)
      list = SimpleLinkedList.new
      arr.reverse.each { |x| list.push(x) } unless arr.nil?
      list
    end

    def to_a
      simple_list.map.with_object([]) { |x, arr| arr << x.datum }
    end

    def reverse
      arr = simple_list.map { |x| x.datum }
      SimpleLinkedList.from_a(arr.reverse)
    end

    private 

    attr_reader :simple_list
end

class Element < SimpleLinkedList
  attr_reader :datum, :next

  def initialize(datum, next_el=nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end
