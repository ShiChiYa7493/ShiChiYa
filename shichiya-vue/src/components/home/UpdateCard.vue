<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span style="font-weight: bold;font-size: 20px">最近更新</span>
      <!--<el-button style="float: right; padding: 3px 0" type="text">修改</el-button>-->
    </div>
    <div class="block">
      <el-timeline>
        <el-timeline-item timestamp="2020-04-01" placement="top">
          <el-card>
            <h4>开始编写论文</h4>
            <p>ShiChiYa 提交于 2020-04-01 </p>
          </el-card>
        </el-timeline-item>
        <el-timeline-item timestamp="2020-03-25" placement="top">
          <el-card>
            <h4>美化页面并修补漏洞</h4>
            <p>ShiChiYa 提交于 2020-03-25 </p>
          </el-card>
        </el-timeline-item>
        <el-timeline-item timestamp="2020-03-16" placement="top">
          <el-card>
            <h4>提交中期检查</h4>
            <p>ShiChiYa 提交于 2020-03-16 </p>
          </el-card>
        </el-timeline-item>
        <el-timeline-item timestamp="2020-03-15" placement="top">
          <el-card>
            <h4>实现图书管基础功能</h4>
            <p>ShiChiYa 提交于 2020-03-15 </p>
          </el-card>
        </el-timeline-item>
        <el-timeline-item timestamp="2020-03-01" placement="top">
          <el-card>
            <h4>创建基础数据库并与后端连接</h4>
            <p>ShiChiYa 提交于 2020-03-01 </p>
          </el-card>
        </el-timeline-item>
        <el-timeline-item timestamp="2020-02-26" placement="top">
          <el-card>
            <h4>项目的建立与前后端的连通</h4>
            <p>ShiChiYa 提交于 2020-02-26 </p>
          </el-card>
        </el-timeline-item>
        <el-timeline-item timestamp="2020-02-24" placement="top">
          <el-card>
            <h4>提交开题报告</h4>
            <p>ShiChiYa 提交于 2020-02-24 </p>
          </el-card>
        </el-timeline-item>
      </el-timeline>
    </div>
  </el-card>
</template>

<script>
export default {
  name: 'UpdateCard'
}
</script>

<style scoped>
  .box-card {
    margin-top: 5px;
    width: 988px;
    height: 1320px;
    text-align: left;
  }
</style>
