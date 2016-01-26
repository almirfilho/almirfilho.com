module.exports = (grunt) ->
  grunt.config 'shell',
    metalsmith:
      command: "node_modules/.bin/coffee #{grunt.config.data.pkg.main}"
      options:
        callback: (err, stdout, stderr, cb) ->
          grunt.log.write 'Metal ' + '_\\,,/'['white'] + ' building...'
          if not err
            grunt.log.ok()
          cb()
