class TaskBlueprint < Blueprinter::Base
  identifier :id

  view :public do
    fields :episode, :date, :title, :created_at, :updated_at
  end

  view :with_login do
    include_view :public
    field :completed do |object, options|
      unless object.title == "cancel"
        object.completed_by?(options[:current_user_id])
      end
    end
  end
end
