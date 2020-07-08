class TaskBlueprint < Blueprinter::Base
  identifier :id

  view :public do
    fields :episode, :date, :title, :created_at, :updated_at
  end

  view :with_login do
    include_view :public
    field :completed do |object, options|
      unless object.title == "cancel"
        object.statuses.find_by(user_id: options[:current_user_id]).completed
      end
    end
  end
end
