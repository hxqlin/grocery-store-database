<template>
  <section class="suppliers-view">
    <div class="content">
      <div class="subsection">
        <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">Suppliers</span>
          <nuxt-link class="button--grey" style="padding: 5px 20px; text-decoration: none;" to="/suppliers/add">Add Supplier</nuxt-link>
        </div>
        <ul style="list-style-type: none; padding: 0; margin: 0;">
          <li v-for="(supplier, index) in suppliers" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
            <nuxt-link :to="{ path: `/suppliers/${supplier.supplierid}`, params: { supplierid: supplier.supplierid }}">
              {{ supplier.supplierid + ' ' + supplier.suppliername }}
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
        let { data } = await axios.get('/api/suppliers')
        return { suppliers: data }
      },
      head () {
        return {
          title: 'Supplier'
        }
      }
    }
</script>

<style lang="stylus" scoped>
  .suppliers-view
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