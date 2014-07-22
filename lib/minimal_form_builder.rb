class MinimalFormBuilder < SimpleForm::FormBuilder
  def input(attribute_name, options = {}, &block)
    if options[:placeholder].nil?
      options[:placeholder] ||= if object.class.respond_to?(:human_attribute_name)
        object.class.human_attribute_name(attribute_name.to_s)
      else
        attribute_name.to_s.humanize
      end
    end
    options[:label] = false if options[:label].nil?

    super
  end
end
