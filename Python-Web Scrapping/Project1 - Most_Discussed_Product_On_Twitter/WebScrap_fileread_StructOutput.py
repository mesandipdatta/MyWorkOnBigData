# Twitter HTML Page Data Parsing
# This script reads and parses data from Twitter page (saved as HTML) and extracts below data as Output
# "Twitter Text","Account Id","Name","Geo Location","Time of tweet","Language","EMC Product"
# 
# Author - Sandip Datta 

import requests
from bs4 import BeautifulSoup
import os , sys , re , csv
reload(sys)
sys.setdefaultencoding('utf-8')

# Twitter Language Dictionary 
Lang_dict = {'en': 'English',
             'ar': 'Arabic',
             'bn': 'Bengali',
             'cs': 'Czech',
             'da': 'Danish',
             'de': 'German',
             'e1': 'Greek',
             'es': 'Spanish',
             'fa': 'Persian',
             'fi': 'Finnish',
             'fil': 'Filipino',
             'fr': 'French',
             'he': 'Hebrew',
             'hi': 'Hindi',
             'hu': 'Hungarian',
             'id': 'Indonesian',
             'it': 'Italian',
             'ja': 'Japanese',
             'ko': 'Korean',
             'msa': 'Malay',
             'nl': 'Dutch',
             'no': 'Norwegian',
             'pl': 'Polish',
             'pt': 'Portuguese',
             'ro': 'Romanian',
             'ru': 'Russian',
             'sv': 'Swedish',
             'th': 'Thai',
             'tr': 'Turkish',
             'uk': 'Ukrainian',
             'ur': 'Urdu',
             'vi': 'Vietnamese',
             'zh-cn': 'Chinese (Simplified)',
             'zh-tw': 'Chinese (Traditional)',
            };


# Change ====================================================================================================
path = "C:/Users/dattas6/Desktop/twitter";
os.chdir(path)
dirs = os.listdir(path)

# Change ====================================================================================================
soup = BeautifulSoup(open("Ecs_Jan_to_March.html"),"lxml")
product_name = "ECS"

# Get the High Level info container for each tweet 
# This Container will contain all info related to a tweet - List . One list for one tweet.
g_data = soup.find_all("div",class_="content")

list_of_rows = []

for item in g_data:

    #print item
    list_of_cells = []

    #1 Tweet text
    tweet_data = item.find("div",class_="js-tweet-text-container")
    #print tweet_data.text
    tdp = tweet_data.text
    tdp = tdp.strip()          # Should strip off leading and end whitespaces.But did only leading.So used below .
    tdp = tdp.rstrip('\r|\n')  # Removes whitespaces from end or rightside of the string
    print tdp
    list_of_cells.append(tdp)
    

    #2 Tweet Account Id
    tweet_acc_id = item.find("span",class_="username js-action-profile-name")
    #print tweet_acc_id.text
    taip = tweet_acc_id.text
    list_of_cells.append(taip)
    

    #3 Tweet Acc Holder Name
    tweet_acc_name = item.find("strong",class_="fullname js-action-profile-name show-popup-with-id")
    #print tweet_acc_name.text
    if tweet_acc_name is None:
        tanp = ""
    else:
        tanp = tweet_acc_name.text
    list_of_cells.append(tanp)
    

    #4 tweet Geo Location 
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


    #5 tweet date   
    #tweet_time = item.find("span",class_="_timestamp js-short-timestamp ") 
    
    t1 = item.find("a",class_="tweet-timestamp js-permalink js-nav js-tooltip")
    t2 = t1.get("title")
    tweet_time = t2
    list_of_cells.append(tweet_time)


    #6 tweet Language
    tweet_lang = item.find("p",class_="TweetTextSize  js-tweet-text tweet-text")
    
    if tweet_lang is None:
        lang = "No Lang Value"
    else:
        lang = tweet_lang.get("lang")

    if lang is None:
        lang = "No Lang Value"     

    #print lang 
    if Lang_dict.has_key(lang):
        lang_actual = Lang_dict[lang]
    else:
        lang_actual = lang
    print lang_actual
    list_of_cells.append(lang_actual)


    # Change ============================================================================================
    #7 Product name
    list_of_cells.append(product_name)

    list_of_rows.append(list_of_cells)



    #print "%s,%s,%s,%s,%s"%(tdp,taip,tanp,tglp,ttp)

    print ("############################################################################################")

# Output file
# Change ================================================================================================
outfile = open("C:/Users/dattas6/Desktop/twitter/EMC_Product_Extract.csv","ab")
writer = csv.writer(outfile)
# Change ================================================================================================
writer.writerow(["Twitter Text","Account Id","Name","Geo Location","Time of tweet","Language","EMC Product"])
writer.writerows(list_of_rows)
outfile.close()

