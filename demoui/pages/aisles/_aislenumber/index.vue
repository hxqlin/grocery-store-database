<template>
  <section class="user-view">
    <div class="content">
      <div class="subsection">
        <span class="aisle-aislenumber" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Aisle #${products[0].aislenumber}` }}</span>
        <span class="aisle-aislename" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${products[0].aislename}` }}</span><br><br>
          <nuxt-link :to="{ path: `/aisles/${products[0].aislenumber}/addproduct`, params: { aislenumber: products[0].aislenumber }}">
              {{ 'Add Product to Aisle'}}
            </nuxt-link><br><br>
        <span class="aisle-heading" style="padding: 10px 10px; margin: 10px 0 10px 0;">Products In Aisle:</span><br>
            <ul style="list-style-type: none; padding: 0; margin: 0;">
        <li v-for="(product, index) in products.slice(1, products.length)" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
          <nuxt-link :to="{ path: `/products/${product.productid}`, params: { productid: product.productid }}">
          {{product.productid + ' - ' + product.productname + ' (' +  product.quantityinstock + ' in stock)'}}
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
  aislenumber: 'aislenumber',
  asyncData ({ params, error }) {
    return axios.get('/api/aisles/' + params.aislenumber)
      .then((res) => {
        return { products: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Aisle not found' })
      })
  },
  head () {
    return {
      title: `Aisle ${this.products[0].aislenumber}`
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
  .aisle-aislenumber
    font-size 28px
    font-weight 500
  .aisle-aislename
    font-size 28px
    font-weight 500
  .aisle-heading
    font-size 20px
    font-weight 500
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
