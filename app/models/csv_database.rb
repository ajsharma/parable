# frozen_string_literal: true
require "csv"

class CSVDatabase
  CSV_FILE_NAME = "parable.csv"

  attr_reader :file_name

  def initialize(file_name = CSV_FILE_NAME)
    @file_name = file_name

    create_file unless initialized?
  end

  def initialized?
    File.exist?(file_name)
  end

  def create_or_update_pairs(pairs)
    write_to_csv_file do |csv|
      pairs.each do |pair|
        csv << [
          pair.first_object.to_s,
          pair.second_object.to_s,
          Time.now.to_s,
        ]
      end
    end
  end

  private

  def write_to_csv_file
    CSV.open(file_name, "wb") do |csv|
      yield csv
    end
  end

  def create_file
    return if initialized?

    write_to_csv_file do |csv|
      csv << [ :name_2, :name_1, :last_met_at ]
    end
  end
end
