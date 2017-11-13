<template>
  <section class="product-view">
  <div class="content">
    <div class="subsection">
    <form style="margin: 15px 15px;">
      <div style="margin: 10px 0;">
        <span class="product-productid">Product ID: </span>
        <input type="text" :value="productid" v-model="productid"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-departmentname">Department Name: </span>
        <input type="departmentname" v-model="departmentname"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-productname">Product Name: </span>
        <input type="text" :value="productname" v-model="productname"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-pricepercostunit">Price Per Cost Unit: </span>
        <input type="text" :value="pricepercostunit" v-model="pricepercostunit"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-costunit">Cost Unit: </span>
        <input type="text" :value="costunit" v-model="costunit"></input>
      </div>
    </form>
    <button type="button" class="button--grey" @click="submitInsert">Add Product</button>
    </div>
  </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {

  data () {
    return {
      productid: '',
      productname: '',
      departmentname: '',
      pricepercostunit: '',
      costunit: ''
    }
  },

  methods: {
    submitInsert () {
      let self = this

      axios.post('/api/products/add', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            productid: self.productid,
            productname: self.productname,
            departmentname: self.departmentname,
            pricepercostunit: self.pricepercostunit,
            costunit: self.costunit
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
      title: `Add New Product`
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
  .product-productname
    font-size 24px
    font-weight 500
    color #707070
  .product-departmentname
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
