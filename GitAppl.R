library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# authenticate app using key and secret
myapp <- oauth_app("github",
                   key = "9cfba4c3f7a578de81ca",
                   secret = "62c434fe2ef946cbb662f56477a3ba167b41343e")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API to extract content from mentioned repo
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
r1 <- content(req)
for (i in 1:30){
    if (r1[[i]]$name == "repos"){
        return(r1[[i]]$created_at)
    }
}