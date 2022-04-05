resource "aws_security_group" "my_public_app_sg" {
  name        = "my_public_app_sg"
  description = "Allow access to this server"
  vpc_id      = data.aws_vpc.main_vpc.id

  # INBOUND CONNECTIONS

  ingress {
    description = "Allows SSH into the EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["68.160.218.208/32"] # 0.0.0.0/0
  }

  # ingress {
  # description = "Allow HTTP into the EC2"
  # from_port = 80
  # to_port = 80
  # protocol = "tcp"
  # cidr_blocks = ["0.0.0.0/0"] #only for my own IP address

  #OUTBOUND CONNECTIONS
  egress {
    description = "Allows access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#resources for the EC2 instances on the private subnets
resource "aws_security_group" "my_private_app_sg" {
  name        = "my_private_app_sg"
  description = "Allows access to this server only from the public instance private IP "
  vpc_id      = data.aws_vpc.main_vpc.id #attach the private security group from the instances


  # INBONUD CONNECTIONS

  ingress {
    description = "Allows SSH into the EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.0/24"] # ALL INSTANCES IN PUBLIC SUBNET ARE ALLOWED TO CONNECT
  }

  # ingress {
  # description = "Allow HTTP into the EC2"
  # from_port = 80
  # to_port = 80
  # protocol = "tcp"
  # cidr_blocks = ["0.0.0.0/0"] #only for my own IP address


  #OUTBOUND CONNECTIONS

  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }



}
