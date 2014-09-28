module.exports = (grunt) ->
  src   = "#{grunt.config.data.paths.src.styles}/main.styl"
  build = "#{grunt.config.data.paths.build.styles}/style.css"

  grunt.config 'stylus',
    prod:
      src: src
      dest: build
    dev:
      src: src
      dest: build
      options:
        compress: false
