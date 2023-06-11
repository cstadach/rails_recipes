output "app_url" {
  value       = heroku_app.rails_recipes.web_url
  description = "Rails Recipes"
}
