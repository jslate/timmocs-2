PAGES = %w(
  index
  timmocs_are_not_people
  ved
  individuals
  generations
  what_is_branch
  what_is_branch_2
  merging
  two_parents
  individual
  individual_2
  conflict_question
  cherry_pick_pre
  cherry_pick
  note_applied
  cherry_pick_skip
  no_hair
  rebase
  rebase_2
  rebase_diffs
  more_rebase
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
        link_to "#{PAGES[i-1]}.html" do
          content_tag 'div', '&lt; previous', class: 'button'
        end
      end
    end
  end
  def next_page
    current_index.try do |i|
      PAGES[i+1].try do |page|
        link_to "#{page}.html" do
          content_tag 'div', 'next &gt;', class: 'button next'
        end
      end
    end
  end
  def text(string)
    content_tag 'p', string.gsub(/(\S*)\s(\S*)\./, '\1&nbsp;\2.')
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
