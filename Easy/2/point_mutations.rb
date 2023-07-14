class DNA
  def initialize(strand)
    @strand = strand
    @length = strand.size
  end

  def hamming_distance(other_strand)
    differences = 0
    other_length = check_length(other_strand.size)

    0.upto(other_length - 1) do |idx|
      differences += 1 if strand[idx] != other_strand[idx]
    end
    differences
  end

  private

  attr_reader :strand, :length

  def check_length(size)
    length > size ? size : length
  end
end
