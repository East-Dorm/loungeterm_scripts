#!/usr/bin/python3

from collections import namedtuple
import json
import re
import requests
import sys

VideoData = namedtuple("VideoData", ['id', 'url', 'title'])

def yt_search_url(query):
    """Convert a search query into the url for searching that query on youtube"""
    return "https://www.youtube.com/results?search_query=" + query.replace(" ", "+")

def parse_search_results(query):
    """Perform a youtube search and output the resulting videos as a list"""
    def parse_video_data(video_json):
        from pprint import pprint
        pprint(video_json)
        id = video_json["videoRenderer"]["videoId"]
        url = "https://www.youtube.com/watch?v={}".format(id)
        title = video_json["videoRenderer"]["title"]["runs"][0]["text"]
        return VideoData(id, url, title)
    content = requests.get(yt_search_url(query)).text
    pattern = re.compile("var ytInitialData = ([^;]*);");
    match = pattern.search(content)
    if match is None:
        print("Could not find json blob in data", file=sys.stderr)
        return None
    data = json.loads(match.group(1))
    videos = data["contents"]["twoColumnSearchResultsRenderer"] \
                 ["primaryContents"]["sectionListRenderer"]["contents"][0] \
                 ["itemSectionRenderer"]["contents"]
    return [parse_video_data(video) for video in videos]

def parse_html(inputfile):
  f = open(inputfile)
  content = f.read()
  pattern = re.compile(r'/watch\?v=([0-9a-zA-Z\-_]+)"')
  url = None
  return ["https://www.youtube.com/watch?v={}".format(match.group(1)) for match in re.finditer(pattern, content)]


def main():
    inputs = sys.argv
    if len(inputs) == 2:
      urls = parse_html(inputs[1])
      if len(urls) == 0:
          print("Could not find video urls")
          sys.exit(1)
      else:
        print("\n".join(urls))
    else:
      print("No input file given!")
      sys.exit(1)

if __name__ == '__main__':
    main()
