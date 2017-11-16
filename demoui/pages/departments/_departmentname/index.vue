<template>
  <section class="user-view">
    <div class="content">
      <div class="subsection">
        <span class="departments-departmentname" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`${departments.departmentname}` }}</span>
        <nuxt-link :to="{ path: `/departments/${departments.departmentname}/updateinfo`, params: { departmentname: departments.departmentname }}">Update Info</nuxt-link><br><br>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  departmentname: 'departmentname',
  asyncData ({ params, error }) {
    return axios.get('/api/departments/' + params.departmentname)
      .then((res) => {
        return { departments: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Department not found' })
      })
  },
  head () {
    return {
      title: `Department ${this.departments.departmentname}`
    }
  }
}
</script>

<style lang="stylus" scoped>
.user-view
  padding-top 0

.content
  position absolute
  width 100%

.subsection
  background-color #fff
  border-radius 2px
  margin 25px 0
  transition all .5s cubic-bezier(.55,0,.1,1)
  padding 10px 30px 10px 30px
  position relative
  line-height 20px
  .subsection-title
    margin 25px 10px
    font-size 26px
    font-weight 500
  .departments-departmentname
    font-size 24px
    font-weight 500

  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
