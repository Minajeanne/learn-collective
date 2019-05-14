lesson_names = %w(
   Create-Action
   Create-Action-Lab
   Index-Show-New-Create-Lab
   Edit/Update-Action
   form_for-on-Edit
   Strong-Params-Basics
)

lesson_names.each do |name|
   Lesson.find_or_create_by(name: name) do |l|
      l.category = "Rails"
      l.section = "CRUD with Rails"
   end
end