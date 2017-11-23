ActiveAdmin.register Company do
  permit_params :logotype, :name, :description

  index do
    selectable_column
    id_column
    column :name
    column :description do |company|
      company.description.html_safe
    end
    column :logotype do |company|
        company.logotype.present? \
        ? image_tag(company.logotype.url(:thumb))
        : content_tag(:span, "no logotype yet")
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description do
        company.description.html_safe
      end
      row :logotype do
        image_tag(company.logotype.url(:thumb))
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, as: :froala_editor, input_html:
                     {data: {options:
                     {toolbarButtons: ['undo', 'redo', '|', 'bold', 'italic']}}}
      f.input :logotype, hint: f.object.logotype.present? \
        ? image_tag(f.object.logotype.url(:thumb))
        : content_tag(:span, "no cover page yet")
      # f.input :logotype_cache, as: :hidden
    end
    f.actions
  end


end
