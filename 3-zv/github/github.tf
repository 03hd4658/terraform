terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.9.3"
    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "example" {
  name        = "terraform-repo"
  visibility = "public"
}
