require 'pry'

class SimpleLinkedList
    attr_reader :head

    def push(datum)
      @head = Element.new(datum, head)
    end

    def size
      count = 0
      new_head = head
      loop do
        break if new_head == nil
        count += 1
        new_head = new_head.next
      end
      count
    end

    def empty?
      self.size == 0
    end

    def peek
      head.datum unless empty?
    end

    def pop
      value = head.datum
      @head = head.next
      value
    end

    def self.from_a(arr)
      list = SimpleLinkedList.new
      arr.reverse.each { |x| list.push(x) } unless arr.nil?
      list
    end

    def to_a
      return [] if head.nil?
      arr = []
      temp_el = head
      loop do
        arr.push(temp_el.datum)
        break if temp_el.next.nil?
        temp_el = temp_el.next
      end
      arr
    end

    def reverse
      arr = self.to_a
      temp_list = SimpleLinkedList.new
      arr.each { |x| temp_list.push(x) }
      temp_list
    end
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
