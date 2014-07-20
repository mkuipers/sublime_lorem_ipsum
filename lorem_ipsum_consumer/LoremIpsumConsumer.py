import sublime, sublime_plugin
import urllib
import urllib2

class LoremIpsumCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    sels = self.view.sel()
    for sel in sels:
      try:
        data = urllib.urlencode({'paragraphs': 5})
        request = urllib2.Request('http://lorem-ipsum-provider.dev/filler.json?' + data)
        http_file = urllib2.urlopen(request, timeout=10)
        self.view.replace(edit, sel, http_file.read())
        return
      except (urllib2.HTTPError) as (e):
          err = '%s: HTTP error %s contacting API' % (__name__, str(e.code))
      except (urllib2.URLError) as (e):
          err = '%s: URL error %s contacting API' % (__name__, str(e.reason))
      sublime.error_message(err)
      self.result = False