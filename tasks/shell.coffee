module.exports = (grunt) ->
  grunt.config 'shell',
    metalsmith:
      command: "node_modules/.bin/coffee #{grunt.config.data.pkg.main}"
      options:
        stderr: false
