resource "aws_lightsail_instance" "server1" {
  name = "dev-server"
  blueprint_id = "ubuntu-18"
  bundle_id = "medium_1_0"
  availability_zone = "us-east-1a"
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo '<h1>This is deployed by Yannick </h1>' | sudo tee /var/www/html/index.html
              EOF
}