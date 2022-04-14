require 'pry'

class TemplateGenerator
  def initialize
    # load all the clauses from clauses.rb file
    @clauses      = eval File.read(Dir.pwd.include?("lib") ? "../data/clauses.rb" : "./data/clauses.rb")
    # load all the sections from sections.rb file
    @sections     = eval File.read(Dir.pwd.include?("lib") ? "../data/sections.rb" : "./data/sections.rb")
  end

  def create(clauses_ids = [], section_ids = [])
    puts "A T&C Document"
    puts ""
    puts "This document is made of plaintext."

    # print all the clauses that are sent in the params
    if clauses_ids.count.positive?
      clauses_ids.each do |clause|
        puts "Is made of #{get_clause(clause)}."
      end
    end

    # print all the section clauses that are sent in the params
    if section_ids.count.positive?
      section_ids.each do |section|
        puts "Is made of #{get_section_clauses(section)}."
      end
    end
    puts ""
    puts "Your legals."
  end

  # get specific clause from the clauses hash
  def get_clause(id)
    @clauses.select{|hash| hash if hash[:id] == id}.first[:text]
  end

  # get specific section and there clause from the sections hash
  def get_section_clauses(id)
    ids     = @sections.select{|hash| hash if hash[:id] == 1}.first[:clauses_ids]
    clauses = @clauses.select{|hash| hash if ids.include?(hash[:id])}
    clauses.map{|hash| hash[:text]}.join(";")
  end
end
