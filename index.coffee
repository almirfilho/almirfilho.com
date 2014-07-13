# loading dependencies ---------------------------------------------------------

Metalsmith   = require 'metalsmith'
filemetadata = require 'metalsmith-filemetadata'
collections  = require 'metalsmith-collections'
permalinks   = require 'metalsmith-permalinks'
templates    = require 'metalsmith-templates'
markdown     = require 'metalsmith-markdown'
metadata     = require 'metalsmith-metadata'
branch       = require 'metalsmith-branch'
handlebars   = require 'handlebars'
_s           = require 'underscore.string'
fs           = require 'fs'


# handmade plugins -------------------------------------------------------------

handlebarsConfig = (options) ->
  (files, metalsmith, done) ->
    if 'partials' of options
      for partial in options.partials
        handlebars.registerPartial partial,
          fs.readFileSync "#{__dirname}/src/templates/partials/#{partial}.hbt"
          .toString()

    if 'helpers' of options
      availableHelpers =
        ifequals: (value1, value2, options) ->
          if value1 is value2 then options.fn @ else options.inverse @

        slugify: (str) ->
          new handlebars.SafeString _s.slugify str

        dateformat: (lang = 'en', dateStr) ->
          date = new Date dateStr
          date.setDate date.getDate() + 1
          months =
            en: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
            pt: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez']
          day   = date.getDate()
          month = months[lang][date.getMonth()]
          year  = date.getFullYear()
          new handlebars.SafeString "#{day}-#{month}-#{year}"

        ifEn: (lang = 'en', options) ->
          if lang is 'en' then options.fn @ else options.inverse @

        ifPt: (lang = 'en', options) ->
          if lang is 'pt' then options.fn @ else options.inverse @

        en_pt: (lang = 'en', term_en, term_pt) ->
          new handlebars.SafeString if lang is 'en' then term_en else term_pt

      for helper in options.helpers
        if helper of availableHelpers
          handlebars.registerHelper helper, availableHelpers[helper]

    done()

debug = ->
  (files, metalsmith, done) ->
    console.log files
    done()


# running metalsmith pipeline --------------------------------------------------

new Metalsmith __dirname
  .source 'src/content'
  .use metadata
    author: 'author.yaml'
  .use filemetadata [
    {pattern: "**/*.en.md", metadata: {"lang": "en"}}
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
  .use(
    branch 'styleguides/**/*.md'
      .use markdown smartypants: true
      .use permalinks pattern: 'styleguides/:title'
  )
  .use markdown smartypants: true
  .use handlebarsConfig
    partials: ['head', 'tail', 'header', 'footer', 'back']
    helpers: ['ifequals', 'slugify', 'dateformat', 'ifEn', 'ifPt', 'en_pt']
  .use templates
    engine: 'handlebars'
    directory: 'src/templates'
  .build()
