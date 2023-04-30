<template>
  <div class="container my-4">
    <div v-if="loading">Loading...</div>
    <div v-else class="row">
      <div class="col-md-8 mx-auto">
        <h1 class="mb-4">{{ article.title }}</h1>
        <p>
          <img
            :src="article.image"
            alt=""
            class="img-fluid mx-auto d-block mb-4"
          />
        </p>
        <p><strong>Author:</strong> {{ article.author }}</p>
        <p>{{ article.content }}</p>
        <p class="text-left">
          <small>{{ article.date }}</small>
        </p>

        <div class="d-flex justify-content-between align-items-center mt-4">
          <div>
            <button class="btn btn-primary" id="likeButton" @click="incrementLikes">
              Like
            </button>
            <span class="ml-2" id="likes">Likes: {{ article.likes }}</span>
          </div>
          <div>
            <span class="ml-2" id="views">Views: {{ article.views }}</span>
          </div>
        </div>

        <hr class="my-4" />

        <form class="mt-4" @submit.prevent="addComment">
          <div class="form-group">
            <label for="commentInput">Add a comment</label>
            <input
              class="form-control"
              id="commentInput"
              v-model="newComment"
              type="text"
            />
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>

        <div class="mt-4">
          <h4 class="mb-3">All Comments:</h4>
          <ul class="list-group">
            <li
              v-for="comment in article.comments"
              :key="comment"
              class="list-group-item"
            >
              {{ comment }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Article',
  data() {
    return {
      article: {},
      newComment: '',
      articleViews: 0,
      loading: true,
    }
  },
  mounted() {
    this.id = this.$route.params.id

    fetch(`http://localhost:8000/api/article/${this.id}`)
      .then((response) => response.json())
      .then((data) => {
        this.article = data
        this.incrementViews()
      })
      .catch((error) => {
        console.error(error)
      })
      .finally(() => {  
        this.loading = false // set loading state to false after fetch
      })
  },
  methods: {
      incrementViews() {
        fetch(`http://localhost:8000/api/article/${this.id}/views`, {
          method: 'PUT',
        })
          .then((response) => response.json())
          .then((data) => {
            const viewsElement = document.getElementById('views');
            viewsElement.textContent = `Views: ${data.views}`;
          })
          .catch((error) => {
            console.error(error)
          })
      },

    addComment() {
      const newComment = this.newComment;
      fetch(`http://localhost:8000/api/article/${this.id}/comments`, {
        method: 'PUT',
        body: JSON.stringify({ comment: newComment }),
        headers: { 'Content-Type': 'application/json' },
      })
      .then(response => response.json())
      .then(result => {
        console.log(typeof result.comments);
        const commentsArray = result.comments.split(",");
        const commentsWithoutBrackets = commentsArray.map(comment => comment.replace(/[{}]/g, ''));
        const reversedComments = commentsWithoutBrackets.reverse();
        this.article.comments = reversedComments;
        this.newComment = '';
      })
      .catch(error => {
        console.error(error);
      });
    },

    incrementLikes() {
      const likesElement = document.getElementById('likes');
      const likeButton = document.getElementById('likeButton');
      likeButton.disabled = true;
      likeButton.classList.add('loading'); 
      fetch(`http://localhost:8000/api/article/${this.id}/likes`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
      })
      .then(response => response.json())
      .then(result => {
        likeButton.disabled = false;
        likeButton.classList.remove('loading');
        likesElement.textContent = `Views: ${result.likes}`;
      })
      .catch(error => {
        console.error(error);
      });
    },
  }
}
</script>
