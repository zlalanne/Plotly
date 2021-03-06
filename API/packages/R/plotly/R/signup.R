signup <-
function(username,email){
	platform = 'R'
	version = '0.3'
	url = 'https://plot.ly/apimkacct'
	options(RCurlOptions = list(sslversion=3, cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
	respst = postForm( url,
					platform=platform,
					version=version,
					email=email,
					un=username)
	resp=fromJSON(respst, simplify=FALSE)	
	if(!is.null(resp$filename)) pub$filename = resp$filename
	if(!is.null(resp$error)) print(resp$err)
	if(!is.null(resp$warning)) print(resp$warning)
	if(!is.null(resp$message)) print(resp$message)
	return(resp)
}
