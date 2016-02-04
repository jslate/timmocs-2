PAGES = %w(
  index
  timmocs_are_not_people
  timmocs_are_not_people_2
  adamant
  ved
  generations
  branch_pointers
  branch_pointers_2
  branch_pointers_head
  branch_pointers_head_2
  what_is_branch
  what_is_branch_2
  branch_moved_forward
  branch
  branch_2
  branch_update_point
  branch_update_point_2
  branch_update_point_3
  branch_update_point_4
  merging
  two_parents
  individual
  individual_2
  conflict_question
  ved_intervene
  cherry_pick_pre
  cherry_pick_pre_2
  cherry_pick
  note_applied
  cherry_pick_skip
  no_hair
  rebase
  rebase_2
  rebase_diffs
  more_rebase
  more_rebase_2
  more_rebase_3
  rebase_re_apply
  rebase_really
  rebased
  thats_all
)

helpers do
  def current_index
    PAGES.index(current_page.path.split('.').first)
  end
  def previous_page
    current_index.try do |i|
      if i > 0
        content_tag :a, href: "#{PAGES[i-1]}.html" do
          content_tag 'div', '&lt; previous', class: 'button'
        end
      end
    end
  end
  def next_page
    current_index.try do |i|
      PAGES[i+1].try do |page|
        content_tag :a, href: "#{page}.html" do
          content_tag 'div', 'next &gt;', class: 'button next'
        end
      end
    end
  end
  def text(string)
    content_tag 'p', string.gsub(/(\S*)\s(\S*)\./, '\1&nbsp;\2.')
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
