const path = require('path')

// https://github.com/rails/webpacker/issues/986#issuecomment-408062235
module.exports = {
  resolve: {
    alias: {
      '@': path.resolve(__dirname, '..', '..', 'app/javascript/src'),
    }
  }
}
