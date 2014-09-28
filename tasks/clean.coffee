module.exports = (grunt) ->
  grunt.config 'clean',
    all: ['build']
    after: ['build/pages', 'build/posts/2014']
