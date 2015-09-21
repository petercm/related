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
    it 'detects child relationships'
    it 'detects sibling relationships'
    it 'detects uncle'
    it 'detects grandparent'
    it 'detects non-related persons'
  end

end
