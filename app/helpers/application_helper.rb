module ApplicationHelper
   def markdown(text)
      options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
      }

      extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)
      markdown.render(text).html_safe unless text == nil
   end


   def update_buttons(contribution)
      if contribution.user == current_user
         button_to "Edit", contribution_path(contribution)
      end
   end
end
