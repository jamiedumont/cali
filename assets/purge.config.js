module.exports = {
  css: [
    '../priv/static/css/app.css'
  ],
  content: [
    '../lib/cali_web/templates/**/*.html.eex'
  ],
  extractors: [
    {
    extractor: class {
      static extract(content) {
        return content.match(/[A-z0-9-:\/]+/g) || [];
      }
    },
    extensions: ["html.eex"]
    }
  ]
}
