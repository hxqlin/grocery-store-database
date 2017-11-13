<template>
  <section class="product-view">
    <div class="content">
      <div class="subsection">
        <span class="product-productid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{ product.productid }}</span>
        <span class="product-productname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${product.productname}` }}</span><br><br>
    <form style="margin: 15px 15px;">
            <div style="margin: 10px 0;">
              <span class="product-quantityinstock">Quantity in Stock: </span>
              <input type="text" :value="product.quantityinstock" v-model="product.quantityinstock"></input>
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
    return axios.get('/api/products/' + params.productid)
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
      axios.post('/api/products/updatequantity', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            productid: self.product.productid,
            quantityinstock: self.product.quantityinstock
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
  .product-quantityinstock
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
