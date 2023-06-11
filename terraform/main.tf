provider "heroku" {}

resource "heroku_app" "rails_recipes" {
  name   = "stadach-rails-recipes"
  region = "eu"
}

resource "heroku_addon" "postgres" {
  app_id  = heroku_app.rails_recipes.id
  plan = "heroku-postgresql:mini"
}

resource "heroku_build" "rails_recipes" {
  app_id = heroku_app.rails_recipes.id

  source {
    path = "../src"
  }
}

variable "app_quantity" {
  default     = 1
  description = "Number of dynos in your Heroku formation"
}

# Launch the app's web process by scaling-up
resource "heroku_formation" "rails_recipes" {
  app_id     = heroku_app.rails_recipes.id
  type       = "web"
  quantity   = var.app_quantity
  size       = "Standard-1x"
  depends_on = [heroku_build.rails_recipes]
}
