import requests
from bs4 import BeautifulSoup
import os , sys , re


path = "C:/Users/dattas6/Desktop/twitter";
os.chdir(path)
dirs = os.listdir(path)

soup = BeautifulSoup(open("twitter2.html"),"lxml")

# tweet text
#g_data = soup.find_all("div",class_="js-tweet-text-container")

# tweet account id
#g_data = soup.find_all("span",class_="username js-action-profile-name")

# tweet account holder screen name
#g_data = soup.find_all("strong",class_="fullname js-action-profile-name show-popup-with-id")

# tweet Geo location
#g_data = soup.find_all("span",class_="Tweet-geo u-floatRight js-tooltip")

# tweet time
#g_data = soup.find_all("span",class_="metadata")

# ^^^^^^^^^ Count of "Retweet" & "LIKE" for this tweet - share same class\tag . So need parent tags to classify 
#g_data = soup.find_all("span",class_="ProfileTweet-actionCountForPresentation")

#===============================================================================================================
#
# If any original tweet is quoted by the tweet info above , then the original tweet info can be found from below   
#
#===============================================================================================================

# Original tweet - original tweet which was quoted
#g_data = soup.find_all("div",class_="QuoteTweet-text tweet-text u-dir")


# Original tweet author Full Name
#g_data = soup.find_all("b",class_="QuoteTweet-fullname u-linkComplex-target")


# Original tweet author Twitter Name
#g_data = soup.find_all("span",class_="QuoteTweet-screenname u-dir")


for item in g_data:
    #print item.prettify()
    print item.text