module.exports = (grunt) ->
  grunt.config 'connect',
    server:
      options:
        port: 4001
        base: 'build'
        keepalive: true
