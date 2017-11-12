<template>
  <section class="product-view">
    <div class="content">
      <div class="subsection">
        <span class="product-productid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{ product.productid }}</span>
        <form style="margin: 15px 15px;">
            <div style="margin: 10px 0;">
              <span class="product-pricepercostunit">Price Per Cost Unit: </span>
              <input type="text" :value="product.pricepercostunit" v-model="product.pricepercostunit"></input>
            </div>
            <div style="margin: 10px 0;">
              <span class="product-costunit">Cost Unit: </span>
              <input type="costunit" v-model="product.costunit"></input>
            </div>
        </form>
        <button type="button" class="button--grey" @click="submitUpdate">Update</button>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  asyncData ({ params, error }) {
    return axios.get('/api/product/' + params.productid)
      .then((res) => {
        return { product: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'product not found' })
      })
  },

  data () {
    return {}
  },

  methods: {
    submitUpdate () {
      let self = this
      console.log(self.product)
      axios.post('/api/product/updatecost', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            productid: self.product.productid,
            pricepercostunit: self.product.pricepercostunit,
            costunit: self.product.costunit
          }})
        .then((res) => {
          // res.data should contain the url for redirecting... bad practice
          self.$nuxt.$router.replace({ path: res.data })
        })
        .catch((e) => {
          console.log(e)
        })
    }
  },

  head () {
    return {
      title: `Update product: ${this.product.productid}`
    }
  }
}
</script>

<style lang="stylus" scoped>
.product-view
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
  .product-productid
    font-size 24px
    font-weight 500
    color #707070
  .product-pricepercostunit
    font-size 24px
    font-weight 500
    color #707070
  .product-costunit
    font-size 24px
    font-weight 500
    color #707070
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
