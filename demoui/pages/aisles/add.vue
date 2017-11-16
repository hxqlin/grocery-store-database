<template>
  <section class="aisle-view">
  <div class="content">
    <div class="subsection">
    <form style="margin: 15px 15px;">
      <div style="margin: 10px 0;">
        <span class="aisle-aislenumber">Aisle Number: </span>
        <input type="text" :value="aislenumber" v-model="aislenumber"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="aisle-aislename">Aisle Name: </span>
        <input type="text" :value="aislename" v-model="aislename"></input>
      </div>
    </form>
    <button type="button" class="button--grey" @click="submitInsert">Add Aisle</button>
    </div>
  </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {

  data () {
    return {
      aislenumber: '',
      aislename: ''
    }
  },

  methods: {
    submitInsert () {
      let self = this

      axios.post('/api/aisles/add', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            aislenumber: self.aislenumber,
            aislename: self.aislename
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
      title: `Add New Aisle`
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
.aisle-aislename
  font-size 24px
  font-weight 500
  color #707070
  a
    text-decoration underline
  &:hover
    color #515ec4

</style>
