<template>
  <el-aside>
      <el-menu
        default-active="1"
        style="width: 170px">
        <a href="#header-div">
          <el-menu-item index="1">
            <i class="el-icon-menu"></i>
            <span slot="title">技术采用</span>
          </el-menu-item>
        </a>
        <a href="#update-card">
          <el-menu-item index="2">
            <i class="el-icon-menu"></i>
            <span slot="title">最近更新</span>
          </el-menu-item>
        </a>
        <a href="#slogan">
          <el-menu-item index="3">
            <i class="el-icon-document"></i>
            <span slot="title">下载源码</span>
          </el-menu-item>
        </a>
      </el-menu>
  </el-aside>
</template>

<script>
export default {

}
</script>

<style>
  a {
    text-decoration: none;
    color: inherit;
  }
</style>
