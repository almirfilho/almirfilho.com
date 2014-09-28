module.exports = (grunt) ->
  require('load-grunt-tasks') grunt

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    paths:
      src:
        root: 'src'
        content: 'src/content'
        templates: 'src/templates'
        posts: 'src/content/posts'
        images: 'src/content/images'
        styles: 'src/assets/styles'
        fonts: 'src/assets/fonts'
      build:
        root: 'build'
        posts: 'build/posts'
        images: 'build/images'
        styles: 'build/styles'
        fonts: 'build/fonts'

  grunt.loadTasks 'tasks'
