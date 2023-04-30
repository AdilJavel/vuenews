<template>
  <div class="container">
    <h1>News</h1>
    <div v-if="loading">Loading...</div>
    <div v-else class="row">
      <div class="col-sm-4" v-for="article in articles" :key="article.id">
        <div class="card mb-4">
          <img class="card-img-top" :src="article.image" alt="Card image cap" />
          <div class="card-body">
            <h5 class="card-title">{{ article.title }}</h5>
            <p class="card-text">{{ article.summary }}</p>
            <router-link
              :to="{ name: 'Article', params: { id: article.id } }"
              class="btn btn-primary"
              >Read More</router-link
            >
          </div>
          <div class="card-footer">
            <small class="text-muted">Views: {{ article.views }}</small>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      articles: [],
      loading: false
    }
  },
  mounted() {
    this.loading = true
    fetch('http://localhost:8000/api/articles')
      .then((response) => {
        return response.json()
      })
      .then((data) => {
        this.articles = data
      })
      .catch((error) => {
        console.log(error)
      })
      .finally(() => {
        this.loading = false // set loading state to false after fetch
      })
  }
}
</script>
