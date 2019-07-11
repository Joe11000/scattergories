class PregameSetup
  require 'json'

  def self.call 
    populate_db_with_categories
  end

  private 
 
  def self.populate_db_with_categories
    categories.each do |category|  
      Category.create question: category
    end
  end

  def self.categories
    @categories ||= JSON.parse category_file
  end

  def self.category_file
    @category_file ||= File.read(category_file_path)
  end

  def self.category_file_path
    @category_file_path ||= File.join(Rails.application.root, 'app', 'assets', 'json', 'categories.json')
  end
end