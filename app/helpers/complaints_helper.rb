module ComplaintsHelper
  def descriptions_hash
    @complaints.group_by { |i| i.descriptor }
  end

  def descriptions
    description_hash.keys
  end

  def descriptions_count
    count = []
    descriptions_value_hash.each_value { |value| count << value.count }
  end

  def descriptions_totals
    descriptions.zip(descriptions_count)
  end

  def ordered_description_totals
    description_totals.sort_by { |x, y| y }
  end

  def top_ten
    ordered_description_totals[0..10]
  end
  # def top_descriptors
  #   d = @complaints.group_by { |i| i.descriptor }
  #   d.each_pair { |key, value| puts "#{value.count}: #{key}" }
  #   descriptions = d.keys
  #   count = []
  #   d.each_value { |value| count << value.count }
  #   dc = descriptions.zip(count)
  #   dc.sort_by { |descriptor, value| value }
  # end
end
