import requests
from bs4 import BeautifulSoup
import os , sys , re , csv
reload(sys)
sys.setdefaultencoding('utf-8')

path = "C:/Users/dattas6/Desktop/twitter";
os.chdir(path)
dirs = os.listdir(path)


soup = BeautifulSoup(open("twitter2.html"),"lxml")

# Get the High Level info container for each tweet 
# This Container will contain all info related to a tweet - List . One list for one tweet.
g_data = soup.find_all("div",class_="content")

list_of_rows = []

for item in g_data:

    #print item
    list_of_cells = []

    # Tweet text
    tweet_data = item.find("div",class_="js-tweet-text-container")
    #print tweet_data.text
    tdp = tweet_data.text
    tdp = tdp.strip()          # Should strip off leading and end whitespaces.But did only leading.So used below .
    tdp = tdp.rstrip('\r|\n')  # removes whitespaces from end or rightside of the string
    print tdp
    list_of_cells.append(tdp)
    

    # Tweet Account Id
    tweet_acc_id = item.find("span",class_="username js-action-profile-name")
    #print tweet_acc_id.text
    taip = tweet_acc_id.text
    list_of_cells.append(taip)
    

    # Tweet Acc Holder Name
    tweet_acc_name = item.find("strong",class_="fullname js-action-profile-name show-popup-with-id")
    tanp = tweet_acc_name.text
    #print tweet_acc_name.text
    list_of_cells.append(tanp)
    
    # tweet Geo Location 
    tweet_geo_location = item.find("span",class_="Tweet-geo u-floatRight js-tooltip")
    if tweet_geo_location is None:
       #print "No Geo Location" 
       tglp = ""
       list_of_cells.append(tglp)
    else:
       tglp = tweet_geo_location.text
       tglp = tglp.strip()
       list_of_cells.append(tglp)
       print tweet_geo_location.text


    #tweet date   
    tweet_time = item.find("span",class_="_timestamp js-short-timestamp ") 
    if tweet_time is None:
    	#print "No time info"
    	ttp = ""
    else:
        #print tweet_time.text
        ttp = tweet_time.text
    list_of_cells.append(ttp)
    
    
    list_of_rows.append(list_of_cells)

    #print "%s,%s,%s,%s,%s"%(tdp,taip,tanp,tglp,ttp)

    print ("############################################################################################")

# Output file
outfile = open("C:/Users/dattas6/Desktop/twitter/twitter_extract2.csv","wb")
writer = csv.writer(outfile)
writer.writerow(["Twitter Text", "Account Id", "Name", "Geo Location", "Time of tweet"])
writer.writerows(list_of_rows)
#writer.close()

    
    

