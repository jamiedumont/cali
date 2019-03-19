const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const PurgecssPlugin = require('purgecss-webpack-plugin');

class TailwindExtractor {
  static extract(content) {
    return content.match(/[A-Za-z0-9-_:\/]+/g) || [];
  }
}

module.exports = (env, options) => ({
  optimization: {
    minimizer: [
      new UglifyJsPlugin({cache: true, parallel: true, sourceMap: false}),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  entry: {
    './js/app.js': ['./js/app.js'].concat(glob.sync('./vendor/**/*.js'))
  },
  output: {
    filename: 'app.js',
    path: path.resolve(__dirname, '../priv/static/js')
  },
  resolve: {
    alias: {
    }
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      }, {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader']
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({filename: '../css/app.css'}),
    new CopyWebpackPlugin([
      {
        from: 'static/',
        to: '../'
      }
    ]),
    new PurgecssPlugin({
      paths: glob.sync('../lib/hwpo_web/templates/**/*.html.*'),
      extractors: [
        {
          extractor: TailwindExtractor,
          extensions: ["eex"]
        }
      ]
    })
  ]
});