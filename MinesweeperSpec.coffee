{Minesweeper} = require './Minesweeper'

describe 'Minesweeper', ->

  subject = null
  
  beforeEach ->
    subject = new Minesweeper()
  
  it 'Should work with one row', ->
    given = ["1 3", "*.."].join("\n")
    expected = "Field #{}1\n*10"
    actual = subject.proximity(given)
    expect(actual).toEqual(expected)
    
  it 'Should work with two rows', ->
    given = ["2 3", "*..", "*.."].join("\n")
    expected = "Field #{}1\n*20\n*20"
    actual = subject.proximity(given)
    expect(actual).toEqual(expected)    
        
  it 'Should work with three rows', ->
    given = ["2 3", "*..", "*.."].join("\n")
    expected = "Field #{}1\n*20\n*20"
    actual = subject.proximity(given)
    expect(actual).toEqual(expected)    

  it 'Should work with suggested cases', ->
    given = [['4 4', '*...', '....', '.*..', '....'],
             ['3 5', '**...', '.....', '.*...'],
             ['0 0']].reduce((a, b) -> a.concat(b)).join('\n')
             
    expected = ['Field 1', '*100', '2210', '1*10', '1110'].concat(['Field 2', '**100', '33200', '1*100']).join('\n')
    console.log given   
    actual = subject.proximity(given)
    expect(actual).toEqual(expected) 
    console.log actual   
