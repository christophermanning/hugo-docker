const themeDir = __dirname + '/../../';

module.exports = {
  content: [
    `content/**/*.html`,
    `${themeDir}/**/*.html`,
  ],
  theme: {
    fontFamily: {
      sans: ['sans-serif'],
    },
  },
  plugins: [
  ]
}
