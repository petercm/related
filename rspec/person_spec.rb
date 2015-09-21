require_relative '../src/person'

describe Person do
  it 'initializes with name' do
    person = Person.new 'John', nil, nil
    expect(person.name).to eq('John')
  end

  it 'initializes with a mother and father' do
    f = Person.new 'John', nil, nil
    m = Person.new 'Theresa', nil, nil
    person = Person.new 'Son', m, f
    expect(person.mother).to eq(m)
    expect(person.father).to eq(f)
  end

  describe '#is_related_to?' do
    it 'detects child relationships' do
      parent = Person.new 'Dad', nil, nil
      child = Person.new 'Son', nil, parent

      expect(child.is_related_to?(parent)).to be_truthy
      expect(parent.is_related_to?(child)).to be_truthy
    end

    it 'detects sibling relationships' do
      parent = Person.new 'Dad', nil, nil
      child = Person.new 'Son', nil, parent
      child2 = Person.new 'Son2', nil, parent
      expect(child.is_related_to?(child2)).to be_truthy
      expect(child2.is_related_to?(child)).to be_truthy
    end

    it 'detects uncle' do
      grandparent = Person.new 'Gramps', nil, nil
      parent = Person.new 'Dad', nil, grandparent
      child = Person.new 'Son', nil, parent
      uncle = Person.new 'Joe', nil, grandparent

      expect(child.is_related_to?(uncle)).to be_truthy
      expect(uncle.is_related_to?(child)).to be_truthy
    end

    it 'detects grandparent' do
      grandparent = Person.new 'Gramps', nil, nil
      parent = Person.new 'Dad', nil, grandparent
      child = Person.new 'Son', nil, parent

      expect(child.is_related_to?(grandparent)).to be_truthy
      expect(grandparent.is_related_to?(child)).to be_truthy
    end

    it 'detects non-related persons' do
      grandparent = Person.new 'Gramps', nil, nil
      parent = Person.new 'Dad', nil, grandparent
      child = Person.new 'Son', nil, parent

      parent2 = Person.new 'Dad', nil, nil
      child2 = Person.new 'Son', nil, parent2

      expect(child.is_related_to?(child2)).to be_falsy
      expect(child2.is_related_to?(child)).to be_falsy
    end

  end

end
