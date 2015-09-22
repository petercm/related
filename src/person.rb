class Person
  attr_accessor :name, :mother, :father

  def initialize(name, mother, father)
    @name = name
    @mother = mother
    @father = father
  end

  def is_related_to?(person)
    !person.nil? && person != self && (
      person == @father ||
      person == @mother ||
      self == person.father ||
      self == person.mother ||
      is_related_to?(person.father) ||
      is_related_to?(person.mother) ||
      (!@father.nil? && @father.is_related_to?(person)) ||
      (!@mother.nil? && @mother.is_related_to?(person))
    )
  end

end
