helpers do

  def cmds(&block)
    content_for :code_container do
      capture(&block).split(/\n/).map{|line|cmd_line(line)}.join
    end
  end

  def get_pages
    File.readlines('pages.txt').map(&:chomp)
  end
  def current_index
    get_pages.index(current_page.path.split('.').first)
  end
  def previous_page
    current_index.try do |i|
      if i > 0
        content_tag :a, href: "#{get_pages[i-1]}.html", id: 'previous_link' do
          content_tag 'div', '&lt; previous', class: 'button'
        end
      end
    end
  end
  def next_page
    current_index.try do |i|
      get_pages[i+1].try do |page|
        content_tag :a, href: "#{page}.html", id: 'next_link' do
          content_tag 'div', 'next &gt;', class: 'button next'
        end
      end
    end
  end
  def text(string)
    content_tag 'p', string.gsub(/(\S*)\s(\S*)\./, '\1&nbsp;\2.')
  end

  def cmd_line(string)
    if %w(First, Switched Updating Fast-forward create).include? string.split(/\s+/).first
      content_tag :div, string.gsub(/\A\!/, '') + '&nbsp;'
    elsif string =~ /\d+\s/
      content_tag :div, string.gsub(/\A\!/, '') + '&nbsp;'
    elsif string =~ /\A\[/
      cmd(string)
    elsif string =~ /\A\!/
      content_tag :div, string.gsub(/\A\!/, '') + '&nbsp;'
    else
      commit_line(string)
    end
  end

  def cmd(string)
    string.gsub(/(\[\w+\]:) (.*)/, '<div class="cmd"><span class="branch">\1</span> \2</div>' + "\n")
  end

  def commit_line(string)
    if string =~ /commit (\w{40})/
      string.gsub(/commit (\w{40})/, '<div>commit <span class="hash">\1</span></div>')
    elsif string =~ /->/
      string.gsub(/(\w{7}) \((\w+) -> ([\w,\s]+)\) (.*)/, '<div><span class="hash">\1</span> (<span class="branch">\2</span> -> <span class="branch">\3</span>) \4')
    else
      string.gsub(/(\w{7}) (.*)/, '<div><span class="hash">\1</span> \2')
    end
  end

end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
end
