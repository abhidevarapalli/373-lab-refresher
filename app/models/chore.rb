class Chore < ApplicationRecord
    belongs_to :child
    belongs_to :task

    validates_date :due_on

    scope :pending, -> {where(completed: false)}
    scope :done, -> {where(completed: true)}
    scope :upcoming, -> {where('due_on >=?', Date.today)}
    scope :past, -> {where('due_on <?', Date.today)}
    scope :by_task, -> { order('task.name') }
    scope :chronological, -> { order('due_on') }

    def status
        if self.completed == true
            return "Completed"
        else
            return "Pending"
        end
    end
end
