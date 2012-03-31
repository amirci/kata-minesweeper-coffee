class InputField
  constructor: (@rows, @cols, @mines) ->

  expose: -> (this.exposeRow(r) for r in [0..@rows-1]).join('\n')

  exposeRow: (row) -> (this.countMines(row, col) for col in [0..@cols-1]).join('')
    
  countMines: (row, col) ->
    x = @mines[row][col]
    return x if this.isExplosive(x)
    (this.explosiveCount(nb) for nb in this.neighbours(row, col)).reduce (t, s) -> t + s

  isExplosive: (x) -> x == '*'
    
  neighbours: (row, col) ->
    [[row-1, col-1], [row-1, col], [row-1, col+1], 
     [row, col-1], [row, col+1], 
     [row+1, col-1], [row+1, col], [row+1, col+1]]

  explosiveCount: ([row, col]) -> 
    return 0 unless row in [0..@rows-1] && col in [0..@cols-1]
    this.isExplosive(@mines[row][col]) ? 1 : 0
  
exports.InputField = InputField