
resource "aws_instance" "cribl_instance" {
  ami           = "ami-0123456789abcdef0"  # Replace with the desired AMI ID
  instance_type = "t2.micro"  # Replace with the desired instance type

  tags = {
    Name = "cribl-instance"
  }

  provisioner "remote-exec" {
    inline = [
      "wget -qO- 'https://download.cribl.io/latest/cribl.zip' | sudo -u ec2-user -s bash -c 'unzip -qq - && ./cribl install -s -'",
      "sudo systemctl start cribl"
    ]
  }
}
