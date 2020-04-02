<template>
  <div>
    <el-row style="height: 910px;">
      <div>
      <search-bar @onSearch="searchResult" ref="searchBar"></search-bar>
      <edit-form @onSubmit="loadBooks()" ref="edit" class="edit_books"></edit-form>
      </div>
      <el-tooltip effect="dark" placement="right"
                  v-for="item in books.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                  :key="item.id">
        <p slot="content" style="font-size: 14px;margin-bottom: 6px;">{{item.title}}</p>
        <p slot="content" style="font-size: 13px;margin-bottom: 6px">
          <span>{{item.author}}</span> /
          <span>{{item.date}}</span> /
          <span>{{item.press}}</span>
        </p>
        <p slot="content" style="width: 300px" class="abstract">{{item.abs}}</p>
        <el-card style="width: 155px;margin-bottom: 20px;height: 260px;float: left;margin-right: 15px" class="book"
                 bodyStyle="padding:10px" shadow="hover">
          <div class="cover">
            <img :src="item.cover" @click="openBook" alt="封面">
          </div>
          <div class="info">
            <div class="title">
              <i class="el-icon-edit" @click="editBook(item)"></i>
              <p class="title_text">{{item.title}}</p>
            </div>
            <i class="el-icon-delete" @click="deleteBook(item.id)"></i>
  </div>
  <p class="author">{{item.author}}</p>
        </el-card>
      </el-tooltip>

    </el-row>
    <el-row>
      <el-pagination
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-size="pagesize"
        :total="books.length">
      </el-pagination>
    </el-row>
  </div>
</template>

<script>
import EditForm from './EditForm'
import SearchBar from './SearchBar'
import Preview from './PreviewForm'
export default {
  name: 'Books',
  components: {EditForm, SearchBar, Preview},
  data () {
    return {
      books: [],
      currentPage: 1,
      pagesize: 15
    }
  },
  mounted: function () {
    this.loadBooks()
  },
  methods: {
    loadBooks () {
      var _this = this
      this.$axios.get('/books').then(resp => {
        if (resp && resp.status === 200) {
          _this.books = resp.data
        }
      })
    },
    handleCurrentChange: function (currentPage) {
      this.currentPage = currentPage
      console.log(this.currentPage)
    },
    searchResult () {
      var _this = this
      this.$axios
        .get('/search?keywords=' + this.$refs.searchBar.keywords, {
        }).then(resp => {
          if (resp && resp.status === 200) {
            _this.books = resp.data
          }
        })
    },
    deleteBook (id) {
      this.$confirm('此操作将永久删除该书籍, 是否继续?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios
          .post('/delete', {id: id}).then(resp => {
            if (resp && resp.status === 200) {
              this.loadBooks()
            }
          })
      }
      ).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
      // alert(id)
    },
    editBook (item) {
      this.$refs.edit.dialogFormVisible = true
      this.$refs.edit.form = {
        id: item.id,
        cover: item.cover,
        file: item.file,
        title: item.title,
        author: item.author,
        date: item.date,
        press: item.press,
        abs: item.abs,
        category: {
          id: item.category.id.toString(),
          name: item.category.name
        }
      }
    },
    openBook () {

    }
  }
}
</script>
<style scoped>

  .cover {
    width: 135px;
    height: 192px;
    margin-bottom: 7px;
    overflow: hidden;
    cursor: pointer;
  }

  img {
    width: 135px;
    height: 192px;
    /*margin: 0 auto;*/
  }

  .title {
    font-size: 16px;
    text-align: left;
    color: #3377aa;
    margin: 2px 0px 2px 0px;
  }

  .title_text{
    width: 115px;
    margin: 0px;
    text-align: left;
    white-space:nowrap;
    text-overflow:ellipsis;
    overflow: hidden;
  }

  .author {
    color: #333;
    width: 115px;
    font-size: 15px;
    margin: 0px;
    text-align: left;
    white-space:nowrap;
    text-overflow:ellipsis;
    overflow: hidden;
  }

  .abstract {
    display: block;
    line-height: 17px;
  }

  .el-icon-edit {
    cursor: pointer;
    float: right;
  }

  .el-icon-delete {
    cursor: pointer;
    float: right;
  }

  .edit_books{
    float: right;
  }
  a {
    text-decoration: none;
  }

  a:link, a:visited, a:focus {
    color: #3377aa;
  }

</style>
