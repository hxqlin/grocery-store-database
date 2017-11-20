<template>
  <section class="aisle-view">
  <div class="content">
    <div class="subsection">
        <span class="aisle-aislenumber" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Aisle #${this.$route.params.aislenumber}` }}</span>
    <form style="margin: 15px 15px;">
      
      <div style="margin: 10px 0;">
        <span class="aisle-aislenumber">Product ID: </span>
        <input type="productid" v-model="aisle.productid"></input>
      </div>
    </form>
    <button type="button" class="button--grey" @click="submitInsert">Add Product to Aisle</button>
    </div>
  </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  asyncData ({ params, error }) {
    return axios.get('/api/aisles/' + params.aislenumber)
      .then((res) => {
        return { aisle: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Aisle not found' })
      })
  },

  data () {
    return {}
  },

  mounted () {
    console.log(this.$route)
  },

  methods: {
    submitInsert () {
      let self = this
      console.log(self.aisle)
      axios.post('/api/aisles/addproduct', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            aislenumber: this.$route.params.aislenumber,
            productid: self.aisle.productid
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
      title: `Add Product to Aisle ${this.aisle.aislenumber}`
    }
  }
}
</script>

<style lang="stylus" scoped>
.aisle-view
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
    font-size 24px
    font-weight 500
    color #707070
  a
    text-decoration underline
  &:hover
    color #515ec4

</style>
