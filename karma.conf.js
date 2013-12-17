module.exports = function(config) {
  config.set({
    basePath: '.',
    frameworks: ['dart-unittest'],
    files: [
      'test/*.dart',
      {pattern: '**/*.dart', watched: true, included: false, served: true},
      'packages/browser/dart.js',
      'packages/browser/interop.js'
    ],
    autoWatch: true,
    captureTimeout: 5000,
    plugins: ['karma-dart']
  });
};