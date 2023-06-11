terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.2.2"
    }
  }

  required_version = ">= 1.0"
}
