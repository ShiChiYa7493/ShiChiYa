<template>
  <div>
    <el-button class="el-icon-circle-plus-outline"  @click="dialogFormVisible = true"></el-button>
    <el-dialog
      title="添加/修改图书"
      :visible.sync="dialogFormVisible"
      @close="clear"
      width="35%" center>
      <el-form v-model="form" style="text-align: left" ref="form">
        <el-form-item label="书名" :label-width="formLabelWidth" prop="title">
          <el-input v-model="form.title" style="width: 85%" autocomplete="off" placeholder="不加《》"></el-input>
        </el-form-item>
        <el-form-item label="作者" :label-width="formLabelWidth" prop="author">
          <el-input v-model="form.author" style="width: 85%" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="出版日期" :label-width="formLabelWidth" prop="date">
          <el-input v-model="form.date" style="width: 85%"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="出版社" :label-width="formLabelWidth" prop="press">
          <el-input v-model="form.press" style="width: 85%" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="封面" :label-width="formLabelWidth" prop="cover">
          <img-upload @onUpload="uploadImg" style="width: 85%" ref="imgUpload"></img-upload>
        </el-form-item>
        <el-form-item label="文件" :label-width="formLabelWidth" prop="file">
          <file-upload @onUpload="uploadFile" style="width: 85%" ref="fileUpload"></file-upload>
        </el-form-item>
        <el-form-item label="简介" :label-width="formLabelWidth" prop="abs">
          <el-input type="textarea" v-model="form.abs" style="width: 85%" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="分类" :label-width="formLabelWidth" prop="cid">
          <el-select v-model="form.category.id" style="width: 25%" placeholder="请选择分类">
            <el-option label="文学" value="1"></el-option>
            <el-option label="流行" value="2"></el-option>
            <el-option label="文化" value="3"></el-option>
            <el-option label="生活" value="4"></el-option>
            <el-option label="经管" value="5"></el-option>
            <el-option label="科技" value="6"></el-option>
            <el-option label="其他" value="7"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="id" style="height: 0">
          <el-input type="hidden" v-model="form.id" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="onSubmit('form')">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import ImgUpload from '@/components/library/ImgUpload'
import FileUpload from '@/components/library/FileUpload'

export default {
  name: 'EditForm',
  components: {ImgUpload, FileUpload},
  data () {
    return {
      formLabelWidth: '15%',
      dialogFormVisible: false,
      form: {
        id: '',
        title: '',
        author: '',
        date: '',
        press: '',
        cover: '',
        file: '',
        abs: '',
        category: {
          id: '1',
          name: ''
        }
      }
    }
  },
  methods: {
    clear () {
      this.form = {
        id: '',
        title: '',
        author: '',
        date: '',
        press: '',
        cover: '',
        file: '',
        abs: '',
        category: {}
      }
    },
    onSubmit () {
      this.$axios
        .post('/books', {
          id: this.form.id,
          cover: this.form.cover,
          file: this.form.file,
          title: this.form.title,
          author: this.form.author,
          date: this.form.date,
          press: this.form.press,
          abs: this.form.abs,
          category: this.form.category
        }).then(resp => {
          if (resp && resp.status === 200) {
            this.dialogFormVisible = false
            this.$emit('onSubmit')
          } else if (resp && resp.status === 500) {
            this.$alert('新增失败', '提示', {
              confirmButtonText: '确定'
            })
          }
        })
        .catch(failResponse => {
        })
    },
    uploadImg () {
      this.form.cover = this.$refs.imgUpload.url
    },
    uploadFile () {
      this.form.file = this.$refs.fileUpload.url
    }
  }
}
</script>

<style scoped>
  .el-icon-circle-plus-outline {
    margin: 0px;
    font-size: 10px;
    float: left;
    cursor: pointer;
  }
</style>
