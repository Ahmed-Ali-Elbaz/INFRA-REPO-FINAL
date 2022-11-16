# VM Service Account
resource "google_service_account" "service_account" {
  project      = "wired-sol-367809"
  account_id   = "vm-service-account-id"
  display_name = "Service Account"

}


resource "google_project_iam_binding" "container-admin" {
  project      = "wired-sol-367809"
  role         = "roles/container.admin"

  members = [

    "serviceAccount:${google_service_account.service_account.email}",
  ]
}   


