import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['categories', 'authors']

  connect() {
    let queryParams = new URLSearchParams(document.location.search); 
    
    if (Boolean(queryParams)) {
      let categories = queryParams.getAll("categories[]");

      if (categories.length > 0) {
        categories.forEach(category => {
          const el = document.getElementById(`categories_${category.toLowerCase()}`);
          el.checked = true;
        });
      }

      let authors = queryParams.getAll("authors[]");
      if (authors.length > 0) {
        authors.forEach(author => {
          const converted = author.toLowerCase().split(" ").join("_");
          const el = document.getElementById(`authors_${converted}`);
          el.checked = true;
        });
      }
    }
  }
}
