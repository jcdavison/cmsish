module PublishableHelper
  def self.included(base)
    base.send(:include, AASM)

    base.send(:aasm, column: 'aasm_state') do
      state :draft, :initial => true
      state :published

      event :publish do
        transitions :from => :draft, :to => :published
      end

      event :unpublish do
        transitions :from => :published, :to => :draft
      end
    end
  end

  def toggle_published!
    if published?
      unpublish!
    else
      publish!
    end
  end
end
