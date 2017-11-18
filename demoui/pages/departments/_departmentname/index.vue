<template>
  <section class="user-view">
    <div class="content">
      <div class="subsection">
          <span class="departments-departmentname" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`${aisles[0].departmentname}` }}<br><br></span>
          <!-- <nuxt-link class="":to="{ path: `/departments/${aisles[0].departmentname}/updateinfo`, params: { departmentname: aisles[0].departmentname }}">Update Info</nuxt-link><br><br> -->
          <li v-for="(aisle, index) in aisles.slice(1, aisles.length)" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
              <nuxt-link :to="{ path: `/aisles/${aisle.aislenumber}`, params: { aislenumber: aisle.aislenumber }}">
                  {{'Go To Aisle #' + aisle.aislenumber + ' (' + aisle.aislename + ')'}}
              </nuxt-link>
          </li>
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
        return { aisles: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Department is not found' })
      })
  },
  head () {
    return {
      title: `Department- ${this.aisles[0].departmentname}`
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
  .aisles-aislenumber
  font-size 24px
  font-weight 500
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
