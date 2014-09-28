module.exports = (grunt) ->
  build = grunt.config.data.paths.build.root

  grunt.config 'clean',
    all: [build]
    after: ["#{build}/pages", "#{build}/posts/2014"]
