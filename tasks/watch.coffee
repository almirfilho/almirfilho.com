module.exports = (grunt) ->
  src = grunt.config.data.paths.src

  grunt.config 'watch',
    content:
      tasks: ['build:dev']
      files: [
        "#{src.content}/**/*.md"
        "#{src.content}/*.yaml"
        "#{src.templates}/**/*.hbt"
      ]

    styles:
      tasks: ['stylus:dev']
      files: ["#{src.styles}/**/*.styl"]

    images:
      tasks: ['copy:images']
      files: ["#{src.root}/**/*.{jpg,svg,png}"]
