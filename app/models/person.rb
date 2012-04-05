class Person < ActiveRecord::Base
  belongs_to :address1, :class_name => 'Address', :foreign_key => "address_id_1"
  belongs_to :address2, :class_name => 'Address', :foreign_key => "address_id_2"
  has_many :organizations, :through => :members
  has_many :relationships, :dependent => :destroy, :autosave => true  # delete relationship in Relationship table if person deleted
  has_many :donations

  def self.search(q)
    q = q.downcase
    results = Person.where("lower(first_name) = ? or lower(last_name) = ?", q, q)
    results << Person.find_all_by_full_name(q)
    results.flatten
  end

  # searches for all persons with the full name in small case
  def self.find_all_by_full_name(value)
    name = value.split(/\s+/)
    first_name = name[0]
    last_name = name[1]
    Person.where("lower(first_name) = ? AND lower(last_name) = ?", first_name, last_name).all
  end

  def has_relationship?(name)
    self.relationships.each do |rel|
        if rel.name == name
            return true
        end
    end
    false
  end

  def save_relationships(update)
    new_relationships = []
    update.each do |rel|
        new_relationships << Relationship.create!(:person_id => self.id, :name => rel)
    end
    self.relationships = new_relationships
    self.save!
  end

  # prints relationships in alphabetical order
  def print_relationships
    result = []
    self.relationships.each do |elt|
      result << elt.name
    end
    result.sort.join(', ')
  end

end
