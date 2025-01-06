provider "aws" {
    region = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

resource "aws_security_group" "web-server" {
    name = "web-server"
    description = "Allow incoming HTTP Connections"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "web-server" {
    ami = "ami-0ca9fb66e076a6e32"
    instance_type = "t2.micro"
    key_name = "tflab-key"
    security_groups = ["${aws_security_group.web-server.name}"]
    user_data = <<-EOF
#!/bin/bash
sudo su
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<html><h1> Welcome. Happy Learning Terraform </h1></html>" >> /var/www/html/index.html
EOF
    tags = {
        Name = "web_instance"
    }
}