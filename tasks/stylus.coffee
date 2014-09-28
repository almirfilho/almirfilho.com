module.exports = (grunt) ->
  grunt.config 'stylus',
    prod:
      files:
        'build/styles/style.css': 'src/assets/styles/main.styl'
    dev:
      options:
        compress: false
      files:
        'build/styles/style.css': 'src/assets/styles/main.styl'
