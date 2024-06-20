/* eslint-env node */
require('@rushstack/eslint-patch/modern-module-resolution')

module.exports = {
  root: true,
  parser: 'babel-eslint',
  parserOptions: {
    sourceType: 'module'
  },
  env: {
    browser: true
  },
  // https://github.com/standard/standard/blob/master/docs/RULES-en.md
  extends: 'standard',
  // required to lint *.vue files
  plugins: ['html', 'vue'],
  // add your custom rules here
  /**
   * 每个规则有【3】个错误级别。
   * off或0: 关闭该规则；
   * warn或1: 开启规则，使用警告级别的错误，不会导致程序退出；
   * error或2: 开启规则，使用错误级别的错误，当被触发的时候，程序会退出。
   */
  rules: {
    // allow paren-less arrow functions
    'arrow-parens': 0,
    // allow async-await
    'generator-star-spacing': 0,
    // allow debugger during development
    'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 0,
    quotes: [0, 'single'],
    // 强制使用骆驼拼写法命名约定
    camelcase: 0,
    // 要求操作符周围有空格
    'space-infix-ops': 0,
    // 要求或禁止使用分号代替 ASI
    semi: 0,
    // 强制函数中的变量要么一起声明要么分开声明
    'one-var': 0,
    // 强制在 function的左括号之前使用一致的空格
    'space-before-function-paren': 0,
    // 强制在逗号前后使用一致的空格
    'comma-spacing': 0,
    // 强制在注释中 // 或 /* 使用一致的空格
    'spaced-comment': 0,
    // 要求或禁止块内填充
    'padded-blocks': 0,
    // 强制在关键字前后使用一致的空格
    'keyword-spacing': 0,
    // 要求或禁止末尾逗号
    'comma-dangle': 1,
    // 要求使用 === 和 !==
    eqeqeq: 1,
    'standard/object-curly-even-spacing': [1, 'either'],
    //不执行的表达式
    'no-unused-expressions': [
      0,
      {
        allowShortCircuit: true,
        allowTernary: true
      }
    ]
  }
}
