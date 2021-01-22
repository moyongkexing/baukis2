class Admin::StaffEventsController < Admin::Base
    def index
        if params[:staff_member_id]
            @staff_member = StaffMember.find_by(id: params:[:staff_member_id])
            @events = @staff_member.events.order(occurred_at: :desc)
        else
            @events = StaffEvents.order(:occurred_at: :desc)
        end
    end
end
