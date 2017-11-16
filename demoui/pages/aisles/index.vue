<template>
  <section class="aisles-view">
    <div class="content">
      <div class="subsection">
        <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">Aisles</span>
          <nuxt-link class="button--grey" style="padding: 5px 20px; text-decoration: none;" to="/aisles/add">Add Aisle</nuxt-link>
        </div>
        <ul style="list-style-type: none; padding: 0; margin: 0;">
          <li v-for="(aisle, index) in aisles" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
            <nuxt-link :to="{ path: `/aisles/${aisle.aislenumber}`, params: { aislenumber: aisle.aislenumber }}">
              {{ aisle.aislenumber + ' ' + aisle.aislename }}
            </nuxt-link>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  async asyncData () {
    let { data } = await axios.get('/api/aisles')
    return { aisles: data }
  },

  head () {
    return {
      title: 'Aisle'
    }
  }
}
</script>

<style lang="stylus" scoped>
.aisles-view
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
    font-size 26px
    font-weight 500
  .title
    font-size 18px
    font-weight 500
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>