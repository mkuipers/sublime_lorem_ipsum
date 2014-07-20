import sublime, sublime_plugin
import urllib
import urllib2



class PromptLoremIpsumCommand(sublime_plugin.WindowCommand):
  def run(self):
    self.window.show_input_panel("Number of Paragraphs:", "1", self.on_done, None, None)

  def on_done(self, input_value):
    # TODO: cry yourself to sleep tonight because you're so ashamed of this
    try:
      self.window.active_view().run_command('lorem_ipsum', { "paragraphs": int(input_value), "template": None } )
    except (ValueError):
      self.window.active_view().run_command('lorem_ipsum', { "paragraphs": None, "template": input_value } )


class LoremIpsumCommand(sublime_plugin.TextCommand):
  def run(self, edit, paragraphs, template):
    sels = self.view.sel()
    for sel in sels:
      try:
        if template is None:
          data = urllib.urlencode({'paragraphs': paragraphs})
        else:
          data = urllib.urlencode({'template': template})
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