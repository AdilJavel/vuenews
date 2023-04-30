const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  configureWebpack: {
    resolve: {
      fallback: {
          "fs": false,
          "path": require.resolve("path-browserify"),
          "dns": false,
          "net": false,
          "tls": false,
          "crypto": require.resolve("crypto-browserify"),
          "stream": require.resolve("stream-browserify")
      }
  }
  
  }
})
