# loading dependencies ---------------------------------------------------------

Metalsmith  = require 'metalsmith'
collections = require 'metalsmith-collections'
permalinks  = require 'metalsmith-permalinks'
templates   = require 'metalsmith-templates'
markdown    = require 'metalsmith-markdown'
branch      = require 'metalsmith-branch'
handlebars  = require 'handlebars'
fs          = require 'fs'


# registering template partials ------------------------------------------------

partials   = ['head', 'header', 'footer']

addPartial = (name) ->
  handlebars.registerPartial name,
    fs.readFileSync "#{__dirname}/src/templates/partials/#{name}.hbt"
    .toString()

addPartial partial for partial in partials


# running metalsmith pipeline --------------------------------------------------

metalsmith = new Metalsmith __dirname
  .source 'src/content'
  .use(
    branch 'posts/**/*.pt.md'
      .use markdown smartypants: true
      .use permalinks pattern: 'posts/:title/pt'
  ).use(
    branch 'posts/**/*.md'
      .use collections
        posts:
          pattern: 'posts/**/*.md'
      .use markdown smartypants: true
      .use permalinks pattern: 'posts/:title'
  )
  .use templates
    engine: 'handlebars'
    directory: 'src/templates'
  .build()
