module.exports = function(config) {
  config.set({
    basePath: '.',
    frameworks: ['dart-unittest'],

    files: [
      {pattern: 'test/talk_to_me_test.dart',  included: true},
      {pattern: '**/*.dart', 				          included: false},
      {pattern: '**/*.html', 				          included: false}
    ],

    exclude: [
    ],

    autoWatch: true,
    captureTimeout: 20000,
    browserNoActivityTimeout: 300000,

    plugins: [
      'karma-dart',
      'karma-chrome-launcher'
    ],

    browsers: ['Dartium']
  });
};
