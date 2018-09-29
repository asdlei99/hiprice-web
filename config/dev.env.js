'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  ENDPOINT: '"http://' + process.env.CHATBOT_SERVER + '/web/api"'
})
