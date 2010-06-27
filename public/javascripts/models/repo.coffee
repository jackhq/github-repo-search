# {"name":"mashup","size":1148,"followers":1,
# "language":"CoffeeScript","fork":false,
# "username":"malkomalko","id":"repo-676390","type":"repo",
# "pushed":"2010-05-24T16:38:34Z","forks":1,
# "description":"coffeescript, node.js, express, mongodb, sammy, jquery",
# "score":0.61544037,"created":"2010-05-20T03:45:36Z"}

Ext.regModel 'Repo', {
  fields: [
    { name: 'id',                 type: 'string'}
    { name: 'name',               type: 'string'}
    { name: 'size',               type: 'int'}
    { name: 'followers',          type: 'int'}
    { name: 'language',           type: 'string'}
    { name: 'fork',               type: 'bool'}
    { name: 'size',               type: 'string'}
    { name: 'followers',          type: 'string'}
    { name: 'language',           type: 'string'}
    { name: 'pushed',             type: 'datetime'}
    { name: 'username',           type: 'string'}
    { name: 'description',        type: 'string'}
    { name: 'score',              type: 'float'}
    { name: 'created',            type: 'datetime'}
    
    
  ]
}