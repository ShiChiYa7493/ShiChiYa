<template>
  <div>
    <el-row>
      <el-card class="box-card" v-for="item in admin" v-bind:key="item.id">
        <div class="text item">
          {{item.id}}
        </div>
      </el-card>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'AppAdmin',
  data () {
    return {
      admin: []
    }
  },
  mounted: function () {
    this.loadAadmin()
  },
  methods: {
    loadAadmin () {
      var _this = this
      this.$axios.get('/admin').then(resp => {
        if (resp && resp.status === 200) {
          _this.admin = resp.data
        }
      })
    }
  }
}
</script>

<style scoped>
  .text {
    font-size: 14px;
  }

  .item {
    padding: 18px 0;
  }

  .box-card {
    width: 480px;
  }
</style>
