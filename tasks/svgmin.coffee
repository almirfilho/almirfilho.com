module.exports = (grunt) ->
  grunt.config 'svgmin',
    dist:
      files: [
        expand: true
        cwd: grunt.config.data.paths.src.images
        src: ['**/*.svg']
        dest: grunt.config.data.paths.build.images
      ]
