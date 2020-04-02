<template>
  <body id="paper">
  <el-form class="register-container" label-position="left"  :hide-required-asterisk="asterisk"
           label-width="0px" v-loading="loading" :rules="rules" :model="loginForm" ref="loginForm">
    <h3 class="register_title">用户注册</h3>
    <el-form-item prop="username">
      <el-input type="text" v-model="loginForm.username" prop="username"
                auto-complete="off" placeholder="账号" autocomplete="off" ></el-input>
    </el-form-item>
    <el-form-item prop="password">
      <el-input type="password" v-model="loginForm.password" prop="password"
                auto-complete="off" placeholder="密码" show-password autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item style="width: 100%">
      <el-button type="primary" style="width: 40%;background: #505458;border: none;display: inline-block" v-on:click="Login">返回登录</el-button>
      <el-button type="primary" style="width: 40%;background: #505458;border: none;display: inline-block" v-on:click="Register('loginForm')">注册</el-button>
    </el-form-item>
  </el-form>
  </body>
</template>
<script>
export default{
  data () {
    var validatePass = (rule, value, callback) => {
      if (!value) {
        callback(new Error('用户名不能为空！'))
      }
      callback()
    }
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('密码不能为空！'))
      }
      callback()
    }
    return {
      asterisk: true,
      loginForm: {
        username: '',
        password: ''
      },
      rules: {
        username: [
          { validator: validatePass, trigger: 'blur' }
        ],
        password: [
          { validator: validatePass2, trigger: 'blur' }
        ]
      },
      loading: false
    }
  },
  methods: {
    Register (loginForm) {
      this.$refs[loginForm].validate((valid) => {
        if (valid) {
          var _this = this
          this.$axios
            .post('/register', {
              username: this.loginForm.username,
              password: this.loginForm.password
            })
            .then(resp => {
              if (resp.data.code === 200) {
                this.$alert('注册成功', '提示', {
                  confirmButtonText: '确定'
                })
                _this.$router.replace('/login')
              } else {
                this.$alert(resp.data.message, '提示', {
                  confirmButtonText: '确定'
                })
                return false
              }
            })
            .catch(failResponse => {
            })
        } else {
          this.$alert('注册失败', '提示', {
            confirmButtonText: '确定'
          })
          return false
        }
      })
    },
    Login () {
      this.$router.replace('/login')
    }
  }
}
</script>
<style>
  #paper {
    background:url("../assets/img/bg/login_bg.jpg") no-repeat;
    background-position: center;
    height: 100%;
    width: 100%;
    background-size: cover;
    position: fixed;
  }
  body{
    margin: 0px;
  }
  .register-container {
    border-radius: 15px;
    background-clip: padding-box;
    margin: 90px auto;
    width: 350px;
    padding: 35px 35px 15px 35px;
    background: #fff;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
  }
  .register_title {
    margin: 5px auto 40px auto;
    text-align: center;
    color: #505458;
  }
</style>
