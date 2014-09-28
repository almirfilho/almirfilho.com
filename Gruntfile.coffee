module.exports = (grunt) ->
  require('load-grunt-tasks') grunt

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    paths: grunt.file.readYAML 'tasks/paths.yaml'

  grunt.loadTasks 'tasks'
