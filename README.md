# healthcheck

HTTP health check for docker

## Usage
Add the following lines to your Dockerfile  
```Dockerfile
ADD https://gitlab.com/adminfromhell/dockercheck/uploads/7937c14217b8dcd9be44b55c9d0b0833/healtcheck-[os]-[arch] /bin/healthcheck
RUN chmod +x /bin/healthcheck
```
(add before the layer that is going to be changing. The add URL is from the releases page)  
  
<br>

`HEALTHCHECK --interval=5s --timeout=3s --start-period=3s --retries=5 CMD /bin/healthcheck <opts> <url to check>`  
(add to the end of the dockerfile or just before your entrypoint/cmd line)  

## Expected Responses
### JSON 
The target server must respond with either of the following json key/values  
```JSON
{
  "healthy": true
}
--- OR ---
{
  "status": "healthy"
}
```
### TEXT
The target server must respond with the following plain text
```TEXT
healthy
---OR---
true
```

## Options
`--json / -j` read json response from the target  
`--text / -t` read text response from the server  
`--post` make a post request when making the healthcheck  
`--get` make a GET request when making the healthcheck  

## Args
`<target>` the target URL:PORT address  

## Example Command
`/bin/healthcheck --json --post http://my.server.test:3000/api/healthcheck`  