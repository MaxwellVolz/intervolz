# intervolz
test server deploy for Jenkins stack with github and kubernetes


## Test InterVolz local deploy

```sh
docker run -p 8081:80 --name intervolz-website-container intervolz-website
```



## Steps to Set Up Dynamic DNS with Cloudflare

### 1. Gather Required Information
- **Domain Name** 
- **Cloudflare Account Email** 
- **Cloudflare API Key**

#### Cloudflare API Key

1. Log in to Cloudflare
2. Navigate to the Profile Section
   - Once logged in, click on your profile icon at the top right corner, then select "My Profile".
3. Click on the "API Tokens" tab
4. View Global API Key:
    - Find the "Global API Key" row and click on the "View" button. You might need to enter your password to view this key.
5.  Copy the API Key:
Safely copy the API key. You’ll need this for your ddclient configuration and for storing it as an environment variable.


```sh
export CLOUDFLARE_API_KEY="your_key"
```


### 2. Install a DDNS Client
- **Option 1:** Utilize an existing DDNS client that supports Cloudflare, such as `ddclient`.

```sh
sudo apt update
sudo apt install ddclient
```

### 3. Configure the DDNS Client


- For `ddclient`, the configuration might look like this:
  
```bash
vim /etc/ddclient.conf

protocol=cloudflare,
zone=yourdomain.com,
login=your-email@example.com,
password='your-global-api-key', # This is the API key from Cloudflare
use=web, web=ipv6.whatismyip.akamai.com,
record=yourdomain.com,
ttl=1,
ssl=yes

# Run manually
sudo ddclient -verbose -noquiet

```



### 4. Automate updating with cron

crontab -e
```sh
*/15 * * * * ddclient
```
