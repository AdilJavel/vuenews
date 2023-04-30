<template>
  <div class="container mt-4">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <form>
          <div class="form-group">
            <label for="articleTitle">Title</label>
            <input
              type="text"
              class="form-control"
              id="articleTitle"
              v-model="title"
              required
            />
          </div>
          <div class="form-group">
            <label for="articleImage">Image Link</label>
            <input
              type="url"
              class="form-control"
              id="articleImage"
              v-model="image"
              required
            />
          </div>
          <div class="form-group">
            <label for="articleContent">Content</label>
            <textarea
              class="form-control"
              id="articleContent"
              rows="10"
              v-model="content"
              required
            ></textarea>
          </div>
          <div class="form-group">
            <label for="articleAuthor">Author</label>
            <input
              type="text"
              class="form-control"
              id="articleAuthor"
              v-model="author"
              required
            />
          </div>
          <button type="submit" class="btn btn-primary" @click="createArticle">
            Submit
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      title: '',
      image: '',
      content: '',
      author: ''
    }
  },
  methods: {
    createArticle() {
      if (!this.title || !this.image || !this.content || !this.author) {
        alert('Please fill in all fields to create a new article.')
        return
      }

      fetch(`http://localhost:8000/api/article/create`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          title: this.title,
          image: this.image,
          content: this.content,
          author: this.author
        })
      })
        .then((response) => response.json())
        .then((data) => {
          alert(data.success) 
        })
        .catch((error) => {
          console.error(error)
        })
    }
  }
}
</script>
