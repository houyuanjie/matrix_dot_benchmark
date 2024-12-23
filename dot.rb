require 'matrix'

class Matrix
  def dot(other)
    hadamard_product(other).sum
  end

  def dot_times(other)
    sum = 0

    row_count.times do |r|
      column_count.times do |c|
        sum += self[r, c] * other[r, c]
      end
    end

    sum
  end

  def dot_times_inline(other)
    this_rows = rows
    other_rows = other.rows

    num_row_count = this_rows.size
    num_col_count = column_count

    sum = 0

    num_row_count.times do |r|
      this_row = this_rows[r]
      other_row = other_rows[r]

      num_col_count.times do |c|
        sum += this_row[c] * other_row[c]
      end
    end

    sum
  end

  def dot_each_with_index(other)
    this_rows = rows
    other_rows = other.rows

    sum = 0

    this_rows.each_with_index do |this_row, r|
      other_row = other_rows[r]

      this_row.each_with_index do |this_col, c|
        sum += this_col * other_row[c]
      end
    end

    sum
  end

  def dot_each(other)
    this_rows = rows
    other_rows = other.rows

    sum = 0

    r = 0
    this_rows.each do |this_row|
      other_row = other_rows[r]

      c = 0
      this_row.each do |this_col|
        sum += this_col * other_row[c]

        c += 1
      end

      r += 1
    end

    sum
  end
end
