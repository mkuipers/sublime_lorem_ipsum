import sublime, sublime_plugin
import urllib
import urllib2
import threading

class LoremIpsumCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    try:
      data = urllib.urlencode({'paragraphs': 5})
      request = urllib2.Request('http://lorem-ipsum-provider.dev/filler.json?' + data)
      http_file = urllib2.urlopen(request, timeout=10)
      self.view.insert(edit, 0, http_file.read())
      return
    except (urllib2.HTTPError) as (e):
        err = '%s: HTTP error %s contacting API' % (__name__, str(e.code))
    except (urllib2.URLError) as (e):
        err = '%s: URL error %s contacting API' % (__name__, str(e.reason))
    sublime.error_message(err)
    self.result = False