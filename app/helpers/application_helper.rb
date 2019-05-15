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

   def auth_buttons
      if user_signed_in?
         button_to "Sign Out", destroy_user_session_path, method: :delete
      else
         button_to "Sign In", new_user_session_path, method: :get
      end
   end
end
