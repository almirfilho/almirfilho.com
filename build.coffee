Metalsmith = require 'metalsmith'
permalinks = require 'metalsmith-permalinks'
markdown   = require 'metalsmith-markdown'
branch     = require 'metalsmith-branch'

metalsmith = new Metalsmith(__dirname)
  .use(
    branch('**/*.pt.md')
      .use markdown()
      .use permalinks
        pattern: 'posts/:title/pt'
  ).use(
    branch('**/*.md')
      .use markdown()
      .use permalinks
        pattern: 'posts/:title'
  ).build()
