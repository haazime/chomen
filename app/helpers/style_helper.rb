module StyleHelper

  def fa_icon_tt(title, *args)
    content_tag(:span, class: 'pointed', data: { toggle: :tooltip, title: title }) do
      fa_icon(*args)
    end
  end

  def web_fonts_tag
    script = <<-EOS
WebFontConfig = {
  google: { families: [ 'Montserrat:400,700:latin' ] }
};
(function() {
  var wf = document.createElement('script');
  wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
  wf.type = 'text/javascript';
  wf.async = 'true';
  var s = document.getElementsByTagName('script')[0];
  s.parentNode.insertBefore(wf, s);
})();
    EOS
    javascript_tag(script)
  end
end
