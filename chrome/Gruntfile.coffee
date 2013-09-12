module.exports = (grunt) ->
  grunt.initConfig
    clean:
      app: 'build/'

    copy: 
      main: 
        expand: true
        cwd:    'src/'
        dest:   'build/'
        src: [
          'lib/*'
          '**.json'
          '**.png'
        ] 
    
    watch:
      files: ['src/**/*']
      tasks: ['build']
    
    coffee:
      compile: 
        files: 
          'build/scripts/content.js': ['src/scripts/content.coffee']
          'build/scripts/background.js': ['src/scripts/background.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'build', [
    'clean'
    'coffee'
    'copy'    
  ]

  grunt.registerTask 'default', 'build'