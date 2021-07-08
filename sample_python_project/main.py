from urllib import parse

endpoint: str = 'https://gitlab.com'
url_obj = parse.urlparse(endpoint)
print(f"scheme: {url_obj.scheme}, netloc: {url_obj.netloc}")
