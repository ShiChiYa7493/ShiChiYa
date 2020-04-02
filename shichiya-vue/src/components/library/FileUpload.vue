<template>
  <el-upload
    class="file-upload"
    ref="upload"
    action="http://localhost:8443/api/file"
    :before-remove="beforeRemove"
    :on-success="handleSuccess"
    :before-upload="beforeUpload"
    :on-exceed="handleExceed"
    :limit="1"
    :file-list="fileList"
    accept="'.txt'"
    list-type="text"
    multiple
    >
    <el-button size="small" type="primary">点击上传</el-button>
    <div slot="tip" class="el-upload__tip">只能上传txt文件</div>
  </el-upload>
</template>

<script>
export default {
  name: 'FileUpload',
  data () {
    return {
      fileList: [],
      url: ''
    }
  },
  methods: {
    handleExceed (files, fileList) {
      this.$message.warning(`当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`)
    },
    beforeRemove (file) {
      return this.$confirm(`确定移除 ${file.name}？`)
    },
    handleSuccess (response) {
      this.url = response
      this.$emit('onUpload')
      this.$message.warning('上传成功')
    },
    beforeUpload (file) {
      console.log(file)
      var testmsg = file.name.substring(file.name.lastIndexOf('.') + 1)
      const extension = testmsg === 'txt'
      // const isLt2M = file.size / 1024 / 1024 < 10
      if (!extension) {
        this.$message({
          message: '上传文件只能是txt格式!',
          type: 'warning'
        })
      }
      // if(!isLt2M) {
      //     this.$message({
      //         message: '上传文件大小不能超过 10MB!',
      //         type: 'warning'
      //     });
      // }
      // return (extension || extension2) && isLt2M
      return extension
    },
    clear () {
      this.$refs.upload.clearFiles()
    }
  }
}
</script>
