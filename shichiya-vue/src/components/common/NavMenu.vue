<template>
  <el-menu
    router
    mode="horizontal"
    background-color="white"
    text-color="#222"
    active-text-color="red"
    style="min-width: 1300px"
    :default-active="this.$route.path">
    <el-menu-item v-for="(item,i) in navList" :key="i" :index="item.name">
      {{ item.navItem }}
    </el-menu-item>
    <i class="el-icon-switch-button" v-on:click="logout" style="float:right;font-size: 40px;color: #222;padding: 10px"></i>
    <span style="position: absolute;padding-top: 20px;right: 40%;font-size: 20px;font-weight: bold">Online Library Graduation Project - By ShiChiYa</span>
  </el-menu>
</template>

<script>
export default {
  name: 'NavMenu',
  data () {
    return {
      navList: [
        {name: '/index', navItem: '首页'},
        {name: '/library', navItem: '图书馆'},
        {name: '/admin', navItem: '个人中心'}
      ]
    }
  },
  methods: {
    logout () {
      var _this = this
      this.$axios.get('/logout').then(resp => {
        if (resp.data.code === 200) {
          // 前后端状态保持一致
          _this.$store.commit('logout')
          _this.$router.replace('/login')
          this.$message({
            message: '注销成功！',
            type: 'success'
          })
        }
      })
    }
  }
}
</script>

<style scoped>
  a{
    text-decoration: none;
  }

  span {
    pointer-events: none;
  }

  .el-icon-switch-button {
    cursor: pointer;
    outline:0;
  }
</style>
