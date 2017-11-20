<template>
  <section class="product-view">
    <div class="content">
      <div class="subsection">
        <span class="product-productid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Product ${product.productid}` }}</span>
        <span class="product-productname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${product.productname}` }}</span><br><br>
        <span class="product-productattributes" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Department: ${product.departmentname}` }}</span><br><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Price: $${product.pricepercostunit}/${product.costunit}` }}</span><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Quantity in Stock: ${product.quantityinstock}` }}</span><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Brand: ${product.brand}` }}</span><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Production Date: ${product.productiondate}` }}</span><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Best Before Date: ${product.bestbeforedate}` }}</span><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `PLU: ${product.plu}` }}</span><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `UPC: ${product.upc}` }}</span><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Organic: ${product.organic}` }}</span><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Cut: ${product.cut}` }}</span><br><br>
        <span class="product-productdepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Animal: ${product.animal}` }}</span><br><br><br>
        <nuxt-link :to="{ path: `/products/${product.productid}/updatecost`, params: { productid: product.productid }}">Update Cost</nuxt-link><br><br>
        <nuxt-link :to="{ path: `/products/${product.productid}/updatequantity`, params: { productid: product.productid }}">Update Quantity</nuxt-link>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  productid: 'productid',
  asyncData ({ params, error }) {
    return axios.get('/api/products/' + params.productid)
      .then((res) => {
        return { product: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Product not found' })
      })
  },
  head () {
    return {
      title: `Product ${this.product.productid}`
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
    font-size 28px
    font-weight 500
  .product-productid
    font-size 28px
    font-weight 500
  .product-productname
    font-size 28px
    font-weight 500
    color #707070
  .product-productattributes
    font-size 28px
    font-weight 500
    color #707070
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
