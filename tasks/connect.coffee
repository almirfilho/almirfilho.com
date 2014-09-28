module.exports = (grunt) ->
  grunt.config 'connect',
    server:
      options:
        port: 4001
        base: grunt.config.data.paths.build.root
        keepalive: true
