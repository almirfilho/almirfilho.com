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
        svgLogo: -> new handlebars.SafeString svgLogoContent if svgLogoContent

        slugify: (str) -> new handlebars.SafeString _s.slugify str

        ifequals: (value1, value2, options) ->
          if value1 is value2 then options.fn @ else options.inverse @

        dateformat: (lang, dateStr, part = null) ->
          date = new Date dateStr
          date.setDate date.getDate() + 1
          months =
            en: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
            pt: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez']
          day   = date.getDate()
          month = months[lang][date.getMonth()]
          year  = date.getFullYear()

          new handlebars.SafeString switch part
            when 'day' then day
            when 'month' then month
            when 'year' then year
            when 'shortYear' then new String(year)[2..]
            else "#{day} / #{month} / #{year}"

        ifEn: (lang = 'en', options) ->
          if lang is 'en' then options.fn @ else options.inverse @

        ifPt: (lang = 'en', options) ->
          if lang is 'pt' then options.fn @ else options.inverse @

        en_pt: (lang = 'en', term_en, term_pt) ->
          new handlebars.SafeString if lang is 'en' then term_en else term_pt

        urlTo: (lang, path = '') ->
          if lang? and path?
            if path is '/' or path is '/pt'
              return if lang is 'en' then '/' else '/pt/'
            ptEnd = '/pt'
            strEndsWithPt = path.indexOf(ptEnd, path.length - ptEnd.length) isnt -1
            if lang is 'en' and strEndsWithPt
              path = new handlebars.SafeString path[..-(ptEnd.length + 1)]
            else if lang is 'pt' and not strEndsWithPt
              path = new handlebars.SafeString "#{path}/pt"
            "/#{path}/"

      for helper in options.helpers
        if helper of availableHelpers
          handlebars.registerHelper helper, availableHelpers[helper]

    done()

debug = ->
  (files, metalsmith, done) ->
    console.log files
    done()

rss = ->
  qnt = 10
  dest = 'index.xml'

  (files, metalsmith, done) ->
    # carregar template
    templateFile = "#{__dirname}/src/templates/feed.hbt"
    fs.readFile templateFile, {encoding: 'utf8'}, (err, data) ->
      templateContent = data.toString()
      template = handlebars.compile(templateContent)
      contents = template({posts: files})

      files[dest] = {
        contents: contents
      }
      done()


# running metalsmith pipeline --------------------------------------------------

svgLogoContent = (->
  filename = 'src/content/images/almirfilho-logo.svg'
  fs.readFileSync("#{__dirname}/#{filename}").toString()
)()

new Metalsmith __dirname
  .source 'src/content'
  .use metadata
    author: 'author.yaml'
  .use filemetadata [
    {pattern: "**/*.en.md", metadata: {"lang": "en"}}
    {pattern: "**/*.pt.md", metadata: {"lang": "pt"}}
  ]
  .use collections
    posts_en:
      pattern: 'posts/**/*.en.md'
    posts_pt:
      pattern: 'posts/**/*.pt.md'
  .use(
    branch 'posts/**/*.en.md'
      .use markdown smartypants: true
      .use permalinks pattern: ':slug'
      .use rss()
  )
  .use(
    branch 'posts/**/*.pt.md'
      .use markdown smartypants: true
      .use permalinks pattern: ':slug/pt'
  )
  .use(
    branch 'pages/**/*.en.md'
      .use markdown smartypants: true
      .use permalinks pattern: ':slug'
  )
  .use(
    branch 'pages/**/*.pt.md'
      .use markdown smartypants: true
      .use permalinks pattern: ':slug/pt'
  )
  .use(
    branch 'styleguides/**/*.md'
      .use markdown smartypants: true
      .use permalinks pattern: 'styleguides/:slug'
  )
  .use(
    branch 'home/index.en.md'
      .use markdown smartypants: true
      .use permalinks '/'
  )
  .use(
    branch 'home/index.pt.md'
      .use markdown smartypants: true
      .use permalinks '/pt'
  )
  .use markdown smartypants: true
  .use handlebarsConfig
    partials: ['head', 'tail', 'header', 'footer', 'scripts']
    helpers: ['ifequals', 'slugify', 'dateformat', 'ifEn', 'ifPt', 'en_pt', 'urlTo',  'svgLogo']
  .use templates
    engine: 'handlebars'
    directory: 'src/templates'
  .build()
