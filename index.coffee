# loading dependencies ---------------------------------------------------------

Metalsmith   = require 'metalsmith'
filemetadata = require 'metalsmith-filemetadata'
collections  = require 'metalsmith-collections'
permalinks   = require 'metalsmith-permalinks'
templates    = require 'metalsmith-templates'
markdown     = require 'metalsmith-markdown'
branch       = require 'metalsmith-branch'
handlebars   = require 'handlebars'
fs           = require 'fs'


# handmade plugins -------------------------------------------------------------

partials = (partials) ->
  (files, metalsmith, done) ->
    for partial in partials
      handlebars.registerPartial partial,
        fs.readFileSync "#{__dirname}/src/templates/partials/#{partial}.hbt"
        .toString()
    done()

debug = ->
  (files, metalsmith, done) ->
    console.log files
    done()


# running metalsmith pipeline --------------------------------------------------

new Metalsmith __dirname
  .source 'src/content'
  .use filemetadata [
    {pattern: "**/*.en.md", metadata: {"lang": "en"}},
    {pattern: "**/*.pt.md", metadata: {"lang": "pt"}}
  ]
  .use collections
    posts:
      pattern: 'posts/**/*.en.md'
  .use(
    branch 'posts/**/*.en.md'
      .use markdown smartypants: true
      .use permalinks pattern: 'posts/:title'
  )
  .use(
    branch 'posts/**/*.pt.md'
      .use markdown smartypants: true
      .use permalinks pattern: 'posts/:title/pt'
  )
  .use(
    branch 'pages/**/*.en.md'
      .use markdown smartypants: true
      .use permalinks pattern: ':title'
  )
  .use(
    branch 'pages/**/*.pt.md'
      .use markdown smartypants: true
      .use permalinks pattern: ':title/pt'
  )
  .use markdown smartypants: true
  .use partials ['head', 'header', 'footer']
  .use templates
    engine: 'handlebars'
    directory: 'src/templates'
  .build()
