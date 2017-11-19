<template>
  <div class="header">
    <div class="inner">
      <router-link class="home-link" to="/" exact>
        <img class="logo" src="~/assets/img/happy.png" alt="logo">
      </router-link>
      <a class="github" href="https://github.com/hxqlin/grocery-store-database" target="_blank" rel="noopener">
        Github
      </a>
      <nav class="navbar__menu pn-ProductNav">
        <nuxt-link to="/products">Products</nuxt-link>
        <nuxt-link to="/aisles">Aisles</nuxt-link>
        <nuxt-link to="/employees">Employees</nuxt-link>
        <nuxt-link to="/customers">Customers</nuxt-link>
        <nuxt-link to="/departments">Departments</nuxt-link>
        <nuxt-link to="/suppliers">Suppliers</nuxt-link>
      </nav>
    </div>
  </div>
</template>

<script>
export default {}
</script>

<style lang="stylus" scoped>
.header
  background-color #111111
  position fixed
  z-index 999
  height 55px
  top 0
  left 0
  right 0
  .inner
    max-width 800px
    box-sizing border-box
    margin 0px auto
    padding 15px 5px
    position relative
    a
      color rgba(255, 255, 255, .8)
      line-height 24px
      transition color .15s ease
      display inline-block
      vertical-align middle
      font-weight 300
      letter-spacing .075em
      margin-right 1.8em
      &:hover
        color #fff
      &.router-link-active
        color #fff
        font-weight 400
      &:nth-child(11)
        margin-right 0
    .home-link
      position absolute
    .github
      position absolute
      margin-right 0
      right 0
      font-size .9em
    .pn-ProductNav
      margin 0 100px 0 50px
      overflow-x auto
      overflow-y hidden
      -ms-overflow-style
      -ms-autohiding-scrollbar
      -webkit-overflow-scrolling
        touch
      white-space: nowrap
      &::-webkit-scrollbar
        display none

.logo
  width 24px
  margin-right 10px
  display inline-block
  vertical-align middle

@media (max-width 860px)
  .header .inner
    padding 15px 30px

@media (max-width 600px)
  .header
    .inner
      padding 15px
      a
        margin-right 1em

</style>
