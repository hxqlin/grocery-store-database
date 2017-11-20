<template>
  <section class="product-view">
  <div class="content">
    <div class="subsection">
    <form style="margin: 15px 15px;">
      

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
      <div style="margin: 10px 0;">
        <span class="product-costunit">Brand: </span>
        <input type="text" :value="brand" v-model="brand"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-costunit">Quantity in Stock: </span>
        <input type="text" :value="quantityinstock" v-model="quantityinstock"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-costunit">Production Date: </span>
        <input type="text" :value="productiondate" v-model="productiondate"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-costunit">Best Before Date: </span>
        <input type="text" :value="bestbeforedate" v-model="bestbeforedate"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-costunit">PLU: </span>
        <input type="text" :value="PLU" v-model="PLU"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-costunit">UPC: </span>
        <input type="text" :value="UPC" v-model="UPC"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-costunit">Organic: </span>
        <input type="text" :value="organic" v-model="organic"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-costunit">Cut: </span>
        <input type="text" :value="cut" v-model="cut"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="product-costunit">Animal: </span>
        <input type="text" :value="animal" v-model="animal"></input>
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
      costunit: '',
      brand: null,
      quantityinstock: null,
      productiondate: null,
      bestbeforedate: null,
      PLU: null,
      UPC: null,
      organic: null,
      cut: null,
      animal: null
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
            costunit: self.costunit,
            brand: self.brand,
            quantityinstock: self.quantityinstock,
            productiondate: self.productiondate,
            bestbeforedate: self.bestbeforedate,
            PLU: self.PLU,
            UPC: self.UPC,
            organic: self.organic,
            cut: self.cut,
            animal: self.animal
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
