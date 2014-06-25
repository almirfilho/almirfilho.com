Metalsmith = require 'metalsmith'
permalinks = require 'metalsmith-permalinks'
templates  = require 'metalsmith-templates'
markdown   = require 'metalsmith-markdown'
branch     = require 'metalsmith-branch'

metalsmith = new Metalsmith __dirname
  .source 'src/content'
  .use(
    branch '**/*.pt.md'
      .use markdown smartypants: true
      .use permalinks pattern: 'posts/:title/pt'
  ).use(
    branch '**/*.md'
      .use markdown smartypants: true
      .use permalinks pattern: 'posts/:title'
  )
  .use templates
    engine: 'handlebars'
    directory: 'src/templates'
  .build()
