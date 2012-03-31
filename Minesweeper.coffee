{InputField} = require('./InputField')
    
class Minesweeper

  proximity: (fields) ->
    this.expose this.parse fields.split '\n'

  parse: (fields) ->
    return [] unless fields.length > 0
    [header, mines...] = fields
    [rows, space, cols] = header
    return this.parse(mines) if rows == '0' && cols == '0'
    [new InputField(rows, cols, mines[0..rows-1])].concat this.parse mines[rows..-1]
    
  expose: (inputFields) ->
    i = 1
    exposeField = (f) -> "Field #{i++}\n" + f.expose()
    inputFields.map(exposeField).join('\n')

    
exports.Minesweeper = Minesweeper