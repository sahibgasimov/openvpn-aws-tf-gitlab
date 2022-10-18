# Reference to the Route 53 Main Public Zone
data "aws_route53_zone" "hostedzone" {
  name         = var.domain
  provider     = aws.main
  private_zone = false
}
# Create Route 53 A Record for the Load Balancer in the Main Zone
resource "aws_route53_record" "www" {
  provider = aws.main
  zone_id  = data.aws_route53_zone.hostedzone.id
  name     = "${var.subdomain}.${data.aws_route53_zone.hostedzone.name}"
  type     = "A"
  records  = ["${aws_eip.myeip.public_ip}"]
  ttl      = "300"
}

# Route53 HealthCheck 
/* 
resource "aws_route53_health_check" "openvpn" {
  failure_threshold = "5"
  fqdn              = "vpn.sahibgasimov.link"
  port              = 443
  request_interval  = "30"
  resource_path     = "/"
  search_string     = "admin"
  type              = "HTTPS_STR_MATCH"

  tags = {
    Name = "https://vpn.sahibgasimov.link/admin"
    Name = "openvpn"
  }
} */
