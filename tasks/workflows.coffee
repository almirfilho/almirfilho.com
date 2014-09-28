module.exports = (grunt) ->
  # generation workflows
  grunt.registerTask 'metal', ['shell:metalsmith', 'clean:after']

  # optimization workflows
  grunt.registerTask 'minify', ['svgmin']

  # building workflows
  grunt.registerTask 'build:dev', ['clean:all', 'metal', 'stylus:dev', 'copy']
  grunt.registerTask 'build:prod', ['clean:all', 'metal', 'stylus:prod', 'copy', 'minify']

  # running workflows
  grunt.registerTask 'run', ['build:dev', 'concurrent']
  grunt.registerTask 'default', ['run']
