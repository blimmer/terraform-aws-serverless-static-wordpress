variable "site_domain" {
  type        = string
  description = "The site domain name to configure (without any subdomains such as 'www')"
}

variable "site_prefix" {
  type        = string
  description = "The subdomain prefix of the website domain. E.g. www"
  default     = "www"
}

variable "cloudfront_ssl" {
  type        = string
  description = "The ARN of the ACM certificate used for the CloudFront domain."
}

variable "site_name" {
  type        = string
  description = "The unique name for this instance of the module. Required to deploy multiple wordpress instances to the same AWS account (if desired)."
}

variable "cloudfront_aliases" {
  type        = list(any)
  description = "The domain and sub-domain aliases to use for the cloudfront distribution."
  default     = []
}

variable "cloudfront_class" {
  type        = string
  description = "The [price class](https://aws.amazon.com/cloudfront/pricing/) for the distribution. One of: PriceClass_All, PriceClass_200, PriceClass_100"
  default     = "PriceClass_All"
}

variable "waf_acl_arn" {
  type        = string
  default     = null
  description = "The ARN of the WAF ACL applied to the CloudFront distribution."
}

variable "cloudfront_function_override" {
  type        = string
  default     = null
  description = "An override for the redirect CloudFront function"
}

variable "cloudfront_function_301_redirects" {
  type = map(any)
  default = {
    "^(.*)index\\.php$" : "$1"
  }
  description = "A list of key value pairs of Regex match and destination for 301 redirects at CloudFront."
}
