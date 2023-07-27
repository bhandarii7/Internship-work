terraform {
  
}
resource "github_repository" "example" {
  name        = "terraform"
  description = "repo made using terraform"

  visibility = "public"

}


output "url" {
  value = github_repository.example.html_url
}